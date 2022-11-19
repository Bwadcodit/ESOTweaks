local GS = GetString
local checkedT = "esoui/art/buttons/checkbox_checked.dds"
local uncheckedT = "esoui/art/buttons/checkbox_unchecked.dds"
local helpSections = {}
local helpOversections = {}
local impExpChoices = {}
local initOpen = false

local function initCSPSHelp()
	local helpOversectionsCtr = CSPSWindowHelpSection:GetNamedChild("Oversections")
	local ovBefore = 0
	for i=1, 42 do
		local myTitle = GS("CSPS_Help_Head", i)
		if myTitle == "" then break end
		local myText = GS("CSPS_Help_Sect", i)
		local myOversection = GS("CSPS_Help_Oversection", i)
		helpSections[i] = WINDOW_MANAGER:CreateControlFromVirtual("CSPSWindowHelpSectionSection"..i, CSPSWindowHelpSection, "CSPSHelpSectionPres")
		local ctrBefore = helpOversectionsCtr
		if myOversection ~= "" then
			helpOversections[i] = WINDOW_MANAGER:CreateControlFromVirtual("CSPSWindowHelpSectionOversection"..i, CSPSWindowHelpSectionOversections, "CSPSHelpOversectionPres")
			if i == 1 then
				helpOversections[i]:SetAnchor(TOPLEFT, helpOversectionsCtr, TOPLEFT, 0, 0)
				helpOversectionsCtr:SetWidth(100)
			else
				helpOversections[i]:SetAnchor(LEFT, helpOversections[ovBefore], RIGHT, 5, 0)
				helpOversectionsCtr:SetWidth(helpOversectionsCtr:GetWidth()+105)
			end
			helpOversections[i]:SetText(myOversection)
			helpOversections[i].myIndex = i
			ovBefore = i
		end
		if i > 1 and i ~= ovBefore then ctrBefore = helpSections[i-1] end
		helpSections[i]:SetAnchor(TOP, ctrBefore, BOTTOM, 0, 5)
		helpSections[i]:GetNamedChild("Btn"):SetText(myTitle)
		helpSections[i]:GetNamedChild("Btn").myIndex = i
		helpSections[i]:GetNamedChild("Btn"):SetHeight(0)
		helpSections[i]:GetNamedChild("Btn"):SetHidden(true)
		helpSections[i]:GetNamedChild("Lbl").auxText = myText
	end
end

function CSPS.showHelp()
	if #helpSections == 0 then initCSPSHelp() end
	CSPSWindowHelpSection:SetHidden(not CSPSWindowHelpSection:IsHidden())
end

function CSPS:InitLocalText()
	-- Loading localized text data
		
	ESO_Dialogs[CSPS.name.."_OkDiag"] = {
		canQueue = true,
		uniqueIdentifier = CSPS.name.."_OkDiag",
		title = {text = "<<1>>"},
		mainText = {text = "<<1>>"},
		buttons = {
			[1] = {
				text = SI_DIALOG_CONFIRM,
				callback =  function(dialog) if dialog.data.returnFunc then dialog.data.returnFunc() end CSPS.toggleMouse(true) end,
			},
		},
		setup = function() end,
	}
	ESO_Dialogs[CSPS.name.."_OkCancelDiag"] = {
		canQueue = true,
		uniqueIdentifier = CSPS.name.."_OkCancelDiag",
		title = {text = "<<1>>"},
		mainText = {text = "<<1>>"},
		buttons = {
			[1] = {
				text = SI_DIALOG_CONFIRM,
				callback =  function(dialog) dialog.data.returnFunc() CSPS.toggleMouse(true) end,
			},
			[2] = {
				text = SI_DIALOG_CANCEL,
				callback =  function(dialog) if dialog.data.cancelFunc then dialog.data.cancelFunc() end CSPS.toggleMouse(true) end,
			},
		},
		setup = function() end,
	}	
	ESO_Dialogs[CSPS.name.."_YesNoDiag"] = {
		canQueue = true,
		uniqueIdentifier = CSPS.name.."_YesNoDiag",
		title = {text = GS(CSPS_MyWindowTitle)},
		mainText = {text = "<<1>>"},
		buttons = {
			[1] = {
				text = SI_DIALOG_YES,
				callback = function(dialog) dialog.data.yesFunc() CSPS.toggleMouse(true) end,
			},
			[2] = {
				text = SI_DIALOG_NO,
				callback = function(dialog) dialog.data.noFunc() CSPS.toggleMouse(true) end,
			},
			},
		setup = function() end,
	}
	ESO_Dialogs[CSPS.name.."_RenameProfile"] = {
		canQueue = true,
		uniqueIdentifier = CSPS.name.."_RenameProfile",
		title = {text = GS(CSPS_MyWindowTitle)},
		mainText = {text = GS(CSPS_MSG_RenameProfile)},
		editBox = {},
		buttons = {
			[1] = {
				text = SI_DIALOG_CONFIRM,
				callback = function(dialog)
					local txt = ZO_Dialogs_GetEditBoxText(dialog)
					if txt ~= "" and dialog.data ~= nil then 
						CSPS.cp2ProfileRenameGo(txt, dialog.data.myId, dialog.data.myType) 
					elseif txt ~= "" then
						CSPS.renameProfileGo(txt) 
					end
					CSPS.toggleMouse(true)
				end,
			},
			[2] = {
				text = SI_DIALOG_CANCEL,
				callback = function() CSPS.toggleMouse(true) end,
			},
			},
		setup = function() end,
	}
	
	CSPS.fillSrcCombo()
	CSPS.fillProfileCombo()
end


function CSPS.OnWindowMoveStop()
	CSPS.savedVariables.settings.left = CSPSWindow:GetLeft()
	CSPS.savedVariables.settings.top = CSPSWindow:GetTop()
	CSPS.toggleMouse(true)
end

function CSPS.OnWindowResizeStop()
	CSPS.savedVariables.settings.width = CSPSWindow:GetWidth()
	CSPS.savedVariables.settings.height = CSPSWindow:GetHeight()
end

function CSPS:RestorePosition()
  local left = CSPS.savedVariables.settings.left
  local top = CSPS.savedVariables.settings.top
  CSPSWindow:ClearAnchors()
  CSPSWindow:SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, left, top)
  CSPSWindow:SetWidth(CSPS.savedVariables.settings.width or 605)
  CSPSWindow:SetHeight(CSPS.savedVariables.settings.height or 780)
  if CSPS.savedVariables.settings.hbleft == nil then return end
  local hbleft = CSPS.savedVariables.settings.hbleft
  local hbtop = CSPS.savedVariables.settings.hbtop
  CSPSCpHotbar:ClearAnchors()
  CSPSCpHotbar:SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, hbleft, hbtop)
end

local function changeButtonTextures(btnCtr, differentTextures, sameTextures)
	btnCtr:SetNormalTexture(sameTextures or differentTextures.."_up.dds")
	btnCtr:SetMouseOverTexture(sameTextures or differentTextures.."_over.dds")
	btnCtr:SetPressedTexture(sameTextures or differentTextures.."_down.dds")
end

function CSPS.showElement(myElement, arg)
	if myElement == "checkCP" then
		if CSPS.unlockedCP == false then
			CSPSWindowIncludeCPCheck1:SetHidden(true)
			CSPSWindowIncludeCPCheck2:SetHidden(true)
			CSPSWindowIncludeCPCheck3:SetHidden(true)
			CSPSWindowIncludeCPLabel:SetHidden(true)
			CSPSWindowBuildCPProfileGreen:SetHidden(true)
			CSPSWindowBuildCPProfileRed:SetHidden(true)
			CSPSWindowBuildCPProfileBlue:SetHidden(true)
			CSPSWindowIncludeBtnApplyCP:SetHidden(true)
		else
			CSPSWindowIncludeCPCheck1:SetHidden(false)
			CSPSWindowIncludeCPCheck2:SetHidden(false)
			CSPSWindowIncludeCPCheck3:SetHidden(false)
			CSPSWindowIncludeCPLabel:SetHidden(false)
			CSPSWindowBuildCPProfileGreen:SetHidden(false)
			CSPSWindowBuildCPProfileRed:SetHidden(false)
			CSPSWindowBuildCPProfileBlue:SetHidden(false)
			CSPSWindowIncludeBtnApplyCP:SetHidden(false)
		end
	elseif myElement == "cp2barlabels" then
		if arg ~= nil then CSPS.cp2BarLabels = arg else CSPS.cp2BarLabels = not CSPS.cp2BarLabels end
		local cp2BL = CSPS.cp2BarLabels
		local myCtrl = CSPSWindowCP2Bar
		if cp2BL == true then
			changeButtonTextures(myCtrl:GetNamedChild("ToggleLabels"), "esoui/art/buttons/large_rightarrow")
			myCtrl:SetWidth(242)
		else 
			changeButtonTextures(myCtrl:GetNamedChild("ToggleLabels"), "esoui/art/buttons/large_leftarrow")
			myCtrl:SetWidth(38)
		end
		for i=1, 3 do
			for j=1,4 do 
				CSPSWindowCP2Bar:GetNamedChild("Label"..i.."_"..j):SetHidden(not cp2BL)
			end
		end

	elseif myElement == "load" then
		if arg ~= nil then CSPSWindowBuildLoad:SetHidden(not arg) return end
		if not CSPS.currentCharData or not CSPS.currentCharData.werte or not CSPS.currentCharData.werte.prog then
			CSPSWindowBuildLoad:SetHidden(true)
		else
			CSPSWindowBuildLoad:SetHidden(false)
		end
	elseif myElement == "save" then
		if arg ~= nil then CSPSWindowBuildSave:SetHidden(not arg) end
	elseif myElement == "apply" then
		if arg ~= nil then
			CSPS.showApply = arg
			CSPSWindowInclude:SetHidden(not arg)
			if arg == true then
				CSPSWindowInclude:SetHeight(24)
			else
				CSPSWindowInclude:SetHeight(24)
			end
		end
	elseif myElement == "hotbar" then
		if arg == false then
			CSPSWindowFooter:SetHidden(true)
			CSPSWindowFooter:SetHeight(3)
			CSPSWindowOptionsChkHotbar:SetTexture(uncheckedT)
		else
			CSPSWindowFooter:SetHidden(false)
			CSPSWindowFooter:SetHeight(46)
			CSPSWindowOptionsChkHotbar:SetTexture(checkedT)
		end
	elseif myElement == "cpProfiles" then
		local showMe = CSPSWindowCPProfiles:IsHidden()
		if arg ~= nil then showMe = arg end
		CSPSWindowCPProfiles:SetHidden(not showMe)
		if (not CSPSWindowCPImport:IsHidden() and showMe == true) or not CSPSWindowCPProfiles:IsHidden() then
			CSPS.showElement("apply", true)
			CSPS.showElement("save", true)
			CSPS.unsavedChanges = true
		end
		CSPSWindowCPImport:SetHidden(true)
		if showMe then CSPSWindowCPProfiles:SetHeight(320) else CSPSWindowCPProfiles:SetHeight(0) end
	elseif myElement == "cpImport" then
		local showMe = CSPSWindowCPImport:IsHidden()
		if arg ~= nil then showMe = arg end
		if not CSPSWindowCPImport:IsHidden() then
			CSPS.showElement("apply", true)
			CSPS.showElement("save", true)
			CSPS.unsavedChanges = true
			CSPS.inCpRemapMode = false
			cpDisciToMap = nil
			cpSkillToMap = nil
		end
		CSPSWindowCPProfiles:SetHidden(true)
		CSPSWindowCPImport:SetHidden(not showMe)
		if showMe then CSPSWindowCPProfiles:SetHeight(320) else CSPSWindowCPProfiles:SetHeight(0) end
	end
	
end

function CSPS.toggleOptional()
	--[[ClearMenu()
	
	AddCustomMenuItem(GS(CSPS_CPBar_Manage), function() CSPS.toggleManageBars(true) end)
	local chkBoxIndex = AddCustomMenuItem(GS(CSPS_ShowHb), function() CSPS.toggleHotbar() end, MENU_ADD_OPTION_CHECKBOX)
	ZO_Menu.items[chkBoxIndex].checked = function()  return CSPS.showHotbar  end
	AddCustomMenuItem(GS(CSPS_Tooltiptext_Optional), function() CSPS.openLAM() end)
	
	ShowMenu()
	if true then return end]]--
	CSPSWindowOptions:SetHidden(not CSPSWindowOptions:IsHidden())
	if not CSPSWindowOptions:IsHidden() then EVENT_MANAGER:RegisterForEvent(CSPS.name, EVENT_GLOBAL_MOUSE_DOWN, CSPS.hideOptions) end
end

function CSPS.hideOptions()
	local control = WINDOW_MANAGER:GetMouseOverControl()
	if control == CSPSWindowOptions or control:GetParent() == CSPSWindowOptions or control == CSPSWindowOptionalButton then return end
	CSPSWindowOptions:SetHidden(true)
	EVENT_MANAGER:UnregisterForEvent(CSPS.name, EVENT_GLOBAL_MOUSE_DOWN)
end

local function autoShowCSPS(oldState, newState)
	if newState == SCENE_SHOWING then 
		if CSPS.useCustomIcons then CSPS.showCpBar() end
		if CSPS.cpAutoOpen then CSPSWindow:SetHidden(false) end
	elseif newState == SCENE_HIDDEN then
		if CSPS.cpAutoOpen then CSPSWindow:SetHidden(true) end
	end
end

function CSPS.toggleCPAutoOpen()
	CSPS.cpAutoOpen = CSPS.savedVariables.settings.cpAutoOpen
	CHAMPION_PERKS_SCENE:RegisterCallback("StateChange", autoShowCSPS)
end 

function CSPS.toggleArmoryAutoOpen()
	CSPS.armoryAutoOpen = CSPS.savedVariables.settings.armoryAutoOpen
	if not CSPS.armoryAutoOpen then return end
	SCENE_MANAGER:GetScene("armoryKeyboard"):RegisterCallback("StateChange", 
		function(oldState, newState)
			if not CSPS.armoryAutoOpen then return end
			if newState == SCENE_SHOWING then
				CSPSWindow:SetHidden(false)
			elseif newState == SCENE_HIDDEN then
				CSPSWindow:SetHidden(true) 
			end
		end
	)
end 


function CSPS.toggleCPCustomIcons()
	CSPS.useCustomIcons = CSPS.savedVariables.settings.useCustomIcons
	for i=1, 3 do
		CSPS.cp2HbIcons(i)
	end
	if CSPS.cpCustomBar then CSPS.showCpBar() end
end 

function CSPS.toggleCPCustomBar()
	CSPS.cpCustomBar = CSPS.savedVariables.settings.cpCustomBar
	if CSPS.cpCustomBar then 
		CSPS.HbRearrange()
		if CSPS.cpFragment == nil then CSPS.cpFragment = ZO_SimpleSceneFragment:New( CSPSCpHotbar ) end
		SCENE_MANAGER:GetScene('hud'):AddFragment( CSPS.cpFragment  )
		SCENE_MANAGER:GetScene('hudui'):AddFragment( CSPS.cpFragment  )
	else
		if CSPS.cpFragment ~= nil then
			SCENE_MANAGER:GetScene('hud'):RemoveFragment( CSPS.cpFragment )
			SCENE_MANAGER:GetScene('hudui'):RemoveFragment( CSPS.cpFragment )	
		end
	end
end 


function CSPS.toggleHotbar(arg)
	if CSPS.showHotbar == false or arg == true then
		CSPS.showHotbar = true
		CSPS.showElement("hotbar", true)
	else
		CSPS.showHotbar = false
		CSPS.showElement("hotbar", false)
	end
	CSPS.savedVariables.settings.showHotbar = CSPS.showHotbar
end

function CSPS.toggleManageBars(arg)
	if CSPSWindowManageBars:IsHidden() or arg == nil or arg == true then
		CSPS.barManagerRefreshGroup()
		CSPSWindowImportExport:SetHidden(true)
		CSPSWindowOptions:SetHidden(true)
		CSPSWindowMain:SetHidden(true)
		CSPSWindowcpHbHkNumberList:SetHidden(true) 
		CSPSWindowManageBars:SetHidden(false)
		CSPS.updateRole()
		CSPS.updatePrCombo(1)
		CSPS.updatePrCombo(2)
		CSPS.updatePrCombo(3)
	else
		CSPSWindowImportExport:SetHidden(true)
		CSPSWindowOptions:SetHidden(true)
		CSPSWindowManageBars:SetHidden(true)
		CSPSWindowMain:SetHidden(false)
	end
end

function CSPS.toggleImportExport(arg)
	if CSPSWindowImportExport:IsHidden() or arg == nil or arg == true then
		CSPSWindowImportExport:SetHidden(false)
		CSPSWindowOptions:SetHidden(true)
		CSPSWindowManageBars:SetHidden(true)
		CSPSWindowMain:SetHidden(true)
	else
		CSPSWindowImportExport:SetHidden(true)
		CSPSWindowOptions:SetHidden(true)
		CSPSWindowManageBars:SetHidden(true)
		CSPSWindowMain:SetHidden(false)
	end
end

local function toggleCheckbox(buttonName, arg)
	changeButtonTextures(GetControl(CSPSWindow, buttonName), nil, arg == true and checkedT or uncheckedT)
end

function CSPS.impExpAddInfo(myAlliance, myRace, myClass)
	CSPSWindowImportExportAllianceValue:SetColor(CSPS.colors.white:UnpackRGB())
	CSPSWindowImportExportRaceValue:SetColor(CSPS.colors.white:UnpackRGB())
	CSPSWindowImportExportClassValue:SetColor(CSPS.colors.white:UnpackRGB())
	if myAlliance == nil then 
		CSPSWindowImportExportAllianceValue:SetText("-")
	else
		CSPSWindowImportExportAllianceValue:SetText(zo_strformat("<<C:1>>", GetAllianceName(myAlliance)))
		if GetUnitAlliance('player') == myAlliance then
			CSPSWindowImportExportAllianceValue:SetColor(CSPS.colors.green:UnpackRGB())
		else
			CSPSWindowImportExportAllianceValue:SetColor(CSPS.colors.orange:UnpackRGB())
		end
	end
	if myRace == nil then 
		CSPSWindowImportExportRaceValue:SetText("-")
	else
		CSPSWindowImportExportRaceValue:SetText(zo_strformat("<<C:1>>", GetRaceName(GetUnitGender('player'), myRace)))
		if GetUnitRaceId('player') == myRace then
			CSPSWindowImportExportRaceValue:SetColor(CSPS.colors.green:UnpackRGB())
		else
			CSPSWindowImportExportRaceValue:SetColor(CSPS.colors.red:UnpackRGB())
		end
	end
	if myClass == nil then 
		CSPSWindowImportExportClassValue:SetText("-")
	else
		CSPSWindowImportExportClassValue:SetText(zo_strformat("<<C:1>>", GetClassName(GetUnitGender('player'), myClass)))
		if GetUnitClassId('player') == myClass then 
			CSPSWindowImportExportClassValue:SetColor(CSPS.colors.green:UnpackRGB())
		else
			CSPSWindowImportExportClassValue:SetColor(CSPS.colors.orange:UnpackRGB())
		end
	end
end

function CSPS.helpSectionBtn(control)
	for i, v in pairs(helpSections) do
		local myButton = v:GetNamedChild("Btn")	
		local myLabel = v:GetNamedChild("Lbl")		
		if i == control.myIndex then
			local r,g,b = CSPS.colors.green:UnpackRGB()
			myButton:GetNamedChild("BG"):SetCenterColor(r,g,b, 0.4)
			myLabel:SetText(myLabel.auxText)
		else
			myButton:GetNamedChild("BG"):SetCenterColor(0.0314, 0.0314, 0.0314)
			myLabel:SetText("")
		end
	end
end

function CSPS.helpOversectionBtn(control)
	
	for i, v in pairs(helpOversections) do
		if i == control.myIndex then
			local r,g,b = CSPS.colors.green:UnpackRGB()
			v:GetNamedChild("BG"):SetCenterColor(r, g, b, 0.4)
		else
			v:GetNamedChild("BG"):SetCenterColor(0.0314, 0.0314, 0.0314)
		end
	end
	local isInSection = false
	for i, v in pairs(helpSections) do
		local myButton = v:GetNamedChild("Btn")	
		local myLabel = v:GetNamedChild("Lbl")
		if i == control.myIndex then
			isInSection = true
		elseif isInSection and helpOversections[i] ~= nil then
			isInSection = false
		end
		if isInSection then
			myButton:SetHeight(28)
			myButton:SetHidden(false)
		else
			myButton:SetHeight(0)
			myButton:SetHidden(true)
			myButton:GetNamedChild("BG"):SetCenterColor(0.0314, 0.0314, 0.0314)
			myLabel:SetText("")
		end
	end
	
end



function CSPS.fillProfileCombo()
	-- tooltip 
	CSPSWindowBuildProfiles.data = {tooltipText = GS(CSPS_Tooltiptext_ProfileCombo)}
	CSPSWindowBuildProfiles:SetHandler("OnMouseEnter", ZO_Options_OnMouseEnter)
	CSPSWindowBuildProfiles:SetHandler("OnMouseExit", ZO_Options_OnMouseExit)

	CSPS.UpdateProfileCombo()
end

function CSPS.UpdateProfileCombo()
	CSPSWindowBuildProfiles.comboBox = CSPSWindowBuildProfiles.comboBox or ZO_ComboBox_ObjectFromContainer(CSPSWindowBuildProfiles)
	local myComboBox = CSPSWindowBuildProfiles.comboBox	
	myComboBox:ClearItems()
	myComboBox:SetSortsItems(true)
	
	-- d(os.date("%x", os.time()))
	local function OnItemSelect(choiceIndex)
		if CSPS.unsavedChanges == false or CSPS.currentProfile == 0 then -- TWEAK HERE ( TODO )
		-- old: if CSPS.unsavedChanges == false then
			CSPS.selectProfile(choiceIndex)
			CSPS.loadBuild()
			CSPS.tweakApplyFull() -- TWEAK HERE ( TODO )
		else 
			local name1 = CSPS.profiles[CSPS.currentProfile] and CSPS.profiles[CSPS.currentProfile].name or GS(CSPS_Txt_StandardProfile)
			local name2 = choiceIndex > 0 and CSPS.profiles[choiceIndex].name or GS(CSPS_Txt_StandardProfile)
			local myWarning = (not CSPSWindowCPProfiles:IsHidden()) and GS(CSPS_MSG_NoCPProfiles) or ""		
			ZO_Dialogs_ShowDialog(CSPS.name.."_OkCancelDiag", 
				{
					returnFunc = function() CSPS.selectProfile(choiceIndex) CSPS.loadBuild() CSPS.tweakApplyFull() end, -- TWEAK HERE ( TODO )
					cancelFunc = function() 
						local currentProfile = CSPS.currentProfile or 0
						if currentProfile == 0 then
							CSPSWindowBuildProfiles.comboBox:SetSelectedItem(GS(CSPS_Txt_StandardProfile))
						else
							CSPSWindowBuildProfiles.comboBox:SetSelectedItem(CSPS.profiles[currentProfile].name)
						end 
					end,
				},
				{
					mainTextParams = {zo_strformat(GS(CSPS_MSG__ChangeProfile), name1, name2, myWarning)}, 
					titleParams = {GS(CSPS_MyWindowTitle)}
				}
			)
		end
		PlaySound(SOUNDS.POSITIVE_CLICK)
	end
	
	local profileText = GS(CSPS_Txt_StandardProfile)
	profileText = CSPS.currentCharData.lastSaved and not CSPS.savedVariables.settings.suppressLastModified and string.format("%s (%s)", profileText, os.date("%x", CSPS.currentCharData.lastSaved)) or profileText
	myComboBox:AddItem(myComboBox:CreateItemEntry(profileText, function() OnItemSelect(0) end))
	
	for i, v in pairs(CSPS.profiles) do
		local profileText = v.name
		profileText = v.lastSaved and not CSPS.savedVariables.settings.suppressLastModified and string.format("%s (%s)", profileText, os.date("%x", v.lastSaved)) or profileText
		myComboBox:AddItem(myComboBox:CreateItemEntry(profileText, function() OnItemSelect(i) end))
	end
	
	if CSPS.currentProfile ~= 0 then 
		myComboBox:SetSelectedItem(CSPS.profiles[CSPS.currentProfile].name)
	else
		myComboBox:SetSelectedItem(GS(CSPS_Txt_StandardProfile))
	end
end

function CSPS.toggleImpExpSource(myChoice, fromList)
	CSPS.formatImpExp = myChoice
	CSPS.savedVariables.settings.formatImpExp = myChoice
	if not fromList then 
		for i,v in pairs(impExpChoices) do
			if v == myChoice then CSPSWindowImportExportSrcList.comboBox:SetSelectedItem(i) end
		end
	end
	if myChoice == "sf" then 
		CSPSWindowImportExportBtnImp1:SetHidden(false)
		CSPSWindowImportExportBtnExp1:SetHidden(false)
		CSPSWindowImportExportBtnImp1:SetText(GS(CSPS_ImpEx_BtnImpLink))
		CSPSWindowImportExportBtnImp1.tooltip = GS(CSPS_ImpEx_BtnImpTT)
		CSPSWindowImportExportTextEdit:SetText(GS(CSPS_ImpEx_Standard))
		CSPSWindowImportExportBtnExp1:SetText(GS(CSPS_ImpEx_BtnExpLink))
		CSPSWindowImportExportAddInfo:SetHidden(false)
		CSPSWindowImportExportHandleCP:SetHidden(true)
		CSPSWindowImportExportTransfer:SetHidden(true) 
		CSPSWindowImportExportText:SetHidden(false)
	elseif myChoice == "csvCP" then
		CSPSWindowImportExportBtnImp1:SetHidden(false)
		CSPSWindowImportExportBtnExp1:SetHidden(true)
		CSPSWindowImportExportBtnImp1:SetText(GS(CSPS_ImpEx_BtnImpText))
		CSPSWindowImportExportBtnImp1.tooltip = GS(CSPS_ImpEx_BtnImpTT)
		CSPSWindowImportExportAddInfo:SetHidden(true)
		CSPSWindowImportExportHandleCP:SetHidden(false)
		CSPSWindowImportExportCleanUpText:SetHidden(true)
		CSPSWindowImportExportBtnTextCPOrder1:SetHidden(true)
		CSPSWindowImportExportBtnTextCPOrder2:SetHidden(true)
		CSPSWindowImportExportBtnTextCPOrder3:SetHidden(true)
		CSPSWindowImportExportTransfer:SetHidden(true) 
		CSPSWindowImportExportText:SetHidden(false)
	elseif string.sub(myChoice, 1, 6) == "txtCP2" then
		CSPSWindowImportExportBtnImp1:SetHidden(false)
		CSPSWindowImportExportBtnExp1:SetHidden(false)
		CSPSWindowImportExportBtnExp1:SetText(GS(CSPS_ImpEx_BtnExpText))
		CSPSWindowImportExportBtnImp1:SetText(GS(CSPS_ImpEx_BtnImpText))
		CSPSWindowImportExportBtnImp1.tooltip = GS(CSPS_ImpEx_BtnImpTTCP)
		CSPSWindowImportExportTextEdit:SetText(GS(CSPS_ImpEx_CpAsText))
		CSPSWindowImportExportAddInfo:SetHidden(true)
		CSPSWindowImportExportHandleCP:SetHidden(false)
		CSPSWindowImportExportCleanUpText:SetHidden(false)
		CSPSWindowImportExportBtnTextCPOrder1:SetHidden(false)
		CSPSWindowImportExportBtnTextCPOrder2:SetHidden(false)
		CSPSWindowImportExportBtnTextCPOrder3:SetHidden(false)
		CSPSWindowImportExportTransfer:SetHidden(true) 
		CSPSWindowImportExportText:SetHidden(false)
		CSPS.toggleCPReverseImport()
	elseif myChoice == "transfer" then
		CSPSWindowImportExportBtnImp1:SetHidden(true)
		CSPSWindowImportExportBtnExp1:SetHidden(true)
		CSPSWindowImportExportText:SetHidden(true)
		CSPSWindowImportExportAddInfo:SetHidden(true)
		CSPSWindowImportExportHandleCP:SetHidden(true)
		CSPSWindowImportExportTransfer:SetHidden(false) 
		CSPS.updateTransferCombo(1)
	else
		CSPSWindowImportExportBtnImp1:SetHidden(true)
		CSPSWindowImportExportBtnExp1:SetHidden(false)
		CSPSWindowImportExportBtnExp1:SetText(GS(CSPS_ImpEx_BtnExpText))
		CSPSWindowImportExportAddInfo:SetHidden(true)
		CSPSWindowImportExportHandleCP:SetHidden(true)
		CSPSWindowImportExportTransfer:SetHidden(true) 
		CSPSWindowImportExportTextEdit:SetText("")
		CSPSWindowImportExportText:SetHidden(false)
	end
end

function CSPS.fillSrcCombo()
	CSPSWindowImportExportSrcList.comboBox = CSPSWindowImportExportSrcList.comboBox or ZO_ComboBox_ObjectFromContainer(CSPSWindowImportExportSrcList)
	local myComboBox = CSPSWindowImportExportSrcList.comboBox
	
	-- tooltip 
	CSPSWindowImportExportSrcList.data = {tooltipText = GS(CSPS_Tooltiptext_SrcCombo)}
	CSPSWindowImportExportSrcList:SetHandler("OnMouseEnter", ZO_Options_OnMouseEnter)
	CSPSWindowImportExportSrcList:SetHandler("OnMouseExit", ZO_Options_OnMouseExit)
	
	local choices = {
		["eso-skillfactory.com"] = "sf",
		[string.format("%s 1/3", GS(CSPS_ImpExp_TextSk))] = "txtSk1",
		[string.format("%s 2/3", GS(CSPS_ImpExp_TextSk))] = "txtSk2",
		[string.format("%s 3/3", GS(CSPS_ImpExp_TextSk))] = "txtSk3",
		[GS(CSPS_ImpExp_TextOd)] = "txtOd",
		[GS(CSPS_ImpExp_Transfer)] = "transfer",
		[GS(CSPS_ImpEx_CsvCP)] = "csvCP",
		[GS(CSPS_ImpEx_TxtCP2_1)] = "txtCP2_1",
		[GS(CSPS_ImpEx_TxtCP2_2)] = "txtCP2_2",
		[GS(CSPS_ImpEx_TxtCP2_3)] = "txtCP2_3",
	}
	
	impExpChoices = choices

	local function OnItemSelect(_, choiceText, choice)
		CSPS.toggleImpExpSource(choices[choiceText], true)
		PlaySound(SOUNDS.POSITIVE_CLICK)
	end

	myComboBox:SetSortsItems(true)
	
	for i,j in pairs(choices) do
		myComboBox:AddItem(myComboBox:CreateItemEntry(i, OnItemSelect))
		if CSPS.formatImpExp == j then
			myComboBox:SetSelectedItem(i)
		end
	end
end

function CSPS.toggleCP(disciplineIndex, arg)
	if disciplineIndex == 0 or disciplineIndex == nil then
		if arg ~= nil then CSPS.applyCP = arg else CSPS.applyCP = not CSPS.applyCP end
		CSPS.applyCPc = {CSPS.applyCP, CSPS.applyCP, CSPS.applyCP}
	else
		CSPS.applyCP = false
		if arg ~= nil then CSPS.applyCPc[disciplineIndex] = arg else CSPS.applyCPc[disciplineIndex] = not CSPS.applyCPc[disciplineIndex] end
	end
	if CSPS.applyCPc[1] or CSPS.applyCPc[2] or CSPS.applyCPc[3] then CSPS.applyCP = true end
	if CSPS.applyCPc[1] then CSPSWindowIncludeCPCheck1:SetTexture(checkedT) else CSPSWindowIncludeCPCheck1:SetTexture(uncheckedT) end
	if CSPS.applyCPc[2] then CSPSWindowIncludeCPCheck2:SetTexture(checkedT) else CSPSWindowIncludeCPCheck2:SetTexture(uncheckedT) end
	if CSPS.applyCPc[3] then CSPSWindowIncludeCPCheck3:SetTexture(checkedT) else CSPSWindowIncludeCPCheck3:SetTexture(uncheckedT) end
	CSPS.savedVariables.settings.applyCP = CSPS.applyCP
	CSPS.savedVariables.settings.applyCPc = CSPS.applyCPc
	 CSPS.refreshTree()
end

function CSPS.toggleCPCapImport(arg)
	if arg ~= nil then CSPS.cpImportCap = arg else CSPS.cpImportCap = not CSPS.cpImportCap end
	toggleCheckbox("ImportExportChkCap", CSPS.cpImportCap)
	CSPS.savedVariables.settings.cpImportCap = CSPS.cpImportCap
end

function CSPS.toggleStrictOrder(arg)
	if arg ~= nil then CSPS.savedVariables.settings.strictOrder = arg else CSPS.savedVariables.settings.strictOrder = not CSPS.savedVariables.settings.strictOrder end
	toggleCheckbox("CPProfilesChkStrictOrder", CSPS.savedVariables.settings.strictOrder)
end

function CSPS.toggleMouse(arg)
	local myScene = SCENE_MANAGER.currentScene and SCENE_MANAGER.currentScene:GetName()
	if myScene ~= "hud" and myScene ~= "hudui" then return end
	if arg then
		if not SCENE_MANAGER:IsInUIMode() then
			SCENE_MANAGER:SetInUIMode(true)
		end
	else
		if SCENE_MANAGER:IsInUIMode() then
			SCENE_MANAGER:SetInUIMode(false)
		end
	end
end

function CSPS.toggleCPReverseImport(arg)
	if arg ~= nil then 
		if arg == false then arg = 1 elseif arg == true then arg = 2 end
		CSPS.cpImportReverse = arg
	end
	local thisDisci = 1
	if string.sub(CSPS.formatImpExp, 1,6) == "txtCP2" then 
		thisDisci = tonumber(string.sub(CSPS.formatImpExp, 8))
	end
	local myColor = CSPS.cpColors[thisDisci]
	for i=1, 3 do
		local myControl = CSPSWindow:GetNamedChild(string.format("ImportExportBtnTextCPOrder%s", i))
		local myBG = myControl:GetNamedChild("BG")
		if i == CSPS.cpImportReverse then
			local r,g,b = CSPS.colors.green:UnpackRGB()
			myBG:SetCenterColor(r,g,b, 0.4)
		else
			myBG:SetCenterColor(1, 1, 1, 0.4)
		end
	end
	CSPS.savedVariables.settings.cpImportReverse = CSPS.cpImportReverse
end

function CSPS.OnWindowShow()
	CSPS.showElement("load") -- Show, if theres data to load
	
	if not initOpen then
		CSPS.showBuild(true) -- boolean to prevent from setting unsaved-changes to true
		initOpen = true
	end
	CSPS.toggleMouse(true)
	
	CSPS.refreshTree()
	if CSPS.doGear then	
		local waitingForGearChange = false
		EVENT_MANAGER:RegisterForEvent(CSPS.name.."GearChange", EVENT_INVENTORY_SINGLE_SLOT_UPDATE, 
			function(_, bagId) 
				if waitingForGearChange then return end
				waitingForGearChange = true
				zo_callLater(function() waitingForGearChange = false CSPS.refreshTree() end, 420)
			end)
	end
end

function CSPS.OnWindowHide()
	CSPS.checkCpOnClose()
	CSPS.toggleMouse(true)
	
	EVENT_MANAGER:UnregisterForEvent(CSPS.name.."GearChange", EVENT_INVENTORY_SINGLE_SLOT_UPDATE)
end