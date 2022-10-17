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
			if GetSlotType(reRoute1[i], hbCat) == ACTION_TYPE_EMOTE then
				table.insert(myBar, GetSlotBoundId(reRoute1[i], hbCat))
			else
				local itemLink = GetSlotItemLink(reRoute1[i], hbCat)
				itemLink = itemLink or ""
				table.insert(myBar, itemLink)
			end
		end
	end
	
	return myQSBars
end

function CSPS.readCurrentQS()
	qsBars = getCurrentQsBars(qsBars)
	CSPS.getTreeControl():RefreshVisible()
end

local function NodeSetupQS(node, control, data, open, userRequested, enabled)

	-- control.receiveDragFunction = function() receiveDrag(mySlot) end
	local ctrLink = control:GetNamedChild("Text")
	local ctrMarker = control:GetNamedChild("Marker")
	local ctrIcon = control:GetNamedChild("Icon")
	local myText = data.barTable[data.qsIndex]
	local myIcon = myText ~= "" and GetItemLinkInfo(myText) or ""
	local collectibleId = GetCollectibleIdFromLink(myText)
	
	if type(myText) == "number" then
		local emoteIndex = GetEmoteIndex(myText)
		local slashName, emoteCategory, _, emoteName = GetEmoteInfo(emoteIndex)
		myText = string.format("%s - %s", slashName, emoteName)
		
		myIcon = GetEmoteCategoryKeyboardIcons(emoteCategory)
	elseif collectibleId then
		myIcon = GetCollectibleIcon(collectibleId)
	end
	ctrLink:SetText(myText)
	ctrIcon:SetTexture(myIcon)
	ctrMarker:SetTexture("esoui/art/compass/repeatablequest_assistedareapin.dds")
	-- + means counterclockwise
	ctrMarker:SetTextureRotation(-3/4 * math.pi - (data.qsIndex * math.pi/4), 0.5,0.5)
end
--  GetCollectibleTagInfo(*integer* _collectibleId_, *luaindex* _tagIndex_)
-- ** _Returns:_ *string* _tagDescription_, *[ItemTagCategory|#ItemTagCategory]* _tagCategory_, *bool* _hideInUi_
--GetNumCollectibleTags


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