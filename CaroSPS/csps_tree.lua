
local GS = GetString
local cpIcInact = {0.21, 0.33, 0.63}
local myTree = false
local cp2Controls = {}
local cp2ClusterControls = {}
local ec = CSPS.ec
local colTbl = CSPS.colors
local cpColors = CSPS.cpColors

local TREE_SECTION_SKILLTYPES, TREE_SECTION_SKILLLINES, TREE_SECTION_SKILLS, TREE_SECTION_CHAMPIONPOINTS, TREE_SECTION_ATTRIBUTES, TREE_SECTION_GEAR, TREE_SECTION_QS, TREE_SECTION_QS_CATEGORY = 1,2,3,4,6,7,8,9

local errorColors = { -- ec = {correct = 1, wrongMorph = 2, rankHigher = 3, skillLocked = 4, rankLocked = 5, morphLocked = 6}, >>> + 1
	colTbl.white,	
	colTbl.green,  
	colTbl.red,
	colTbl.orange, 
	colTbl.red,    
	colTbl.red,    
	colTbl.red,   
}

local cp2ColorsA = {{70/255,107/255,7/255}, {23/255,101/255,135/255}, {166/255,58/255,11/255}}

-- local cpColTex = {"esoui/art/champion/champion_points_stamina_icon-hud-32.dds","esoui/art/champion/champion_points_magicka_icon-hud-32.dds","esoui/art/champion/champion_points_health_icon-hud-32.dds",}

local cpSlT = {
		"esoui/art/champion/actionbar/champion_bar_world_selection.dds",
		"esoui/art/champion/actionbar/champion_bar_combat_selection.dds",
		"esoui/art/champion/actionbar/champion_bar_conditioning_selection.dds",
}


local werewolfNode = false
local werewolfParentNode = false

local function refreshWerewolfMode(allowWerewolfMode)
	if not werewolfNode or not werewolfParentNode then return end
	local oldWerewolfMode = CSPS.werewolfMode
	CSPS.werewolfMode = allowWerewolfMode and werewolfNode:IsOpen() and werewolfParentNode:IsOpen() and not werewolfNode.data.fillContent
	if CSPS.werewolfMode == oldWerewolfMode then return end
	CSPS.hbPopulate()
end

function CSPS.onToggleSektion(buttonControl, button)
	if button == MOUSE_BUTTON_INDEX_LEFT then
		local parentNode = buttonControl:GetParent().node
		if parentNode.data.fillContent then
			for _, v in pairs(parentNode.data.fillContent) do
				local node = myTree:AddNode(v[1], v[2], parentNode) --v[1] = template, v[2] = content
			end
			parentNode.data.fillContent = nil
		end
		if buttonControl.state == parentNode:IsOpen() then ZO_ToggleButton_Toggle(buttonControl) end
		parentNode:SetOpen(not parentNode:IsOpen(), USER_REQUESTED_OPEN)
		if buttonControl.cpSection then
			CSPSWindowCP2Bar:SetHidden(not parentNode:IsOpen())
		elseif buttonControl.isWerewolf then
			refreshWerewolfMode(true)
		end
	end
end

local function showSimpleTT(control, ttInd)
	ZO_Tooltips_ShowTextTooltip(control, RIGHT, GS(ttInd))
end
	

local function showSkTT(control, i,j,k, morph, rank, errorCode, skillData)
	local myTooltip = GetAbilityDescription(GetSpecificSkillAbilityInfo(i,j,k, morph, rank))
	errorCode = errorCode or 0
	local errorAlerts = {
		[ec.correct] = function() return colTbl.green:Colorize(GS("CSPS_ErrorNumber", errorCode)) end,
		[ec.wrongMorph] = function() return colTbl.red:Colorize(GS("CSPS_ErrorNumber", errorCode)) end,
		[ec.rankHigher] = function() return colTbl.orange:Colorize(GS("CSPS_ErrorNumber", errorCode)) end,
		[ec.skillLocked] = function() 	local rankNeeded = skillData.zo_data:GetLineRankNeededToPurchase() return colTbl.red:Colorize(zo_strformat(GS(SI_ABILITY_UNLOCKED_AT), skillData.lineData.name, rankNeeded)) end,
		[ec.rankLocked] = function() local rankNeeded = skillData.zo_data:GetProgressionData(rank):GetLineRankNeededToUnlock() return colTbl.red:Colorize(zo_strformat(GS(SI_ABILITY_UNLOCKED_AT), skillData.lineData.name, rankNeeded)) end,
		[ec.morphLocked] = function() return colTbl.red:Colorize(GS(SI_ABILITYPROGRESSIONRESULT7)) end,
	}
	
	myTooltip = errorAlerts[errorCode] and string.format("%s\n\n%s", myTooltip, errorAlerts[errorCode]()) or myTooltip
	
	ZO_Tooltips_ShowTextTooltip(control, RIGHT, myTooltip)
end

local function NodeSetup(node, control, data, open, userRequested, enabled)

	local i, j, k, mySkill = unpack(data)

	--Entries: [1]Name [2]Texture [3] Rank [4]Progression [5]Purchased [6]Morph [7] Points [8] Auxlistindex [9] MaxRank/Morph [10] Errorcode
		
	local myCtrIcon = control:GetNamedChild("Icon")
	local myCtrText = control:GetNamedChild("Text")
	local myCtrPoints = control:GetNamedChild("Points")
	local myCtrMorph = control:GetNamedChild("Morph")
	local myCtrBtnPlus = control:GetNamedChild("BtnPlus")
	local myCtrBtnMinus = control:GetNamedChild("BtnMinus")
	local morphOrRank = ""
	
	if not mySkill.passive then
		morphOrRank = zo_strformat(GS(CSPS_MORPH), mySkill.morph)
		
		myCtrIcon:SetMouseEnabled(true)
		myCtrIcon:SetHandler("OnMouseUp", function(self, mouseButton, upInside) WINDOW_MANAGER:SetMouseCursor(0) end)
		myCtrIcon:SetHandler("OnDragStart", 
			function(self, button) 
				WINDOW_MANAGER:SetMouseCursor(15)
				 CSPS.onSkillDrag(i, j, k)
			end)
	else
		morphOrRank = string.format(GS(CSPS_MyRank), mySkill.rank)
		myCtrIcon:SetMouseEnabled(false)
		myCtrIcon:SetHandler("OnMouseUp", function()  end)
	end
	
	
	myCtrPoints:SetText(string.format("(%s)", mySkill.points))

	local myErrorCode = mySkill.error or 0
	local myColor = mySkill.purchased and errorColors[myErrorCode + 1] or colTbl.gray
	
	myCtrText:SetHandler("OnMouseEnter", function() showSkTT(myCtrText, i, j, k, mySkill.morph, mySkill.rank, myErrorCode, mySkill) end)
	
	myCtrText:SetHandler("OnMouseUp", 
		function(_, mouseButton, upInside, ctrl, _, shift) 
			if mouseButton == 1 and upInside and ctrl and shift then 
				d(string.format("%s - %s - %s (Morph %s, Rank %s) - ID: %s", i, j, k, mySkill.morph or "-", mySkill.rank or "-", (GetSpecificSkillAbilityInfo(i, j, k, mySkill.morph, mySkill.rank))))
			end 
		end)
	myCtrText:SetColor(myColor:UnpackRGBA())
	myCtrIcon:SetDesaturation(mySkill.purchased and 0 or 1)
	
	myCtrMorph:SetHidden(not mySkill.purchased)
	
	myCtrPoints:SetHidden(mySkill.points <= 0)
	
	myCtrBtnMinus:SetHidden(not mySkill.purchased or (mySkill.autoGrant and (mySkill.passive and mySkill.rank == 1 or not mySkill.passive and mySkill.morph == 0)))
	myCtrBtnPlus:SetHidden(mySkill.maxRaMo)
	
	myCtrBtnPlus:SetHandler("OnClicked", function(_,_,_,_,shift) CSPS.plusClickSkill(mySkill, shift) end)
	myCtrBtnPlus:SetHandler("OnMouseEnter", function() showSimpleTT(myCtrBtnPlus, CSPS_Tooltiptext_PlusSk) end)
	
	myCtrBtnMinus:SetHandler("OnClicked", function(_,_,_,_,shift) CSPS.minusClickSkill(mySkill, shift) end)
	myCtrBtnMinus:SetHandler("OnMouseEnter", function() showSimpleTT(myCtrBtnMinus, CSPS_Tooltiptext_MinusSk) end)
	
	
	myCtrIcon:SetTexture(mySkill.morph and mySkill.morph > 0 and mySkill.morphTextures[mySkill.morph] or mySkill.texture)
	myCtrText:SetText(mySkill.morph and mySkill.morph > 0 and mySkill.morphNames[mySkill.morph] or mySkill.name)

	myCtrMorph:SetText(morphOrRank)
end

local function NodeSetupAttr(node, control, data, open, userRequested, enabled)
	--Entries in data: Text, Value, entrColor
	local myText = data.name
	local myCtrText = control:GetNamedChild("Text")
	local myCtrValue = control:GetNamedChild("Value")
	local myCtrBtnPlus = control:GetNamedChild("BtnPlus")
	local myCtrBtnMinus = control:GetNamedChild("BtnMinus")
	myCtrText:SetText(myText)
	myCtrValue:SetText(CSPS.attrPoints[data.i])
	
	myCtrBtnMinus:SetHidden(CSPS.attrPoints[data.i] == 0)
	myCtrBtnPlus:SetHidden(CSPS.attrPoints[1] + CSPS.attrPoints[2] + CSPS.attrPoints[3] >= CSPS.attrSum())
	
	myCtrBtnMinus:SetHandler("OnClicked", function(_,_,_,_,shift) CSPS.attrBtnPlusMinus(data.i, -1, shift) end)
	myCtrBtnPlus:SetHandler("OnClicked", function(_,_,_,_,shift) CSPS.attrBtnPlusMinus(data.i, 1, shift) end)
	myCtrBtnPlus:SetHandler("OnMouseEnter", function() showSimpleTT(control:GetNamedChild("BtnPlus"), CSPS_Tooltiptext_PlusAttr) end)
	myCtrBtnMinus:SetHandler("OnMouseEnter", function()showSimpleTT(control:GetNamedChild("BtnMinus"), CSPS_Tooltiptext_MinusAttr) end)

	myCtrText:SetColor(data.entrColor:UnpackRGBA())
	myCtrValue:SetColor(data.entrColor:UnpackRGBA())

end

local function getErrorSumColor(data)
	if data.errorSums[ec.rankLocked] > 0 or data.errorSums[ec.skillLocked] > 0 or data.errorSums[ec.morphLocked] > 0 or data.errorSums[ec.wrongMorph] > 0 then 
		return colTbl.red 
	end
	if	data.errorSums[ec.rankHigher] > 0 then return colTbl.orange end 
	return colTbl.white
end


function CSPS.NodeSectionSetup(node, control, data, open, userRequested, enabled)
    local myText = data.name
	local myCtrText = control:GetNamedChild("Name")
	local myCtrBtnMinus = control:GetNamedChild("BtnMinus")
	local myCtrBtnPlus = control:GetNamedChild("BtnPlus")
	local btnToggle = GetControl(control, "Toggle")
	-- BtnSave
	-- IndicatorSaveNew
	
	if data.variant == TREE_SECTION_SKILLTYPES or data.variant == TREE_SECTION_SKILLLINES then -- Skill type/line
		local myData = data.variant == TREE_SECTION_SKILLTYPES and data.typeData or data.lineData
		myText = string.format("%s (%s)", myText, myData.points)

		myCtrText:SetColor(getErrorSumColor(myData):UnpackRGBA())
		
		if myData.isWerewolf then 
			btnToggle.isWerewolf = true 
			werewolfNode = node
		end
		
		if myData.isWerewolfParent then 
			btnToggle.isWerewolf = true 
			werewolfParentNode = node 
		end
		
		if node:IsOpen() and not data.fillContent then 
			myCtrBtnMinus:SetHidden(myData.points <= 0)
			myCtrBtnMinus:SetHandler("OnClicked", function(_,_,_,_,shift) CSPS.minusClickSkillLine(data.skillType, data.skillLineIndex, shift) end)
			myCtrBtnMinus:SetHandler("OnMouseEnter", function() showSimpleTT(myCtrBtnMinus, data.variant == TREE_SECTION_SKILLTYPES and CSPS_Tooltiptext_MinusSkType or CSPS_Tooltiptext_MinusSkLine) end)
			myCtrBtnPlus:SetHidden(false)
			myCtrBtnPlus:SetWidth(21)
			myCtrBtnPlus:SetHandler("OnClicked", function(_,_,_,_,shift) CSPS.plusClickSkillLine(data.skillType, data.skillLineIndex, shift) end)
			myCtrBtnPlus:SetHandler("OnMouseEnter", function() showSimpleTT(myCtrBtnPlus, CSPS_Tooltiptext_PlusSkLine) end)
			if myData.isWerewolf then refreshWerewolfMode(true) end
		else
			myCtrBtnMinus:SetHidden(true)
			myCtrBtnPlus:SetHidden(true)
			if myData.isWerewolf then refreshWerewolfMode(false) end
		end
		
	elseif data.variant == TREE_SECTION_SKILLS then -- Skills section
		myCtrText:SetColor(colTbl.white:UnpackRGBA())
		
	elseif data.variant == TREE_SECTION_GEAR then -- Gear section
		myCtrText:SetColor(colTbl.white:UnpackRGBA())
		CSPS.setupGearSection(control, node, data)
		
	elseif data.variant == TREE_SECTION_QS or data.variant == TREE_SECTION_QS_CATEGORY then
		myCtrText:SetColor(colTbl.white:UnpackRGBA())
		CSPS.setupQsSection(control, node, data)
		
	
	elseif data.variant == TREE_SECTION_CHAMPIONPOINTS then -- Champion Points section
		CSPS.cp2ParentTreeSection = control
		if (CSPS.applyCP and CSPS.unlockedCP)  or (not CSPS.showApply) then 
			myCtrText:SetColor(colTbl.white:UnpackRGBA())
		else
			myCtrText:SetColor(colTbl.gray:UnpackRGBA())
		end		
		btnToggle.cpSection = true
		
	elseif data.variant == TREE_SECTION_ATTRIBUTES then -- Attributes section
		myCtrText:SetColor(colTbl.white:UnpackRGBA())
	end
	
	myCtrText:SetText(myText)
end

local function NodeSetupCP2Discipline(node, control, data, open, userRequested, enabled) -- cp section (2.0)
	local myText = data.name
	myText = string.format("%s (%s/%s)", myText, CSPS.cp2ColorSum[data.i], GetNumSpentChampionPoints(GetChampionDisciplineId(data.i)) + GetNumUnspentChampionPoints(GetChampionDisciplineId(data.i))) -- CSPS.cpColorSum[data.i] instead of ""
	if (CSPS.applyCPc[data.i] and CSPS.unlockedCP) or (not CSPS.showApply) then 
		control:GetNamedChild("Name"):SetColor(data.entrColor:UnpackRGBA())
	else
		control:GetNamedChild("Name"):SetColor(colTbl.gray:UnpackRGBA())
	end
	
	local myProfile = CSPS.currentProfile == 0 and CSPS.currentCharData or CSPS.profiles[CSPS.currentProfile]
	myProfile = myProfile.connections and myProfile.connections[data.i] or false
	local ctrConnect = GetControl(control, "Connection")
	ctrConnect:SetColor(data.entrColor:UnpackRGBA())
	ctrConnect:SetHidden(not myProfile)
	ctrConnect:SetWidth(not myProfile and 0 or 24)
	if myProfile then
		ctrConnect:SetHandler("OnMouseEnter",
			function()
				ZO_Tooltips_ShowTextTooltip(ctrConnect, RIGHT, string.format(GS(CSPS_Tooltip_ShowConnection), CSPS.getConnectedProfileName(myProfile)))
			end)
		ctrConnect:SetHandler("OnMouseUp", 
			function(_, mouseButton, upInside) 
				if upInside and mouseButton == MOUSE_BUTTON_INDEX_RIGHT then 
					local theProfile = CSPS.currentProfile == 0 and CSPS.currentCharData or CSPS.profiles[CSPS.currentProfile]
					theProfile.connections[data.i] = nil
					myTree:RefreshVisible() 
					CSPS.cppList:RefreshVisible()
				end 
			end)
		
		local myType, myId = SplitString("-", myProfile)
		myType = tonumber(myType)
		myId = tonumber(myId)	
		
		control:GetNamedChild("IndicatorSaveNew"):SetHidden(true)
		
		if node:IsOpen() and not data.fillContent then 
			control:GetNamedChild("BtnSave"):SetHidden(myType > 2)
			control:GetNamedChild("BtnSave").tooltip = GS(CSPS_Tooltiptext_Save)
			control:GetNamedChild("BtnSave"):SetHandler("OnClicked", 
				function()  
					CSPS.cpProfile(data.i, true)
					CSPS.cp2ProfileSaveGo(myId, myType)
			end)
		else
			control:GetNamedChild("BtnSave"):SetHidden(true)
		end	
	else
		if node:IsOpen() and not data.fillContent then 
			control:GetNamedChild("BtnSave"):SetHidden(false)
			control:GetNamedChild("IndicatorSaveNew"):SetHidden(false)
			control:GetNamedChild("BtnSave").tooltip = GS(CSPS_Tooltiptext_AddProfile)
			control:GetNamedChild("BtnSave"):SetHandler("OnClicked", 
				function()  
					AddCustomMenuItem(string.gsub(GS(CSPS_CPP_BtnCustAcc), "\n", " "), 
						function()
							CSPS.cpProfType = 1
							CSPS.cpProfile(data.i, false)
							CSPS.cp2ProfilePlus(1)
						end)
					AddCustomMenuItem(string.gsub(GS(CSPS_CPP_BtnCustChar), "\n", " "), 
						function() 
							CSPS.cpProfType = 2
							CSPS.cpProfile(data.i, false)
							CSPS.cp2ProfilePlus(2)
						end)
					ShowMenu()
					
			end)
		else
			control:GetNamedChild("BtnSave"):SetHidden(true)
			control:GetNamedChild("IndicatorSaveNew"):SetHidden(true)
		end	
		
	end	
	control:GetNamedChild("Name"):SetText(myText)
end

local function NodeSetupCP2Cluster(node, control, data, open, userRequested, enabled)
	local myId = data.skId
	local mySum =  CSPS.cp2ClusterSum[myId] or 0
	local myText = zo_strformat("<<C:1>> (<<2>>)", CSPS.cp2ClustNames[myId], mySum)
	cp2ClusterControls[myId] = control
	control:GetNamedChild("Name"):SetText(myText)
	local r,g,b = data.entrColor:UnpackRGB()
	control:GetNamedChild("Marker"):SetCenterColor(r, g, b, 0.25)
	control:GetNamedChild("Marker"):SetEdgeColor(r, g, b, 0)
	if CSPS.cp2ClustActive[myId] == false then
		control:GetNamedChild("Name"):SetColor(colTbl.gray:UnpackRGBA())
	else
		control:GetNamedChild("Name"):SetColor(colTbl.white:UnpackRGBA())
	end
end

local function markLinkNodes(idList, arg)
	for _, v in pairs(idList) do
		if CSPS.cp2ClustRoots[v] ~= nil then
			local myMark2 = cp2ClusterControls[CSPS.cp2ClustRoots[v]]:GetNamedChild("Marker")
			if myMark2 ~= nil then myMark2:SetHidden(not arg) end
		end
		if cp2Controls[v] then
			local myMark = cp2Controls[v]:GetNamedChild("Marker")
			if myMark ~= nil then myMark:SetHidden(not arg) end
		end
	end
end

local function NodeSetupCP2Entry(node, control, data, open, userRequested, enabled)
	--data: entrColor = , i=discplineIndex, j=j,  skId, skType (and l if clusterentry)	
	local myId = data.skId
	local myValue = CSPS.cp2Table[myId][2]
	local myCurrentValue = GetNumPointsSpentOnChampionSkill(myId)
	local myMax = GetChampionSkillMaxPoints(myId)
	local myValPercent = myValue / myMax
	local isUnlocked = CSPS.cp2Table[myId][1]
	control.ctrValue:SetText(myValue)
	if myValPercent <= 1 then control.ctrProgress:SetWidth(76 * myValPercent) else control.ctrProgress:SetWidth(76) end
	
	if not cp2Controls[myId] then	
		control.ctrName:SetText(zo_strformat("<<C:1>>", GetChampionSkillName(myId)))
		local r,g,b = data.entrColor:UnpackRGB()
		control.ctrMarker:SetCenterColor(r,g,b, 0.4)
		control.ctrMarker:SetEdgeColor(0,0,0,0)
		control.ctrProgress:SetColor(r,g,b, 0.4)
		if DoesChampionSkillHaveJumpPoints(myId) then
			control.jP = {}
			for i, v in pairs({GetChampionSkillJumpPoints(myId)}) do
				local xPos = v/myMax * 76
				if not control.jP[i] then
					control.jP[i] =  WINDOW_MANAGER:CreateControl(nil, control, CT_TEXTURE)
				end
				control.jP[i]:SetAnchor(TOP, control.ctrProgress, TOPLEFT, xPos, 1)
				control.jP[i]:SetDimensions(1, 14)
			end
		end
		if data.l ~= nil then
			control.ctrName:SetWidth(260)
			control.ctrMarker:SetWidth(260)
		end
		cp2Controls[myId] = control
	end
	for i, v in pairs({GetChampionSkillJumpPoints(myId)}) do
		if i > 1 then
			if v > myValue or myValue == 0 then 
				control.jP[i]:SetColor(0.66,0.66,0.66) 
				control.jP[i]:SetWidth(1)
			else 
				control.jP[i]:SetColor(1,0.8,0) 
				control.jP[i]:SetWidth(3)
			end
		end
	end	
	control.ctrValue:SetHandler("OnMouseEnter", function() CSPS.showCpTT(control.ctrValue, myId, myValue) end)
	control.ctrProgBg:SetHandler("OnMouseEnter", function() CSPS.showCpTT(control.ctrValue, myId, myValue) end)
	control.ctrName:SetHandler("OnMouseEnter", 
		function() 
			if data.skType ~= 3 then
				markLinkNodes({myId, GetChampionSkillLinkIds(myId)}, true)
			end
			CSPS.showCpTT(control.ctrName, myId, myValue)
		end)
	control.ctrName:SetHandler("OnMouseExit", 
		function() 
			if data.skType ~= 3 then
				markLinkNodes({myId, GetChampionSkillLinkIds(myId)}, false)
			end
			ZO_Tooltips_HideTextTooltip() 
		end)
	if data.skType ~= 3 then
		control.ctrBtnPlus:SetHandler("OnMouseEnter", 
			function() 
				markLinkNodes({myId, GetChampionSkillLinkIds(myId)}, true)  
				showSimpleTT(control.ctrBtnPlus, CSPS_Tooltiptext_PlusCP)
			end)
		control.ctrBtnPlus:SetHandler("OnMouseExit", 
			function() 
				markLinkNodes({myId, GetChampionSkillLinkIds(myId)}, false) 
				ZO_Tooltips_HideTextTooltip()
			end)
	else
		control.ctrBtnPlus:SetHandler("OnMouseEnter", function() showSimpleTT(control.ctrBtnPlus, CSPS_Tooltiptext_PlusCP) end)
		control.ctrBtnPlus:SetHandler("OnMouseExit", function() ZO_Tooltips_HideTextTooltip() end)
	end
	control.ctrBtnMinus:SetHandler("OnMouseEnter", function() showSimpleTT(control.ctrBtnMinus, CSPS_Tooltiptext_MinusCP) end)
	control.ctrBtnMinus:SetHandler("OnMouseExit", function() ZO_Tooltips_HideTextTooltip() end)
	local inCol = cpIcInact[data.i]
	if data.skType == 1  then
		control.ctrIcon:SetTexture(CSPS.cpColTex[data.i])
		control.ctrIcon:SetColor(1,1,1)
	else 
		control.ctrIcon:SetTexture("esoui/art/champion/champion_icon_32.dds")
		control.ctrIcon:SetTextureCoords(-0.1,1.1,-0.1,1.1)
		control.ctrIcon:SetColor(unpack(cp2ColorsA[data.i]))
		control.ctrIcon:SetMouseEnabled(true)
		control.ctrIcon:SetHandler("OnMouseUp", function(self, mouseButton, upInside) WINDOW_MANAGER:SetMouseCursor(0) if upInside then CSPS.clickCPIcon(myId, mouseButton) end end)
		control.ctrIcon:SetHandler("OnDragStart", 
			function(self, button) 
				 WINDOW_MANAGER:SetMouseCursor(15)
				 CSPS.onCpDrag(myId, data.i)
			end)
		inCol = cpIcInact[1]
	end
	if isUnlocked == false then
		control.ctrIcon:SetDesaturation(1)
		control.ctrIcon:SetColor(inCol, inCol, inCol)		
		control.ctrName:SetColor(colTbl.gray:UnpackRGBA())
		control.ctrValue:SetColor(colTbl.gray:UnpackRGBA())
		control.ctrBtnMinus:SetHidden(true)
		control.ctrBtnPlus:SetHidden(true)
		control.ctrCircle:SetHidden(true)		
	else
		control.ctrIcon:SetDesaturation(0)
		if CSPS.cp2InHb[myId] == true then
			control.ctrIcon:SetDesaturation(0)
			control.ctrIcon:SetColor(1,1,1)
			control.ctrCircle:SetHidden(false)
			control.ctrCircle:SetTexture(cpSlT[data.i])
			if data.i == 1 then control.ctrCircle:SetColor(0.8235, 0.8235, 0) end	-- re-color the not-so-green circle for the green cp...
		elseif data.skType > 1 and WouldChampionSkillNodeBeUnlocked(myId, myValue) then
			control.ctrCircle:SetHidden(false)
			control.ctrCircle:SetTexture("esoui/art/champion/actionbar/champion_bar_slot_frame.dds")
			control.ctrCircle:SetColor(1,1,1)
		else
			control.ctrCircle:SetHidden(true)			
		end
		control.ctrName:SetColor(colTbl.white:UnpackRGBA())
		if myValue < myCurrentValue then
			control.ctrValue:SetColor(colTbl.orange:UnpackRGBA())
		elseif myValue == myCurrentValue and myValue > 0 then
			control.ctrValue:SetColor(colTbl.green:UnpackRGBA())
		else
			control.ctrValue:SetColor(colTbl.white:UnpackRGBA())
		end
		
		control.ctrBtnPlus:SetHidden(myValue >= GetChampionSkillMaxPoints(myId))
		control.ctrBtnMinus:SetHidden(myValue <= 0)
	end
	control.ctrName:SetHandler("OnMouseUp", function(self, mouseButton, upInside, ctrl, _, shift) 
		if upInside then 
			if mouseButton == 1 and ctrl and shift then
				d(myId)
			else
				CSPS.cpClicked(self, myId, mouseButton) 
			end
		end 
	end)
	control.ctrBtnPlus:SetHandler("OnClicked", function(_,_,_,_,shift) CSPS.cp2BtnPlusMinus(data.skId, 1, shift) end)
	control.ctrBtnMinus:SetHandler("OnClicked", function(_,_,_,_,shift) CSPS.cp2BtnPlusMinus(data.skId, -1, shift) end)
	
end

function CSPS.prepareTheTree()
	local scrollContainer = CSPSWindow:GetNamedChild("ScrollList")
	myTree = ZO_Tree:New(scrollContainer:GetNamedChild("ScrollChild"), 24, 0, 2000)
	myTree:AddTemplate("CSPSLE", NodeSetup, nil, nil, 24, 0)
	myTree:AddTemplate("CSPSLATTR", NodeSetupAttr, nil, nil, 24, 0)
	myTree:AddTemplate("CSPSLH", CSPS.NodeSectionSetup, nil, nil, 24, 0)

	myTree:AddTemplate("CSPSCP2HB", NodeSetupCP2Discipline, nil, nil, 24, 0)
	myTree:AddTemplate("CSPSCP2CL", NodeSetupCP2Cluster, nil, nil, 24, 0)
	myTree:AddTemplate("CSPSCP2L", NodeSetupCP2Entry, nil, nil, 24, 0)
	myTree:RefreshVisible() 
end

function CSPS.refreshTree()
	if myTree then myTree:RefreshVisible() end
end

function CSPS.createTable()

	-- Generate tree for skills

	local typeContent = {}
	for skillType, typeData in ipairs(CSPS.skillTable) do
		local lineContent = {}
		for skillLineIndex, lineData in ipairs(typeData) do
			if not (skillType == 6 and skillLineIndex == CSPS.kaiserFranz) then
				local fillContent = {}
				for skillIndex, skillData in ipairs(lineData) do
					table.insert(fillContent, {"CSPSLE", {skillType, skillLineIndex, skillIndex, skillData}})
				end
				
				table.insert(lineContent, {"CSPSLH", {name = lineData.name, variant = TREE_SECTION_SKILLLINES, skillType=skillType, skillLineIndex=skillLineIndex, fillContent=fillContent, lineData=lineData}})

			end
		end
		table.insert(typeContent, {"CSPSLH", {name = GS("SI_SKILLTYPE", skillType), variant = TREE_SECTION_SKILLTYPES, skillType=skillType, fillContent=lineContent, typeData = typeData}})
	end
	local overnode = myTree:AddNode("CSPSLH", {name = GS(SI_CHARACTER_MENU_SKILLS), variant=TREE_SECTION_SKILLS, fillContent=typeContent})
	
	-- Generate tree for attribute points
	local fillContent = {
		{"CSPSLATTR", {name = GS(SI_ATTRIBUTES1), i=1, entrColor=cpColors[3]}},
		{"CSPSLATTR", {name = GS(SI_ATTRIBUTES2), i=2, entrColor=cpColors[2]}},
		{"CSPSLATTR", {name = GS(SI_ATTRIBUTES3), i=3, entrColor=cpColors[1]}}
	}
	local overnode = myTree:AddNode("CSPSLH", {name = GS(SI_STATS_ATTRIBUTES), variant=TREE_SECTION_ATTRIBUTES, fillContent=fillContent})
	
		-- Generate tree for CP
	if CSPS.unlockedCP then
		local overnode = myTree:AddNode("CSPSLH", {name = GS(CSPS_TxtCpNew), variant=TREE_SECTION_CHAMPIONPOINTS})
		local cp2Table = CSPS.cp2Table
		local changeOrder = {2,3,1}
		for auxId = 1, 3 do
			local discplineIndex = changeOrder[auxId]
			local fillContent = {}
			for j, v in pairs(CSPS.cp2List[discplineIndex]) do
				if v[2] == 4 then
					local subContent = {}
					for l, w in pairs(CSPS.cp2ListCluster[v[1]]) do						
						table.insert(subContent, {"CSPSCP2L", {entrColor = cpColors[discplineIndex], i=discplineIndex,  j=j, l=l, skId=w[1], skType=w[2]}})
					end
					table.insert(fillContent, {"CSPSCP2CL", {entrColor = cpColors[discplineIndex], i=discplineIndex,  j=j,  skId=v[1], fillContent=subContent}})
				else
					table.insert(fillContent, {"CSPSCP2L", {entrColor = cpColors[discplineIndex], i=discplineIndex, j=j,  skId=v[1], skType=v[2]}})
				end
				
			end			
			local nodeoversection = myTree:AddNode("CSPSCP2HB", {name = zo_strformat("<<C:1>>", GetChampionDisciplineName(GetChampionDisciplineId(discplineIndex))), entrColor = cpColors[discplineIndex], i=discplineIndex, fillContent=fillContent}, overnode)

		end
	end
	
	if CSPS.doGear then CSPS.setupGearTree() end
	CSPS.tabEx = true
end

function CSPS.getTreeControl()
	return myTree
end