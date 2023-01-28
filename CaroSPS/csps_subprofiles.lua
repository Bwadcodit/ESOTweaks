local GS = GetString
local cpColors = CSPS.cpColors

local cspsD = CSPS.cspsD

local lastZoneName = ""

local qsCooldown = false

local roles = {"DD", GS(CSPS_CPP_Tank), "", GS(SI_LFGROLE4), "DD(Mag)", "DD(Stam)", GS(SI_GEMIFIABLEFILTERTYPE0)}

local PROFILE_TYPE_ACCOUNT, PROFILE_TYPE_CHAR, PROFILE_TYPE_IMPORT, PROFILE_TYPE_PRESET, PROFILE_TYPE_HOTBARS = 1, 2, 3, 4, 5
local PROFILE_TYPE_QS_ACCOUNT, PROFILE_TYPE_QS_CHAR, PROFILE_TYPE_SK_ACCOUNT, PROFILE_TYPE_SK_CHAR = 6, 7, 8, 9

local zoneAbbr = {
	[636] = "HRC",
	[638] = "AA",
	[639] = "SO",
	[635] = "DSA",
	[677] = "MA",
	[725] = "MoL",
	[975] = "HoF",
	[1000] = "AS",
	[1051] = "CR",
	[1121] = "SS",
	[1196] = "KA",
	[1082] = "BRP",
	[1227] = "VH",
	[1263] = "RG",
	[1344] = "DSR",
}

local roleAbbr = {
	[1] = "DD",
	[2] = "T",
	[3] = "", -- invalid
	[4] = "H",
}

local classAbbr = {
	[1] = "DK",
	[2] = "Sorc",
	[3] = "NB",
	[4] = "Warden",
	[5] = "Necro",
	[6] = "Temp",
}

local roleFilter = ""

local function getProfileTypeLists(createIfEmpty, presetsToo)
	if createIfEmpty then
		CSPS.savedVariables.cpProfiles = CSPS.savedVariables.cpProfiles or {}
		CSPS.currentCharData.cpProfiles = CSPS.currentCharData.cpProfiles or {}
		CSPS.currentCharData.cpHbProfiles = CSPS.currentCharData.cpHbProfiles or {}
		CSPS.currentCharData.qsProfiles = CSPS.currentCharData.qsProfiles or {}
		CSPS.savedVariables.qsProfiles = CSPS.savedVariables.qsProfiles or {}
		CSPS.currentCharData.skProfiles = CSPS.currentCharData.skProfiles or {}
		CSPS.savedVariables.skProfiles = CSPS.savedVariables.skProfiles or {}
	end
	local profileTypeLists = {
		CSPS.savedVariables.cpProfiles, CSPS.currentCharData.cpProfiles, 	--1,2
		nil, 																--3
		presetsToo and CSPS.CPPresets or nil, 								--4
		CSPS.currentCharData.cpHbProfiles,									--5
		CSPS.savedVariables.qsProfiles,	CSPS.currentCharData.qsProfiles,	--6,7
		CSPS.savedVariables.skProfiles,	CSPS.currentCharData.skProfiles,	--8,9
	}
	return profileTypeLists
end

function CSPS.getTrialArenaList()
	local myTrials = {}
	for i, _ in pairs(zoneAbbr) do
		local myName = zo_strformat("<<C:1>>", GetZoneNameById(i))
		myTrials[myName] = i
	end
	return myTrials
end

function CSPS.getProfileNameAbbr(myName)
	myName = myName or ""
	local myRole = GetSelectedLFGRole()
	if myRole == 3 then return myName end
	local myMagStam = CSPS.isMagOrStam()
	if myMagStam > 0 and myRole == 1 then
		local magStamAbbr = {"Mag", "Stam"}
		myName = string.format("%s (%s/%s-%s)", myName, classAbbr[GetUnitClassId("player")], magStamAbbr[myMagStam], roleAbbr[myRole]) 
	else
		myName = string.format("%s (%s/%s)", myName, classAbbr[GetUnitClassId("player")], roleAbbr[myRole]) 
	end
	return myName
end

function CSPS.getConnectedProfileName(myConnection)
	local myType, myId = SplitString("-", myConnection)
	local typeLists = getProfileTypeLists(false, true)
	
	local myName = typeLists[tonumber(myType)] 
	myName = myName and myName[tonumber(myId)] or false
	return myName and myName.name or "-"
end

local function addConnectionToTooltip(myType, myId, discipline)
	-- if discipline == 4 then return end
	ZO_Tooltip_AddDivider(InformationTooltip)
	local myProfile = CSPS.currentProfile == 0 and CSPS.currentCharData or CSPS.profiles[CSPS.currentProfile]
	local myText = ""
	if myProfile.connections and myProfile.connections[discipline] == string.format("%s-%s", myType, myId) then 
		myText = GS(CSPS_Tooltip_RemoveConnection) 
	else
		myText = GS(CSPS_Tooltip_AddConnection)
	end	
	InformationTooltip:AddLine(string.format("|t26:26:esoui/art/miscellaneous/icon_lmb.dds|t + %s: %s", GS(SI_KEYCODE7), myText), "ZoFontGame")
end

local CSPScppList = ZO_SortFilterList:Subclass()

function CSPScppList:New( control )
	local list = ZO_SortFilterList.New(self, control)
	list.frame = control
	list:Setup()
	return list
end

function CSPS.cp2KeyLoadAndApply(myId)
	local hotbarsOnly = {false, false, false}
	local myProfile = CSPS.currentCharData.cpHbProfiles[myId]
	local hbComp = myProfile["hbComp"]
	local myDiscipline = myProfile["discipline"]
	hotbarsOnly[myDiscipline] = true
	CSPS.cp2HbTable[myDiscipline] = CSPS.cp2SingleBarExtract(hbComp)
	CSPS.cp2HbIcons(myDiscipline)		
	CSPS.cp2UpdateHbMarks()
	CSPS.unsavedChanges = true
	CSPS.showElement("apply", true)
	CSPS.showElement("save", true)
	CSPS.cp2ApplyConfirm(false, hotbarsOnly)
	for i=1, 3 do
		CSPS.cp2ReCheckHotbar(i)
	end
	CSPS.cp2HbIcons(myDiscipline)		
	CSPS.cp2UpdateHbMarks()
	CSPS.refreshTree()
end

function CSPS.assignHkGroup(myGroup)
	local myId = CSPSWindowcpHbHkNumberList.idToAssign
	local myDiscipline = CSPSWindowcpHbHkNumberList.disciToAssign
	if CSPS.cp2hbpHotkeys[myGroup][myDiscipline] == myId then 
		CSPS.cp2hbpHotkeys[myGroup][myDiscipline] = nil
	else
		CSPS.cp2hbpHotkeys[myGroup][myDiscipline] = myId
	end	
	CSPS.currentCharData.cp2hbpHotkeys = CSPS.cp2hbpHotkeys
	CSPSWindowcpHbHkNumberList:listDetails(myGroup)
	CSPSWindowcpHbHkNumberList:showHotkeySelector(myId, myDiscipline, nil)
	
end

function CSPS.getHotkeyByGroup(myHotkey)
	local myKeyText = "-"
	local layInd, catInd, actInd = GetActionIndicesFromName("CSPS_CPHK"..myHotkey)
	if layInd and catInd and actInd then 
		local keyCode, mod1, mod2, mod3, mod4 = GetActionBindingInfo(layInd, catInd, actInd, 1)
		if keyCode > 0 then 
			myKeyText = ZO_Keybindings_GetBindingStringFromKeys(keyCode, mod1, mod2, mod3, mod4)
		else
			myKeyText = ZO_Keybindings_GetBindingStringFromKeys(nil, 0, 0, 0, 0)
		end
	end
	return myKeyText
end

function CSPS.getProfileNamesByGroup(myGroupId)
	local myNames = {"-", "-", "-"}
	local cpHbProfiles = CSPS.currentCharData.cpHbProfiles
	local myGroup = CSPS.cp2hbpHotkeys[myGroupId]
	for i=1, 3 do
		if CSPS.cp2hbpHotkeys[myGroupId] ~= nil then
			myNames[i] = myGroup[i] and cpHbProfiles[myGroup[i]] and cpHbProfiles[myGroup[i]].name or "-"
		end
	end
	return myNames
end

function CSPS.initHkNumberList()
	CSPSWindowcpHbHkNumberList.initialized = true
	CSPSWindowcpHbHkNumberList.btns = {}
	local btns = CSPSWindowcpHbHkNumberList.btns
	CSPSWindowcpHbHkNumberList.cols = {}
	for i=1, 20 do
		local oneBtn = WINDOW_MANAGER:CreateControlFromVirtual(string.format("CSPSWindowcpHbHkNumberListBtn%s", i), CSPSWindowcpHbHkNumberList, "CSPScppBtnPreset")
		oneBtn:SetDimensions(42, 24)
		if i == 1 then
			oneBtn:SetAnchor(TOPLEFT, CSPSWindowcpHbHkNumberList, TOPLEFT, 5, 5)
		elseif i % 5 == 1 then
			oneBtn:SetAnchor(TOPLEFT, btns[i-5], BOTTOMLEFT, 0, 5)
		else
			oneBtn:SetAnchor(TOPLEFT, btns[i-1], TOPRIGHT, 5, 0)
		end
		
		-- local oneBtn = CSPSWindowcpHbHkNumberList:GetNamedChild(string.format("Btn%s", i))
		btns[i] = oneBtn
		oneBtn:SetHandler("OnMouseEnter", function() CSPSWindowcpHbHkNumberList:listDetails(i) end)
		oneBtn:SetHandler("OnMouseExit", function() CSPSWindowcpHbHkNumberList:listDetails(nil) end)
		oneBtn:SetHandler("OnClicked", function() CSPS.assignHkGroup(i) end)
	end
	local curKey = CSPSWindowcpHbHkNumberList:GetNamedChild("CurKey")
	
	curKey:SetAnchor(TOPLEFT, btns[16], BOTTOMLEFT, 0, 5)
	curKey:SetAnchor(TOPRIGHT, btns[20], BOTTOMRIGHT, -30, 5)
	
	function CSPSWindowcpHbHkNumberList:listDetails(myGroupId)
		if myGroupId ~= nil then
			curKey:SetText(string.format("Hotkey: %s", CSPS.getHotkeyByGroup(myGroupId)))
			local myColNames = CSPS.getProfileNamesByGroup(myGroupId)
			self:GetNamedChild("Col1"):SetText(myColNames[2])
			self:GetNamedChild("Col2"):SetText(myColNames[3])
			self:GetNamedChild("Col3"):SetText(myColNames[1])
		else
			curKey:SetText("")
			self:GetNamedChild("Col1"):SetText("")
			self:GetNamedChild("Col2"):SetText("")
			self:GetNamedChild("Col3"):SetText("")
			
		end
	end
	function CSPSWindowcpHbHkNumberList:showHotkeySelector(myId, myDiscipline, control)
		self.col = CSPS.cpColors[myDiscipline]
		self.idToAssign = myId
		self.disciToAssign = myDiscipline
		for i=1, 20 do
			local myBtn = self.btns[i]
			local myBG = myBtn:GetNamedChild("BG")
			if CSPS.cp2hbpHotkeys[i][myDiscipline] == myId then
				local r,g,b = self.col:UnpackRGB()
				myBG:SetCenterColor(r, g, b, 0.4)
				myBtn:SetEnabled(true)
			elseif CSPS.cp2hbpHotkeys[i][myDiscipline] == nil then
				myBG:SetCenterColor(0.0314, 0.0314, 0.0314)
				myBtn:SetEnabled(true)
			else
				myBG:SetCenterColor(1, 1, 1, 0.4)
				myBtn:SetEnabled(false)
			end
		end
		if control ~= nil then
			self:ClearAnchors()
			self:SetAnchor(TOPLEFT, control, BOTTOM)
			self:SetHidden(false)
			local function hideMe()
				local moCtrl = WINDOW_MANAGER:GetMouseOverControl()
				if string.find(moCtrl:GetName(), self:GetName()) == nil and string.find(moCtrl:GetName(), "Hotkey") == nil then
					self:SetHidden(true)
					EVENT_MANAGER:UnregisterForEvent(CSPS.name, EVENT_GLOBAL_MOUSE_DOWN)
				end
			end
			EVENT_MANAGER:RegisterForEvent(CSPS.name, EVENT_GLOBAL_MOUSE_DOWN, hideMe)
		end	
	end
end

function CSPS.cpFilterCombo()
	CSPSWindowCPProfilesRoleFilter.comboBox = CSPSWindowCPProfilesRoleFilter.comboBox or ZO_ComboBox_ObjectFromContainer(CSPSWindowCPProfilesRoleFilter)
	local myComboBox = CSPSWindowCPProfilesRoleFilter.comboBox	
	myComboBox:ClearItems()
	myComboBox:SetSortsItems(true)
	
	local choices = {}
	
	for i, v in pairs(roles) do
		if v ~= "" and i ~= 1 then choices[v] = i end
	end
	
	local function OnItemSelect(_, choiceText, _)
		roleFilter = choiceText
		
		CSPS.cppList:RefreshData()
		PlaySound(SOUNDS.POSITIVE_CLICK)
	end
	
	for i,j in pairs(choices) do
		myComboBox:AddItem(myComboBox:CreateItemEntry(i, OnItemSelect))

	end
	if roleFilter ~= "" then 
		myComboBox:SetSelectedItem(roleFilter)
	else
		myComboBox:SetSelectedItem(GS(SI_CHAT_OPTIONS_FILTERS))
	end
end

function CSPS.cp2HbHkClick(myId, myDiscipline, control, mouseButton)
	if not CSPSWindowcpHbHkNumberList.initialized then CSPS.initHkNumberList() end
	if not CSPSWindowcpHbHkNumberList:IsHidden() then 
		CSPSWindowcpHbHkNumberList:SetHidden(true) 
		return 
	end
	CSPSWindowcpHbHkNumberList:showHotkeySelector(myId, myDiscipline, control)
	ZO_Tooltips_HideTextTooltip()
end

function CSPS.cp2HbPshowTTApply(myId, myDiscipline, control)
	local myTooltip = {GS(CSPS_Tooltiptext_LoadAndApply)}
	local myProfile = CSPS.currentCharData.cpHbProfiles[myId]
	local myHb = {SplitString(",", myProfile["hbComp"])}
	for i, v in pairs(myHb) do
		local myString = zo_strformat("<<C:1>>", GetChampionSkillName(tonumber(v))) or "-"
		local myColor = cpColors[myDiscipline]:ToHex()
		myString = string.format(" |t24:24:esoui/art/champion/champion_icon_32.dds|t %s) |c%s%s|r", i, myColor, myString)
		table.insert(myTooltip, myString)
	end
	myTooltip = table.concat(myTooltip, "\n")
	ZO_Tooltips_ShowTextTooltip(control, RIGHT, myTooltip)
end

local function ShowCustomCPProfileTT(control, data)
	if data.type ~=1 and data.type ~=2 then return end
	InitializeTooltip(InformationTooltip, control, LEFT)	
	InformationTooltip:AddLine(data.name, "ZoFontWinH2")
	local myId = data.myId
	local myProfile = data.type == 1 and CSPS.savedVariables.cpProfiles and CSPS.savedVariables.cpProfiles[myId] or data.type == 2 and CSPS.currentCharData.cpProfiles and CSPS.currentCharData.cpProfiles[myId]
	if not myProfile then return end
	if myProfile.lastSaved then 
		InformationTooltip:AddLine(string.format("(%s)", os.date("%x", myProfile.lastSaved)), "ZoFontGame") 
	end
	local myProfileIcon = cpColors[myProfile.discipline]:ToHex()
	local myColor = cpColors[myProfile.discipline]:ToHex()
	if myProfile.hbComp then
		ZO_Tooltip_AddDivider(InformationTooltip)
		local myHbText = {}
		for _, cpId in pairs({SplitString(",", myProfile.hbComp)}) do
			if tonumber(cpId) then table.insert(myHbText, string.format("|c%s%s|r", myColor, zo_strformat("<<C:1>>", GetChampionSkillName(tonumber(cpId))))) end
		end
		InformationTooltip:AddLine(string.format("|t28:28:%s|t %s", myProfileIcon, table.concat(myHbText, ", ")))
	end
	if myProfile.cpComp then
		local myCPList = {}
		for _, cpValuePair in pairs({SplitString(";", myProfile.cpComp)}) do
			local myPair = {SplitString("-", cpValuePair)}
			local myCPKey = tonumber(myPair[1])
			local myCPValue = tonumber(myPair[2])
			if myCPKey and myCPValue then table.insert(myCPList, string.format("|c%s%s|r(%s)", myColor, zo_strformat("<<C:1>>", GetChampionSkillName(myCPKey)), myCPValue)) end
		end		
		ZO_Tooltip_AddDivider(InformationTooltip)
		InformationTooltip:AddLine(table.concat(myCPList, ", "))
	end
	addConnectionToTooltip(data.type, myId, myProfile.discipline)
end

function CSPS.showSkillProfileTT(control, myType, myId)

end

function CSPScppList:SetupItemRow( control, data )
	control.data = data
	local ctrName = GetControl(control, "Name")
	local ctrPoints = GetControl(control, "Points")
	ctrName.normalColor = ZO_DEFAULT_TEXT
	ctrName:SetText(data.name)

	if data.discipline == 4 then -- 4 = not cp but quickslots
		ctrName:SetHandler("OnMouseEnter", function()  CSPS.showQuickSlotProfileTT(control, data.type, data.myId) CSPS.CPListRowMouseEnter(control) end)
	elseif data.discipline == 5 then -- 5 = skills
		ctrName:SetHandler("OnMouseEnter", function()  CSPS.showSkillProfileTT(control, data.type, data.myId) CSPS.CPListRowMouseEnter(control) end)
	elseif data.type == 1 or data.type == 2 then
		ctrName:SetHandler("OnMouseEnter", function()  ShowCustomCPProfileTT(control, data) CSPS.CPListRowMouseEnter(control) end)
	elseif ctrName:WasTruncated() and data.type ~=4 then
		ctrName:SetHandler("OnMouseEnter", function() ZO_Tooltips_ShowTextTooltip(ctrName, RIGHT, data.name) CSPS.CPListRowMouseEnter(control) end)
	else
		ctrName:SetHandler("OnMouseEnter", function() CSPS.CPListRowMouseEnter(control) end)
	end

	ctrPoints.normalColor = ZO_DEFAULT_TEXT
	ctrPoints:SetText(data.points)
	
	local typesToShowConnectionsFor = {[1] = true, [2]= true, [4]= true, [6] = true, [7] = true}
	if typesToShowConnectionsFor[data.type] then
		local myProfile = CSPS.currentProfile == 0 and CSPS.currentCharData or CSPS.profiles[CSPS.currentProfile]
		local showConnectionIcon = myProfile.connections and myProfile.connections[data.discipline] == string.format("%s-%s", data.type, data.myId)
		GetControl(control, "Connection"):SetHidden(not showConnectionIcon)
		local theColor = showConnectionIcon and CSPS.cpColors[data.discipline] or ZO_DEFAULT_TEXT
		ctrName.normalColor = theColor
		ctrPoints.normalColor = theColor
		
	end
	
	if data.type == 1 or data.type == 2 or data.type > 4 then 
		control:GetNamedChild("Rename"):SetHandler("OnClicked", function() CSPS.cp2ProfileRename(data.myId, data.type) end)
		control:GetNamedChild("Save"):SetHandler("OnClicked", function() CSPS.cp2ProfileSave(data.myId, data.type) end)
		control:GetNamedChild("Minus"):SetHandler("OnClicked", function() CSPS.cp2ProfileMinus(data.myId, data.type) end)
		if data.isNew then 
			ctrName.normalColor = ZO_GAME_REPRESENTATIVE_TEXT
			ctrPoints.normalColor = ZO_GAME_REPRESENTATIVE_TEXT
		end
	end
	if data.type == 4 then 
		ctrName:ClearAnchors()
		ctrName:SetAnchor(RIGHT, control:GetNamedChild("Role"), LEFT, -5, 0, ANCHOR_CONSTRAINS_X)
		ctrName:SetAnchor(LEFT, ctrPoints, RIGHT, 5, 0)
		control:GetNamedChild("Role"):SetHidden(false)
		control:GetNamedChild("Source"):SetHidden(false)
		control:GetNamedChild("Role"):SetText(data.role)
		control:GetNamedChild("Source"):SetText(data.source)
		control:GetNamedChild("Role").normalColor = ZO_DEFAULT_TEXT
		control:GetNamedChild("Source").normalColor = ZO_DEFAULT_TEXT
	else
		ctrName:ClearAnchors()
		ctrName:SetAnchor(RIGHT, control:GetNamedChild("Rename"), LEFT, -5, 0, ANCHOR_CONSTRAINS_X)
		ctrName:SetAnchor(LEFT, ctrPoints, RIGHT, 5, 0)
		control:GetNamedChild("Role"):SetHidden(true)
		control:GetNamedChild("Source"):SetHidden(true)
	end
	if data.type == 5 then
		ctrPoints:SetHidden(true)
		control:GetNamedChild("Hotkey"):SetHidden(false)
		control:GetNamedChild("Apply"):SetHandler("OnClicked", function() CSPS.cp2KeyLoadAndApply(data.myId) end)
		control:GetNamedChild("Apply"):SetHandler("OnMouseEnter", function() CSPS.cp2HbPshowTTApply(data.myId, data.discipline, control:GetNamedChild("Apply")) end)
		control:GetNamedChild("Apply"):SetHidden(false)
		local myHotkey = 0
		for i, v in ipairs(CSPS.cp2hbpHotkeys) do
			if v[data.discipline] == data.myId then myHotkey = i end
		end
		local myKeyText = "-"
		if myHotkey and myHotkey > 0 then 
			local layIdx, catIdx, actIdx = GetActionIndicesFromName("CSPS_CPHK"..myHotkey)
			if layIdx and catIdx and actIdx then 
				local keyCode, mod1, mod2, mod3, mod4 = GetActionBindingInfo(layIdx, catIdx, actIdx, 1)
				if keyCode > 0 then 
					myKeyText = ZO_Keybindings_GetBindingStringFromKeys(keyCode, mod1, mod2, mod3, mod4)
				end
			end
		end
		
		control:GetNamedChild("Hotkey"):SetHandler("OnClicked", function(upInside, mouseButton) if upInside then CSPS.cp2HbHkClick(data.myId, data.discipline, control:GetNamedChild("Hotkey"), mouseButton) end end)
		control:GetNamedChild("Hotkey"):SetHandler("OnMouseEnter", function() ZO_Tooltips_ShowTextTooltip(control:GetNamedChild("Hotkey"), RIGHT, GS(CSPS_Tooltiptext_CpHbHk)) end)
	else
		ctrPoints:SetHidden(false)
		control:GetNamedChild("Hotkey"):SetHidden(true)
		control:GetNamedChild("Apply"):SetHidden(true)
	end
	local myIcon = control:GetNamedChild("Icon")
	if myIcon ~= nil then myIcon:SetTexture(CSPS.cpColTex[data.discipline]) end

	ZO_SortFilterList.SetupRow(self, control, data)
end



function CSPS.cppSort(newSortKey)
	if CSPS.savedVariables.settings.cppSortKey ~= newSortKey then
		CSPS.savedVariables.settings.cppSortKey = newSortKey
		CSPS.cppList.currentSortKey = newSortKey
	else
		CSPS.savedVariables.settings.cppSortOrder  = CSPS.savedVariables.settings.cppSortOrder  or false -- false = value for sort_order_down
		CSPS.savedVariables.settings.cppSortOrder = not CSPS.savedVariables.settings.cppSortOrder 
		CSPS.cppList.currentSortOrder = CSPS.savedVariables.settings.cppSortOrder
	end
	CSPS.cppList:RefreshData()
end

function CSPScppList:Setup( )
	ZO_ScrollList_AddDataType(self.list, 1, "CSPSCPPLE", 30, function(control, data) self:SetupItemRow(control, data) end)
	ZO_ScrollList_AddDataType(self.list, 2, "CSPSCPPLECUST", 30, function(control, data) self:SetupItemRow(control, data) end)
	ZO_ScrollList_EnableHighlight(self.list, "ZO_ThinListHighlight")
	self:SetAlternateRowBackgrounds(true)
	self.masterList = { }
	
	local sortKeys = {
		["name"]     = { caseInsensitive = true, },
		["points"] = { caseInsensitive = true, tiebreaker = "name" },
		["role"] = { caseInsensitive = true, tiebreaker = "name" },
		["source"] = { caseInsensitive = true, tiebreaker = "role" },
	}
	
	self.currentSortKey = CSPS.savedVariables.settings.cppSortKey or "name"
	self.currentSortOrder = CSPS.savedVariables.settings.cppSortOrder  ~= nil and CSPS.savedVariables.settings.cppSortOrder or ZO_SORT_ORDER_UP
	self.sortFunction = function( listEntry1, listEntry2 )
		return ZO_TableOrderingFunction(listEntry1.data, listEntry2.data, self.currentSortKey, sortKeys, self.currentSortOrder)
	end

	self:RefreshData()
end

function CSPScppList:SortScrollList( )
	if (self.currentSortKey ~= nil and self.currentSortOrder ~= nil) then
		table.sort(ZO_ScrollList_GetDataList(self.list), self.sortFunction)
		self:RefreshVisible()
	end
	if newProfileBringToTop then
		local iToTop = 0
		for i, v in pairs(ZO_ScrollList_GetDataList(self.list)) do
			if v.data.isNew then iToTop = i end
		end
		if iToTop > 0 then
			table.insert(ZO_ScrollList_GetDataList(self.list), 1, table.remove(ZO_ScrollList_GetDataList(self.list), iToTop))
		end
		newProfileBringToTop = false
	end
end

function CSPScppList:BuildMasterList( )
	self.masterList = { }
	local profileTypeLists = getProfileTypeLists(false, true)
	for myType, myList in pairs(profileTypeLists) do
		for myId, myData in pairs(myList) do
			local myDiscipline = myType < 6 and myData.discipline or myType >= 8 and 5 or myType >= 6 and 4
			local insertData = {type = myType, name = myData.name, discipline = myDiscipline, myId = myId, points = myData.points, isNew = myData.isNew}
			if myType == 4 then --presets
				insertData.role = roles[myData.role or 7]
				insertData.source = myData.source
				insertData.addInfo = myData.addInfo
				insertData.website = myData.website
				insertData.updated = myData.updated
			end			
			table.insert(self.masterList, insertData)
		end
	end
end

function CSPScppList:FilterScrollList( )
	local scrollData = ZO_ScrollList_GetDataList(self.list)
	ZO_ClearNumericallyIndexedTable(scrollData)

	for _, data in ipairs(self.masterList) do
		local myType = 2 -- My type here refers to the UI element not the data type: 1 being a list entry for presets, 2 also contains the profile buttons
		if data.type > 2 and data.type < 5 then myType = 1 end 
		if (CSPS.cpProfDis == nil or CSPS.cpProfDis == data.discipline) and (CSPS.cpProfType == nil or CSPS.cpProfType == data.type) then
			if data.type ~= 4 or roleFilter == "" or roleFilter == roles[7] or roleFilter == data.role or data.role == roles[7] or (data.role == 1 and (roleFilter == roles[5] or roleFilter == roles[6])) then
				table.insert(scrollData, ZO_ScrollList_CreateDataEntry(myType, data))
			end
		end
	end
end

function CSPS.cpProfile(i, silentChange)
	if silentChange and CSPSWindowCPProfiles:IsHidden() then 
		CSPS.cpProfDis = i
		return 
	elseif CSPSWindowCPProfiles:IsHidden() == false and CSPS.cpProfDis == i and silentChange == nil then
		CSPSWindowCPProfiles:SetHidden(true)
		CSPSWindowCPImport:SetHidden(true)
		CSPSWindowCPProfiles:SetHeight(0)
		return
	end
	i = i or CSPS.cpProfDis or 2
	if i < 4 and not CSPS.tabEx then  
		CSPS.cp2ReadCurrent()
		CSPS.createTable() -- Create the treeview if no treeview exists yet
		CSPS.toggleCP(0, false)
	end
	if i < 4 and CSPS.cp2ParentTreeSection and not CSPS.cp2ParentTreeSection.node:IsOpen() then
		CSPS.onToggleSektion(CSPS.cp2ParentTreeSection:GetNamedChild("Toggle"), MOUSE_BUTTON_INDEX_LEFT) 
	end
	CSPSWindowManageBars:SetHidden(true)
	CSPSWindowOptions:SetHidden(true)
	CSPSWindowMain:SetHidden(false)
	CSPS.cpProfDis = i
	CSPS.cpProfileType()
	if CSPS.cpProfDis == 4 then
		CSPSWindowCPProfilesTitle:SetText(GS(SI_COLLECTIONS_BOOK_QUICKSLOT_KEYBIND))
	elseif CSPS.cpProfDis == 5 then
		CSPSWindowCPProfilesTitle:SetText(GS(SI_CHARACTER_MENU_SKILLS))
	else
		CSPSWindowCPProfilesTitle:SetText(GS(CSPS_Tooltiptext_CPProfile))
	end
	local r, g, b = CSPS.cpColors[CSPS.cpProfDis]:UnpackRGB()
	CSPSWindowCPProfilesTitle:SetColor(r,g,b)
	CSPSWindowCPProfilesHeaderPoints:SetColor(r,g,b)
	CSPSWindowCPProfilesHeaderName:SetColor(r,g,b)
	CSPSWindowCPProfilesHeaderRole:SetColor(r,g,b)
	CSPSWindowCPProfilesHeaderSource:SetColor(r,g,b)
	CSPS.showElement("cpProfiles", true)
end


local function compressQuickslots()
	local myBar = {}	
	local myPoints = 0
	for i=1, ACTION_BAR_UTILITY_BAR_SIZE do
		local itemLink = GetSlotItemLink(i, HOTBAR_CATEGORY_QUICKSLOT_WHEEL)
		itemLink = itemLink or ""
		if itemLink == "" then itemLink = "-" else myPoints = myPoints + 1 end
		table.insert(myBar, itemLink)
	end
	myBar = table.concat(myBar, ",")
	return myBar, myPoints
end

function CSPS.cp2ProfilePlus(myType)
	
	local myProfile = {}
	local myTable = {}
	local myPoints = 0
	local myBar = ""
	
	if myType < 5 then
		for i, v in pairs (CSPS.cp2Table) do
			if CSPS.cp2Disci[i] == CSPS.cpProfDis then 
				myTable[i] = v 
				myPoints = myPoints + v[2]
			end
		end
		myTable = CSPS.cp2Compress(myTable)
	end
	if myType < 6 then
		myBar = CSPS.cp2SingleBarCompress(CSPS.cp2HbTable[CSPS.cpProfDis])	
	elseif myType < 8 then
		--fill the quickslot profile here
		myBar, myPoints = compressQuickslots()
	else
		myPoints = CSPS.skillTable.points or 0
		myBar = CSPS.compressLists()
	end
	local myName = GS(CSPS_Txt_NewProfile2)
	local myZone = GetUnitWorldPosition("player")
	myName = myType ~= 5 and zoneAbbr[myZone] or myName
	myName = myType ~= 5 and CSPS.getProfileNameAbbr(myName)
		
	if myType == 5 then 
		myName = GS(CSPS_Txt_NewProfile2)
		myProfile = {name = myName, discipline = CSPS.cpProfDis, hbComp = myBar, isNew = true}
	elseif myType > 5 then
		myProfile = {name = myName, discipline = CSPS.cpProfDis,  hbComp = myBar, points = myPoints, isNew = true} -- myBar can be quickslots etc
	else
		myProfile = {name = myName, discipline = CSPS.cpProfDis, points = myPoints, cpComp = myTable, hbComp = myBar, isNew = true}
	end
	
	local profileTypeLists = getProfileTypeLists(true, false)
	
	if profileTypeLists[myType] then
		table.insert(profileTypeLists[myType], myProfile)
	end
	
	newProfileBringToTop = true
	
	if not CSPS.cppList then
		CSPS.cppList = CSPScppList:New(CSPSWindowCPProfiles)
	else
		CSPS.cppList:RefreshData()
	end
	
	-- setting .isnew to nil after refreshing so it will only show until the next refresh
	for j, w in pairs(profileTypeLists) do
		for i, v in pairs(w) do
			v.isNew = nil
		end
	end
	
end

local function getCPProfileName(myId, myType)
	local profileTypeLists = getProfileTypeLists(false, true)
	local myName = profileTypeLists[myType] and profileTypeLists[myType][myId] and profileTypeLists[myType][myId].name or false
	return myName
end

function CSPS.cp2ProfileMinus(myId, myType)
	local myName = getCPProfileName(myId, myType)
	if not myName then return end
	ZO_Dialogs_ShowDialog(CSPS.name.."_OkCancelDiag", 
		{returnFunc = function()  CSPS.cp2ProfileDelete(myId, myType)  end},  
		{mainTextParams = {zo_strformat(GS(CSPS_MSG_DeleteProfile), myName, "", "")}, titleParams = {GS(CSPS_MyWindowTitle)}})
end

function CSPS.cp2ProfileDelete(myId, myType)
	local profileTypeLists = getProfileTypeLists(false, false)
	if myType == 5 then	-- delete hotkey bindings for deleted cp bar profile
		local myDiscipline = CSPS.currentCharData.cpHbProfiles[myId]["discipline"]
		for i, v in ipairs(CSPS.cp2hbpHotkeys) do
			if v[myDiscipline] == myId then v[myDiscipline] = nil end
		end		
	end
	
	if profileTypeLists[myType] then profileTypeLists[myType][myId] = nil end

	CSPS.cppList:RefreshData()
end

function CSPS.cp2ProfileRename(myId, myType)
	local myName = getCPProfileName(myId, myType)
	if not myName then return end
	ZO_Dialogs_ShowDialog(CSPS.name.."_RenameProfile", {myId = myId, myType = myType}, {mainTextParams = {myName, ""}, initialEditText = myName})
end

function CSPS.cp2ProfileRenameGo(newName, myId, myType)
	if newName == "" then return end
	local profileTypeLists = getProfileTypeLists(false, false)
	if profileTypeLists[myType] and profileTypeLists[myType][myId] then
		profileTypeLists[myType][myId].name = newName
		CSPS.cppList:RefreshData()
	end
end

function CSPS.cp2ProfileSave(myId, myType)
	local myName = getCPProfileName(myId, myType)
	if not myName then return end
	
	ZO_Dialogs_ShowDialog(CSPS.name.."_OkCancelDiag", 
		{returnFunc = function() CSPS.cp2ProfileSaveGo(myId, myType)  end},  
		{mainTextParams = {zo_strformat(GS(CSPS_MSG_ConfirmSave), myName, "")}, titleParams = {GS(CSPS_MyWindowTitle)}})
end

local function skillProfileSaveGo(myId, myType, profileToSave)

	profileToSave.points = CSPS.skillTable.points or 0
	profileToSave.hbComp = CSPS.compressLists()
	profileToSave.lastSaved = os.time()

	CSPS.cppList:RefreshData()	
end

local function quickslotSaveGo(myId, myType, profileToSave)
	local myBar, myPoints = compressQuickslots()
	
	profileToSave.points = myPoints
	profileToSave.hbComp = myBar
	profileToSave.lastSaved = os.time()

	CSPS.cppList:RefreshData()
end

function CSPS.cp2ProfileSaveGo(myId, myType)
	local profileTypeLists = getProfileTypeLists(true, false)
	local profileToSave = profileTypeLists[myType] and profileTypeLists[myType][myId]
	if myType == 6 or myType == 7 then quickslotSaveGo(myId, myType, profileToSave) return end
	if myType == 8 or myType == 9 then skillProfileSaveGo(myId, myType, profileToSave) return end
	local myTable = {}
	local myPoints = 0
	if myType ~= 5 then
		for i, v in pairs (CSPS.cp2Table) do
			if CSPS.cp2Disci[i] == CSPS.cpProfDis then 
				myTable[i] = v 
				myPoints = myPoints + v[2]
			end
		end
		myTable = CSPS.cp2Compress(myTable)
	end
	local myBar = CSPS.cp2SingleBarCompress(CSPS.cp2HbTable[CSPS.cpProfDis])
	profileToSave.hbComp = myBar
	
	if myType ~= 5 then
		profileToSave.points = myPoints
		profileToSave.cpComp = myTable
	end
	CSPS.cppList:RefreshData()
end

function CSPS.cpProfileType(myType)
	if myType == CSPS.cpProfType then return end
	if myType ~= nil then 
		if myType == 3 then
			if CSPS.formatImpExp ~= string.format("txtCP2_%d", CSPS.cpProfDis) then
				CSPSWindowImportExportSrcList.comboBox:SetSelectedItem(GetString("CSPS_ImpEx_TxtCP2_", CSPS.cpProfDis))
				CSPS.toggleImpExpSource(string.format("txtCP2_%d", CSPS.cpProfDis))
			end
			CSPS.toggleImportExport(true)
			CSPS.showElement("cpProfiles", false)
			return
		end
		CSPS.cpProfType = myType
	end
	if CSPS.cpProfDis == 4 and CSPS.cpProfType ~= 6 and CSPS.cpProfType ~= 7 then
		if CSPS.cpProfType == 1 or CSPS.cpProfType == 8 then CSPS.cpProfType = 6 else CSPS.cpProfType = 7 end
	end
	if CSPS.cpProfDis == 5 and CSPS.cpProfType < 8 then
		if CSPS.cpProfType == 1 or CSPS.cpProfType == 6 then CSPS.cpProfType = 8 else CSPS.cpProfType = 9 end
	end
	if CSPS.cpProfDis < 4 and CSPS.cpProfType > 5 then
		if CSPS.cpProfType == 6 or CSPS.cpProfType == 8 then CSPS.cpProfType = 1 else CSPS.cpProfType = 2 end
	end
	
	CSPSWindowCPProfilesCPProfilePlus:SetHidden(CSPS.cpProfType == 3 or CSPS.cpProfType == 4)
	
	if CSPS.cpProfType == 5 then	
		CSPSWindowCPProfilesHeaderPoints:SetText(GS(CSPS_CPP_Hotkey))
		CSPSWindowCPProfilesHeaderPoints:SetHorizontalAlignment(0)
		CSPSWindowCPProfilesHeaderHotkey:SetHidden(false)
		CSPSWindowCPProfilesHeaderPoints:SetWidth(59)
		CSPSWindowCPProfilesHeaderHotkey:SetWidth(25)
	else
		CSPSWindowCPProfilesHeaderPoints:SetText(GS(CSPS_CPP_Points))
		CSPSWindowCPProfilesHeaderPoints:SetHorizontalAlignment(1)
		CSPSWindowCPProfilesHeaderHotkey:SetHidden(true)
		CSPSWindowCPProfilesHeaderPoints:SetWidth(84)
		CSPSWindowCPProfilesHeaderHotkey:SetWidth(0)
	end
	if CSPS.cpProfType == 4 then
		CSPSWindowCPProfilesHeaderName:SetWidth(200)
		CSPSWindowCPProfilesHeaderRole:SetHidden(false)
		CSPSWindowCPProfilesHeaderSource:SetHidden(false)
		CSPSWindowCPProfilesRoleFilter:SetHidden(false)
		CSPSWindowCPProfilesLblStrictOrder:SetHidden(false)
		CSPSWindowCPProfilesChkStrictOrder:SetHidden(false)
		if not CSPSWindowCPProfilesRoleFilter.comboBox then CSPS.cpFilterCombo() end
	else
		CSPSWindowCPProfilesHeaderName:SetWidth(342)
		CSPSWindowCPProfilesHeaderRole:SetHidden(true)
		CSPSWindowCPProfilesHeaderSource:SetHidden(true)
		CSPSWindowCPProfilesRoleFilter:SetHidden(true)
		CSPSWindowCPProfilesLblStrictOrder:SetHidden(true)
		CSPSWindowCPProfilesChkStrictOrder:SetHidden(true)
	end
	local cppTypes = {"CustomAcc", "CustomChar", "ImportFromText", "Presets", "BarsOnly"}
	for i, v in pairs(cppTypes) do
		local myBtn = CSPSWindowCPProfiles:GetNamedChild(v)
		local addToIndex = CSPS.cpProfDis == 4 and 5 or CSPS.cpProfDis == 5 and 7 or 0
		
		if CSPS.cpProfDis > 3 and i > 2 then
			myBtn:SetHidden(true)
			myBtn:SetWidth(0)
		else
			myBtn:SetHidden(false)
			myBtn:SetWidth(100)
			local myBG = myBtn:GetNamedChild("BG")
			local r,g,b = CSPS.cpColors[CSPS.cpProfDis]:UnpackRGB()
			if i + addToIndex == CSPS.cpProfType then myBG:SetCenterColor(r,g,b, 0.4) else myBG:SetCenterColor(0.0314, 0.0314, 0.0314) end
		end
	end
	CSPSWindowCPProfilesCPProfilePlus:SetHandler("OnClicked", function() CSPS.cp2ProfilePlus(CSPS.cpProfType) end)
	if not CSPS.cppList then
		CSPS.cppList = CSPScppList:New(CSPSWindowCPProfiles)
	else
		CSPS.cppList:RefreshData()
	end
	CSPS.cppList:FilterScrollList()
	CSPS.cppList:SortScrollList()
end

function CSPS.CPListRowMouseExit( control )
	CSPS.cppList:Row_OnMouseExit(control)
	if control.data then ZO_Tooltips_HideTextTooltip() end
end

function CSPS.CPListRowMouseEnter(control)
	CSPS.cppList:Row_OnMouseEnter(control)
	if control.data and control.data.type == 4 then
		InitializeTooltip(InformationTooltip, control, LEFT)	
		InformationTooltip:AddLine(control.data.name, "ZoFontWinH2")
		ZO_Tooltip_AddDivider(InformationTooltip)
		if control.data.addInfo then
			InformationTooltip:AddLine(control.data.addInfo, "ZoFontGame") 
			ZO_Tooltip_AddDivider(InformationTooltip)
		end
		InformationTooltip:AddLine(zo_strformat(GS(CSPS_Tooltip_CPPUpdate), control.data.updated[1], control.data.updated[2], control.data.updated[3]), "ZoFontGame")
		if control.data.website then InformationTooltip:AddLine(zo_strformat(GS(CSPS_Tooltip_CPPWebsite), control.data.website), "ZoFontGame") end
		addConnectionToTooltip(4, control.data.myId, control.data.discipline)
	end
end

local function loadDynamicCP(myList, mySlotted, myBase, discipline)
	if myList == nil then return end
	local myBase = myBase or {}
	local mySlotted = mySlotted or {}
	local i = 1
	local remainingPoints = GetNumSpentChampionPoints(GetChampionDisciplineId(discipline)) + GetNumUnspentChampionPoints(GetChampionDisciplineId(discipline))
	
	local strictOrder = CSPS.savedVariables.settings.strictOrder

	CSPS.cp2ResetTable(discipline)
	while i <= #myList and remainingPoints > 0 do
		if CSPS.cp2Table[myList[i][1]][1] then
			if remainingPoints >= myList[i][2] - CSPS.cp2Table[myList[i][1]][2] then
				remainingPoints = remainingPoints + CSPS.cp2Table[myList[i][1]][2]
				CSPS.cp2Table[myList[i][1]][2] = myList[i][2] 
				if CSPS.cp2Table[myList[i][1]][2] > GetChampionSkillMaxPoints(myList[i][1]) then CSPS.cp2Table[myList[i][1]][2] = GetChampionSkillMaxPoints(myList[i][1]) end
				CSPS.cp2UpdateUnlock(discipline)
				remainingPoints = remainingPoints -  CSPS.cp2Table[myList[i][1]][2]
			else
				cspsD("Not enough points for "..myList[i][1])
				if DoesChampionSkillHaveJumpPoints(myList[i][1]) then
					local myJumpPoint = 0
					for j, w in ipairs({GetChampionSkillJumpPoints(myList[i][1])}) do
						if w <= remainingPoints + CSPS.cp2Table[myList[i][1]][2] then myJumpPoint = w else break end
					end
					if myJumpPoint > CSPS.cp2Table[myList[i][1]][2] then
						remainingPoints = remainingPoints + CSPS.cp2Table[myList[i][1]][2]
						CSPS.cp2Table[myList[i][1]][2] = myJumpPoint
						CSPS.cp2UpdateUnlock(discipline)
						remainingPoints = remainingPoints - myJumpPoint
					end
				else
					CSPS.cp2Table[myList[i][1]][2] = CSPS.cp2Table[myList[i][1]][2] + remainingPoints
					remainingPoints = 0
					if CSPS.cp2Table[myList[i][1]][2] > GetChampionSkillMaxPoints(myList[i][1]) then
						remainingPoints = CSPS.cp2Table[myList[i][1]][2] - GetChampionSkillMaxPoints(myList[i][1])
						CSPS.cp2Table[myList[i][1]][2] = GetChampionSkillMaxPoints(myList[i][1])
					end
				end
				if strictOrder then break end
			end
		else
			cspsD("Not found:"..myList[i][1])
		end
		if remainingPoints <= 0 then cspsD("No points left") end
		i = i +1
	end
	if remainingPoints > 0 then
		for i, v in pairs(myBase) do
			if GetChampionSkillMaxPoints(v) >= CSPS.cp2Table[v][2] then
				CSPS.cp2Table[v][2] = CSPS.cp2Table[v][2] + remainingPoints
				if CSPS.cp2Table[v][2] > GetChampionSkillMaxPoints(v) then
					remainingPoints = CSPS.cp2Table[v][2] - GetChampionSkillMaxPoints(v)
					 CSPS.cp2Table[v][2] = GetChampionSkillMaxPoints(v)
				else
					remainingPoints = 0
				end
			end
		end
	end
	CSPS.cp2HbTable[discipline] = {}
	for i, v in pairs(mySlotted) do
		table.insert(CSPS.cp2HbTable[discipline], v)
	end
	CSPS.cp2ReCheckHotbar(discipline)
	CSPS.cp2HbIcons(discipline)		
	CSPS.cp2UpdateHbMarks()
	CSPS.unsavedChanges = true
	changedCP = true
	CSPS.showElement("apply", true)
	CSPS.showElement("save", true)
	CSPS.toggleCP(discipline, true)
	CSPS.cp2UpdateSum(discipline)
	CSPS.cp2UpdateSumClusters()
	 CSPS.refreshTree()
	CSPS.showElement("cpProfiles", false)
end

local function loadCPProfile(myType, myId, discipline)
	local myProfile = {}
	if myType == 1 then
		myProfile = CSPS.savedVariables.cpProfiles[myId]
	elseif myType == 2 then
		myProfile = CSPS.currentCharData.cpProfiles[myId]
	elseif myType == 5 then
		myProfile = CSPS.currentCharData.cpHbProfiles[myId]
	end
	local cp2Comp = myProfile.cpComp or "" 
	local hbComp = myProfile.hbComp or "" 
	if myType ~= 5 then
		if myProfile.points == "(dynamic)" then
			local myAuxList = {SplitString(";", cp2Comp)}
			local myList = {}
			for i, v in ipairs(myAuxList) do
				local oneId, oneValue = SplitString("-", v)
				table.insert(myList, {tonumber(oneId), tonumber(oneValue)})
			end
			hbComp = {SplitString(",", hbComp)}
			for i, v in pairs(hbComp) do
				hbComp[i] = tonumber(v)
			end
			loadDynamicCP(myList, hbComp, {}, discipline)
			return
		end
		CSPS.cp2Extract(cp2Comp, discipline) 
	end
	CSPS.cp2HbTable[discipline] = CSPS.cp2SingleBarExtract(hbComp)
	CSPS.cp2UpdateUnlock(discipline)
	CSPS.cp2ReCheckHotbar(discipline)
	CSPS.cp2HbIcons(discipline)
	CSPS.cp2UpdateHbMarks()
	CSPS.toggleCP(discipline, true)
	CSPS.unsavedChanges = true
	changedCP = true
	CSPS.showElement("apply", true)
	CSPS.showElement("save", true)
	 CSPS.refreshTree()
	CSPS.showElement("cpProfiles", false)
end

CSPS.loadCPProfile = loadCPProfile

local function loadCPPreset(myType, myId, discipline, suppressInfoAlert)
	local myPreset = {}
	if myType == 4 then 
		myPreset = CSPS.CPPresets[myId]
	else
		return
	end
	if myPreset.points == "(dynamic)" then loadDynamicCP(myPreset.preset, myPreset.slotted, myPreset.basestatsToFill, myPreset.discipline) end
	local myMessage = ""
	if myPreset.switch then
		myMessage = zo_strformat(GS(CSPS_MSG_SwitchCP), cpColors[myPreset.discipline]:ToHex(), GetChampionSkillName(myPreset.switch))
	end
	if myPreset.situational and #myPreset.situational > 0 or myPreset.aoe or myPreset.penetration or myPreset.offBalance or myPreset.crit then
		local mySituationals = {}
		
		local function addSublist(subList)
			--local tempSubList = {}
			for i, v in pairs(subList) do 
				local myIcon = CSPS.useCustomIcons and CSPS.customCpIcons[v] or "esoui/art/champion/champion_icon_32.dds"
				table.insert(mySituationals, zo_strformat("   |t24:24:<<1>>|t |c<<2>>'<<C:3>>'|r", myIcon, cpColors[myPreset.discipline]:ToHex(), GetChampionSkillName(v)))
			end
		end
		
		if myPreset.situational and #myPreset.situational > 0 then
			addSublist(myPreset.situational)
		end
		if myPreset.aoe then
			table.insert(mySituationals, string.format("%s:", GS(CSPS_AOE)))
			addSublist(myPreset.aoe)
		end
		if myPreset.penetration then
			table.insert(mySituationals, zo_strformat("<<C:1>> < 18200:", GS(SI_DERIVEDSTATS27)))
			addSublist(myPreset.aoe)
		end
		if myPreset.offBalance then
			table.insert(mySituationals, string.format("%s > %s%%:", GS(CSPS_OffBalance), myPreset.offBalanceUp))
			addSublist(myPreset.offBalance)
		end
		if myPreset.crit then
			table.insert(mySituationals, string.format("%s < 125%%:", GS(CSPS_CRIT)))
			addSublist(myPreset.crit)
		end
				
		mySituationals = table.concat(mySituationals, "\n")
		if myMessage ~= "" then
			myMessage = string.format("%s\n\n%s\n%s", myMessage, GS(CSPS_MSG_SituationalCP), mySituationals)
		else
			myMessage = string.format("%s\n%s", GS(CSPS_MSG_SituationalCP), mySituationals)
		end	
	end
	if myMessage ~= "" and not suppressInfoAlert then
		ZO_Dialogs_ShowDialog(CSPS.name.."_OkDiag", {},  {mainTextParams = {myMessage}, titleParams = {GS(CSPS_MyWindowTitle)}})
	end
end

CSPS.loadCPPreset = loadCPPreset

function CSPS.showPresetProfileContent(control, myType, myId, discipline)
	if not myId or not myType or not discipline then return end
	local myList = {}
	local myName = ""
	if myType == 4 then
		myName = CSPS.CPPresets[myId].name
		myList = CSPS.CPPresets[myId].preset
	elseif myType == 1 or myType == 2 then
		local myProfile = myType == 1 and CSPS.savedVariables.cpProfiles[myId] or CSPS.currentCharData.cpProfiles[myId]
		local cp2Comp = myProfile.cpComp or ""
		if cp2Comp == "" then return end
		myName = myProfile.name
		local auxList = {SplitString(";", cp2Comp)}
		for i, v in pairs(auxList) do
			local oneId, oneValue = SplitString("-", v)
			table.insert(myList, {tonumber(oneId), tonumber(oneValue)})
		end
	else
		return
	end
	
	InitializeTooltip(InformationTooltip, control, LEFT)

	InformationTooltip:AddLine(myName , "ZoFontWinH2")
	ZO_Tooltip_AddDivider(InformationTooltip)
	local myTooltip = {}
	for i, v in pairs(myList) do
		table.insert(myTooltip, zo_strformat("|c<<1>><<C:2>>|r|cffffff(<<3>>)|r", cpColors[discipline]:ToHex(), GetChampionSkillName(v[1]), v[2]))
	end
	myTooltip = table.concat(myTooltip, ", ")
	InformationTooltip:AddLine(myTooltip)
end

function CSPS.showQuickSlotProfileTT(control, myType, myId)
	local theName = getCPProfileName(myId, myType)
	local qsProfile = {}
	if myType == 6 then
		qsProfile = {SplitString(",", CSPS.savedVariables.qsProfiles[myId].hbComp)}
	elseif myType == 7 then
		qsProfile = {SplitString(",", CSPS.currentCharData.qsProfiles[myId].hbComp)}
	else 
		return
	end
	local reRouteQS = {3, 2, 1, 8, 7, 6, 5, 4}
	local myTooltip = {}
	for i=1, 8 do
		local theLink = qsProfile[reRouteQS[i]] or "-"
		table.insert(myTooltip, string.format("%s) %s", i, theLink))
	end
	InitializeTooltip(InformationTooltip, control, LEFT)
	InformationTooltip:AddLine(theName , "ZoFontWinH2")
	ZO_Tooltip_AddDivider(InformationTooltip)
	myTooltip = table.concat(myTooltip, "\n")
	InformationTooltip:AddLine(myTooltip)
	addConnectionToTooltip(myType, myId, 4)
end

local function loadQuickSlots(myType, myId)
	if qsCooldown then 
		d(string.format("Cooldown: %ss", qsCooldown)) 
		CENTER_SCREEN_ANNOUNCE:AddMessage(0, CSA_CATEGORY_LARGE_TEXT, SOUNDS.ITEM_ON_COOLDOWN, "COOLDOWN", string.format("%s (%s s)", GS(SI_GAMEPAD_CONSOLE_WAIT_FOR_NAME_VALIDATION_TEXT), qsCooldown), nil, nil, nil, nil, 2000)
		--PlaySound(SOUNDS.ITEM_ON_COOLDOWN)
		return 
	end
	local qsProfile = {}
	if myType == 6 then
		qsProfile = {SplitString(",", CSPS.savedVariables.qsProfiles[myId].hbComp)}
	elseif myType == 7 then
		qsProfile = {SplitString(",", CSPS.currentCharData.qsProfiles[myId].hbComp)}
	else 
		return
	end
	for i, v in pairs(qsProfile) do
		local theSlot = i
		
		if v=="-" then
			if CallSecureProtected("ClearSlot", theSlot, HOTBAR_CATEGORY_QUICKSLOT_WHEEL) == false then d(string.format("%s - %s %s", GS(SI_PROMPT_TITLE_ERROR), GS(SI_BINDING_NAME_GAMEPAD_ASSIGN_QUICKSLOT), theSlot)) end
			--d("Empty "..theSlot)
			--d(CallSecureProtected("ClearSlot", theSlot))
		else			
			local collectibleId = GetCollectibleIdFromLink(v)
			local myItemId = GetItemLinkItemId(v)
			local _, _, myItemId2 = string.find(v, ":(%d+)|")
			myItemId2 = tonumber(myItemId2) or "no quali"
			if myItemId then
				if collectibleId then
					if CallSecureProtected("SelectSlotSimpleAction", ACTION_TYPE_COLLECTIBLE, collectibleId, theSlot, HOTBAR_CATEGORY_QUICKSLOT_WHEEL) == false then d(string.format("%s - %s %s: %s", GS(SI_PROMPT_TITLE_ERROR), GS(SI_BINDING_NAME_GAMEPAD_ASSIGN_QUICKSLOT), theSlot, v)) end
					--d("Collectible in slot "..theSlot..": "..v)
					--d(CallSecureProtected("SelectSlotSimpleAction", ACTION_TYPE_COLLECTIBLE, collectibleId, theSlot))
				else
					local foundIt = false
					local firstItemFound = false
					for slotId=0, GetBagSize(BAG_BACKPACK)-1 do
						if IsValidItemForSlot(BAG_BACKPACK, slotId, 1, HOTBAR_CATEGORY_QUICKSLOT_WHEEL) then
							local oneItem = GetItemLink(BAG_BACKPACK, slotId)
							local oneItemId = GetItemId(BAG_BACKPACK, slotId)
							if oneItemId == myItemId then
								if not foundIt then firstItemFound = slotId end
								local _, _, oneItemId2 = string.find(oneItem, ":(%d+)|")
								oneItemId2 = tonumber(oneItemId2) 
								if oneItemId2 == myItemId2 then
									if not foundIt then 
										if CallSecureProtected("SelectSlotItem", BAG_BACKPACK, slotId, theSlot, HOTBAR_CATEGORY_QUICKSLOT_WHEEL)  == false then d(string.format("%s - %s %s: %s", GS(SI_PROMPT_TITLE_ERROR), GS(SI_BINDING_NAME_GAMEPAD_ASSIGN_QUICKSLOT), theSlot, v)) end
										--d("Slotting exact match in slot "..theSlot..": "..oneItem)
										--d(CallSecureProtected("SelectSlotItem", BAG_BACKPACK, slotId, theSlot))
									end
									foundIt = true
									break
								end
							end
						end
					end
					if not foundIt then
						if firstItemFound then
							if CallSecureProtected("SelectSlotItem", BAG_BACKPACK, firstItemFound, theSlot, HOTBAR_CATEGORY_QUICKSLOT_WHEEL)  == false then d(string.format("%s - %s %s: %s", GS(SI_PROMPT_TITLE_ERROR), GS(SI_BINDING_NAME_GAMEPAD_ASSIGN_QUICKSLOT), theSlot, v)) end 
							--d("Slotting fitting item in slot "..theSlot..": "..GetItemLink(BAG_BACKPACK, firstItemFound))
							--d(CallSecureProtected("SelectSlotItem", BAG_BACKPACK, firstItemFound, theSlot))
						else
							--d("Nothing found for slot "..theSlot..": "..v)
							CallSecureProtected("ClearSlot", theSlot, HOTBAR_CATEGORY_QUICKSLOT_WHEEL)
						end
					end
					
		
				end		
			else
				d(string.format("%s - %s %s: %s", GS(SI_PROMPT_TITLE_ERROR), GS(SI_BINDING_NAME_GAMEPAD_ASSIGN_QUICKSLOT), theSlot, v))
				CallSecureProtected("ClearSlot", theSlot, HOTBAR_CATEGORY_QUICKSLOT_WHEEL)
			end
			
		end
	end
	PlaySound(SOUNDS.CHAMPION_RESPEC_ACCEPT)
	qsCooldown = 5
	--zo_callLater(function() qsCooldown = false end, 4200)
	EVENT_MANAGER:RegisterForUpdate(CSPS.name.."QsCooldown", 1000, function() 
		qsCooldown = qsCooldown - 1
		if qsCooldown == 0 then
			qsCooldown = false
			EVENT_MANAGER:UnregisterForUpdate(CSPS.name.."QsCooldown")
		end
	end)
end

function CSPS.loadConnectedQuickSlots()
	local myProfile = CSPS.currentProfile == 0 and CSPS.currentCharData or CSPS.profiles[CSPS.currentProfile]
	if not myProfile.connections or not myProfile.connections[4] then return end
	local myType, myId = SplitString("-", myProfile.connections[4])
	myType = tonumber(myType)
	myId = tonumber(myId)
	 loadQuickSlots(myType, myId)
end

local function connectToProfile(myType, myId, discipline)
	local myProfile = CSPS.currentProfile == 0 and CSPS.currentCharData or CSPS.profiles[CSPS.currentProfile]
	myProfile.connections = myProfile.connections or {}
	if myProfile.connections[discipline] == string.format("%s-%s", myType, myId) then 
		myProfile.connections[discipline] = nil 
	else
		myProfile.connections[discipline] = string.format("%s-%s", myType, myId)
	end
	CSPS.cppList:RefreshVisible()
	CSPS.refreshTree()
end

local function loadSkillProfile(myType, myId)
	local profileTypeLists = getProfileTypeLists(false, false)
	local myProfile = profileTypeLists[myType] and profileTypeLists[myType][myId]
	if not myProfile or not myProfile.hbComp or not myProfile.hbComp.prog or not myProfile.hbComp.pass then return end
	local morphs, upgrades = CSPS.skTableExtract(myProfile.hbComp.prog, myProfile.hbComp.pass)
	CSPS.populateSkills(morphs, upgrades, true) -- true = don't reset the lists beforehand
	CSPS.refreshTree()
end

function CSPS.CPListRowMouseUp( control, button, upInside, shift)	
	if not upInside then return end
	
	if button == 1 then
		if control.data.discipline < 4 then
			if shift then
				if control.data.type == 5 then return end
				connectToProfile(control.data.type, control.data.myId, control.data.discipline)
				return
			end
			if control.data.type == 1 or control.data.type == 2 or control.data.type == 5 then
				loadCPProfile(control.data.type, control.data.myId, control.data.discipline)
			else
				loadCPPreset(control.data.type, control.data.myId, control.data.discipline)
			end
		elseif control.data.discipline == 4 then
			if shift then 
				connectToProfile(control.data.type, control.data.myId, control.data.discipline)
			else
				loadQuickSlots(control.data.type, control.data.myId)
			end
			
		elseif control.data.discipline == 5 then	
			loadSkillProfile(control.data.type, control.data.myId)
		end
	elseif control.data.discipline ~= 4 then
		CSPS.showPresetProfileContent(control, control.data.type, control.data.myId, control.data.discipline)
	end

end

-- switch CP when entering a zone

function CSPS.onPlayerActivated() 
	local zoneId = GetUnitWorldPosition("player")
	if zoneId == CSPS.lastZoneID then return end
	CSPS.lastZoneID = zoneId
	CSPS.locationBinding(zoneId)
end