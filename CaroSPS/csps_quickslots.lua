local GS = GetString
local qsBars = {}
local barCategories = {
	HOTBAR_CATEGORY_QUICKSLOT_WHEEL,
	HOTBAR_CATEGORY_ALLY_WHEEL,
	HOTBAR_CATEGORY_MEMENTO_WHEEL,
	HOTBAR_CATEGORY_TOOL_WHEEL,
	HOTBAR_CATEGORY_EMOTE_WHEEL
}

local reRoute1 = {4, 3, 2, 1, 8, 7, 6, 5}

local function getCurrentQsBars(givenQSBars)
	local myQSBars = givenQSBars or {}
	
	for hbIndex, hbCat in pairs(barCategories) do
		myQSBars[hbIndex] = myQSBars[hbIndex] or {}
		local myBar = myQSBars[hbIndex]
		
		for i=1, ACTION_BAR_UTILITY_BAR_SIZE do
			local slotType = GetSlotType(reRoute1[i], hbCat)
			local slotTypesForId = {[ACTION_TYPE_EMOTE] = true, [ACTION_TYPE_QUICK_CHAT] = true}
			if slotTypesForId[slotType] then
				table.insert(myBar, {type = slotType, value=GetSlotBoundId(reRoute1[i], hbCat)})
			else
				local itemLink = GetSlotItemLink(reRoute1[i], hbCat)
				itemLink = itemLink or ""
				table.insert(myBar, {type = slotType, value=itemLink})
			end -- ACTION_TYPE_QUICK_CHAT
		end
	end
	
	return myQSBars
end

function CSPS.readCurrentQS()
	qsBars = getCurrentQsBars(qsBars)
	CSPS.getTreeControl():RefreshVisible()
end

local function qsActionInfo(myAction)
	if not myAction or myAction.value == "" then 
		return "esoui/art/actionbar/passiveabilityframe_round_empty.dds", "-", false, false, false 
	end
	
	if myAction.type == ACTION_TYPE_EMOTE then
	
		local emoteIndex = GetEmoteIndex(myAction.value)
		local slashName, emoteCategory, _, emoteName = GetEmoteInfo(emoteIndex)
		local listText = string.format("%s - %s", slashName, emoteName)		
		local myIcon = GetEmoteCategoryKeyboardIcons(emoteCategory)
		local additionalDescription = GetCollectibleDescription(GetEmoteCollectibleId(emoteIndex))
		
		return myIcon, listText, emoteName, slashName, {additionalDescription}
		
	elseif myAction.type == ACTION_TYPE_QUICK_CHAT then
	
			local myName = GetDefaultQuickChatName(myAction.value)
			local myMessage = GetDefaultQuickChatMessage(myAction.value)
			
			return "esoui/art/hud/radialicon_whisper_over.dds", myName, myName, false, {myMessage}
			
	elseif myAction.type == ACTION_TYPE_COLLECTIBLE then
	
		local collectibleId = GetCollectibleIdFromLink(myAction.value)
		local myIcon = GetCollectibleIcon(collectibleId)
		local additionalDescription = GetCollectibleDescription(collectibleId)
		
		return myIcon, myAction.value, myAction.value, false, {additionalDescription}
		
	else
		
		local myIcon = GetItemLinkInfo(myAction.value)
		
		local _, _, onUseText =  GetItemLinkOnUseAbilityInfo(myAction.value)
		local additionalDescription = {}
		if onUseText and onUseText ~= "" then
			table.insert(additionalDescription, onUseText)
		end
		for i=1, 10 do
			local hasAb, abText = GetItemLinkTraitOnUseAbilityInfo(currentCustomItem, i)
			if not hasAb then break end
			if abText and abText ~= "" then 
				table.insert(additionalDescription, abText)
			else 
				break
			end
		end
		
		return myIcon, myAction.value, myAction.value, false, additionalDescription
		
	end
end

local function NodeSetupQS(node, control, data, open, userRequested, enabled)

	-- control.receiveDragFunction = function() receiveDrag(mySlot) end
	local ctrText = control:GetNamedChild("Text")
	local ctrMarker = control:GetNamedChild("Marker")
	local ctrIcon = control:GetNamedChild("Icon")
	
	local myAction = data.barTable[data.qsIndex]
	local myIcon, listText, myName, subtitle, additionalDescription = qsActionInfo(myAction)
		
	if myName then
		control.tooltipFunction = function()
			InitializeTooltip(InformationTooltip, ctrText, LEFT)
			InformationTooltip:AddLine(zo_strformat("|t28:28:<<1>>|t <<C:2>>", myIcon , myName), "ZoFontWinH2")
			--, r, g, b, CENTER, MODIFY_TEXT_TYPE_NONE, TEXT_ALIGN_CENTER, true)
			--ZO_Tooltip_AddDivider(InformationTooltip)
			if subtitle then InformationTooltip:AddLine(subtitle, "ZoFontGame") end 
			if additionalDescription and #additionalDescription > 0 then
				ZO_Tooltip_AddDivider(InformationTooltip)
				for i, v in pairs(additionalDescription) do
					InformationTooltip:AddLine(v, "ZoFontGame")
				end
			end
		end
	else
		control.tooltipFunction = function() end
	end
	
	ctrText:SetText(listText)
	ctrIcon:SetTexture(myIcon)
	ctrMarker:SetTexture("esoui/art/compass/repeatablequest_assistedareapin.dds")
	-- + means counterclockwise
	ctrMarker:SetTextureRotation(-3/4 * math.pi - (data.qsIndex * math.pi/4), 0.5,0.5)
end


function CSPS.setupQsSection(control, node, data)

	if node:IsOpen() and not data.fillContent then
		
	end
	
end

-- CSPS.readCurrentQS() CSPS.setupQsTree()

function CSPS.setupQsTree()
	
	local myTree = CSPS.getTreeControl()
	myTree:AddTemplate("CSPSQSLE", NodeSetupQS, nil, nil, 24, 0)
	local fillContent = {}
	for barIndex, barTable in pairs(qsBars) do
		local fillContentBar = {}
		for qsIndex, itemLink in pairs(barTable) do
			table.insert(fillContentBar, {"CSPSQSLE", {barIndex = barIndex, barTable = barTable, qsIndex = qsIndex}})
		end
		table.insert(fillContent, {"CSPSLH", {name = GS("SI_HOTBARCATEGORY", barCategories[barIndex]), variant = 8, fillContent=fillContentBar}})
	end
	local overNode = myTree:AddNode("CSPSLH", {name = GS(SI_HOTBARCATEGORY10), variant=8, fillContent=fillContent}) 

	
	myTree:RefreshVisible()
end