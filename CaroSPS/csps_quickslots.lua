local GS = GetString
local qsBars = {}
local slotToEdit = false

local typeComboBox = false
local categoryComboBox = false
local currentType = false
local currentCategory = false

local CSPS_qsCollectibleList = ZO_SortFilterList:Subclass()
local qsCollectibleList = false

function CSPS.getSlotToEdit()
	d(slotToEdit)
end

local barCategories = {
	HOTBAR_CATEGORY_QUICKSLOT_WHEEL,
	HOTBAR_CATEGORY_ALLY_WHEEL,
	HOTBAR_CATEGORY_MEMENTO_WHEEL,
	HOTBAR_CATEGORY_TOOL_WHEEL,
	HOTBAR_CATEGORY_EMOTE_WHEEL
}

local reRoute1 = {4, 3, 2, 1, 8, 7, 6, 5} -- want the quickslots to beginn at the top of the circle and not counterclockwise at 4 o'clock...

local function getCurrentQsBars(givenQSBars)
	local myQSBars = givenQSBars or {}
	
	for hbIndex, hbCat in pairs(barCategories) do
		myQSBars[hbIndex] = myQSBars[hbIndex] or {}
		local myBar = myQSBars[hbIndex]
		
		for i=1, ACTION_BAR_UTILITY_BAR_SIZE do
			local slotType = GetSlotType(reRoute1[i], hbCat)
			local slotTypesForId = {[ACTION_TYPE_EMOTE] = true, [ACTION_TYPE_QUICK_CHAT] = true}
			if slotTypesForId[slotType] then
				myBar[i] = {type = slotType, value=GetSlotBoundId(reRoute1[i], hbCat)}
			else
				local itemLink = GetSlotItemLink(reRoute1[i], hbCat)
				itemLink = itemLink or ""
				myBar[i] = {type = slotType, value=itemLink}
			end -- ACTION_TYPE_QUICK_CHAT
		end
	end
	
	return myQSBars
end

function CSPS.readCurrentQS()
	qsBars = getCurrentQsBars(qsBars)
end

local function getItemLinkTooltip(itemLink)
	local myIcon = GetItemLinkInfo(itemLink)
	
	local _, _, onUseText =  GetItemLinkOnUseAbilityInfo(itemLink)
	local additionalDescription = {}
	if onUseText and onUseText ~= "" then
		table.insert(additionalDescription, onUseText)
	end
	for i=1, 10 do
		local hasAb, abText = GetItemLinkTraitOnUseAbilityInfo(itemLink, i)
		if not hasAb then break end
		if abText and abText ~= "" then 
			table.insert(additionalDescription, abText)
		else 
			break
		end
	end
	return itemLink, myIcon, additionalDescription
end

local function qsActionInfo(myAction)
	if not myAction or myAction.value == "" then 
		return "esoui/art/actionbar/passiveabilityframe_round_empty.dds", "-", false, false, false 
	end
	
	if myAction.type == ACTION_TYPE_EMOTE then
	
		local emoteIndex = GetEmoteIndex(myAction.value)
		local slashName, emoteCategory, _, emoteName = GetEmoteInfo(emoteIndex)
		local myIcon = GetEmoteCategoryKeyboardIcons(emoteCategory)
		local additionalDescription = GetCollectibleDescription(GetEmoteCollectibleId(emoteIndex))
		additionalDescription = additionalDescription ~= "" and additionalDescription or nil
		return myIcon, string.format("%s - %s", slashName, emoteName), emoteName, slashName, {additionalDescription}
		
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
		
		local _, myIcon, additionalDescription = getItemLinkTooltip(myAction.value)
		
		return myIcon, myAction.value, myAction.value, false, additionalDescription
		
	end
end

local function NodeSetupQS(node, control, data, open, userRequested, enabled)

	-- control.receiveDragFunction = function() receiveDrag(mySlot) end
	local ctrText = control:GetNamedChild("Text")
	local ctrMarker = control:GetNamedChild("Marker")
	local ctrIcon = control:GetNamedChild("Icon")
	local ctrMinus = control:GetNamedChild("BtnMinus")
	
	
	local myAction = data.barTable[data.qsIndex]
	local myIcon, listText, myName, subtitle, additionalDescription = qsActionInfo(myAction)
	
	ctrMinus:SetHidden(not myAction)
	ctrMinus:SetHandler("OnClicked", function() 		
		data.barTable[data.qsIndex] = {} 
		CSPS.getTreeControl():RefreshVisible()
	end)
	
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
	
	control:SetHandler("OnMouseUp", function(self, button, upInside)
		if not upInside then return end
		if button == 2 then
			slotToEdit = {bar = data.barIndex, slot = data.qsIndex}
			
			CSPS.openCollectibleList()
			CSPS.getTreeControl():RefreshVisible()
			return
		end
	end)
	
	ctrText:SetText(listText)
	ctrIcon:SetTexture(myIcon)
	local markerTexture = "esoui/art/compass/repeatablequest_assistedareapin.dds"
	if slotToEdit and slotToEdit.bar == data.barIndex and slotToEdit.slot == data.qsIndex then
		markerTexture = "esoui/art/compass/repeatablequest_available_icon.dds"
	end
	ctrMarker:SetTexture(markerTexture)
	-- + means counterclockwise
	ctrMarker:SetTextureRotation(-3/4 * math.pi - (data.qsIndex * math.pi/4), 0.5,0.5)
end

function CSPS.cancelQuickSlotEdit()
	CSPSWindowCollectibles:SetHidden(true)
	slotToEdit = false
	
	CSPS.getTreeControl():RefreshVisible()
end

local function setQuickSlot(actionType, actionValue)
	CSPSWindowCollectibles:SetHidden(true)
	if not slotToEdit then return end
	local slotData = qsBars[slotToEdit.bar][slotToEdit.slot] or {}
	qsBars[slotToEdit.bar][slotToEdit.slot] = slotData
	slotData.type = actionType
	slotData.value = actionValue
	slotToEdit = false
	CSPS.getTreeControl():RefreshVisible()
end

function CSPS_qsCollectibleList:New( control )
	local list = ZO_SortFilterList.New(self, control)
	list.frame = control
	list:Setup()
	return list
end

function CSPS_qsCollectibleList:SetupItemRow( control, data )
	control.data = data
	GetControl(control, "Name").normalColor = ZO_DEFAULT_TEXT
	GetControl(control, "Name"):SetText(data.name)	
	control.tooltipFunction = function()
		qsCollectibleList:Row_OnMouseEnter(control)
		if data.tooltipFunction then data.tooltipFunction(control) end
	end
	control.mouseExitFunction = function() qsCollectibleList:Row_OnMouseExit(control) end
	ZO_SortFilterList.SetupRow(self, control, data)
end

function CSPS_qsCollectibleList:Setup( )
	ZO_ScrollList_AddDataType(self.list, 1, "CSPSqsEditListEntry", 28, function(control, data) self:SetupItemRow(control, data) end)
	ZO_ScrollList_EnableHighlight(self.list, "ZO_ThinListHighlight")
	self:SetAlternateRowBackgrounds(true)
	self.masterList = {}
	
	local sortKeys = {}
	self.currentSortKey = ""
	self.currentSortOrder = ZO_SORT_ORDER_UP
	self.sortFunction = function( listEntry1, listEntry2 )	return listEntry1.data.name < listEntry2.data.name end
	self:RefreshData()
end

local function showItemTooltip(control, itemLink, myIcon, additionalDescription)
	InitializeTooltip(InformationTooltip, control, LEFT)
	InformationTooltip:AddLine(zo_strformat("|t28:28:<<1>>|t <<C:2>>", myIcon , itemLink), "ZoFontWinH2")
	if additionalDescription and #additionalDescription > 0 then
		ZO_Tooltip_AddDivider(InformationTooltip)
		for i, v in pairs(additionalDescription) do
			InformationTooltip:AddLine(v, "ZoFontGame")
		end
	end	
end

function CSPS_qsCollectibleList:BuildMasterList()
	self.masterList = {}
	--CSPSqsEditListEntry
	if currentType == ACTION_TYPE_EMOTE then
	
		local emoteList = PLAYER_EMOTE_MANAGER:GetEmoteListForType(currentCategory)
		
		for i, emote in ipairs(emoteList) do
			local emoteInfo = PLAYER_EMOTE_MANAGER:GetEmoteItemInfo(emote)
			table.insert(self.masterList, 
				{
					name = string.format("%s - %s", emoteInfo.emoteSlashName, emoteInfo.displayName),
					tooltipFunction = function(control) end,
					leftClickFunction = function() setQuickSlot(ACTION_TYPE_EMOTE, emoteInfo.emoteId) end,
					rightClickFunction = function() PlayEmoteByIndex(emoteInfo.emoteIndex) end,
				})
			-- emoteCategory = emoteCategory,
			--emoteId = emoteId,
			--emoteIndex = emoteIndex,
			--displayName = displayName,
			-- emoteSlashName = emoteSlashName,
			--showInGamepadUI = showInGamepadUI,
			--isOverriddenByPersonality = isOverriddenByPersonality,
		end
		
	elseif currentType == ACTION_TYPE_QUICK_CHAT then
		local quickChatList = QUICK_CHAT_MANAGER:BuildQuickChatList()
        for i, quickChatId in ipairs(quickChatList) do
			table.insert(self.masterList, 
				{
					name = QUICK_CHAT_MANAGER:GetFormattedQuickChatName(quickChatId),
					tooltipFunction = function(control) end,
					leftClickFunction = function() setQuickSlot(ACTION_TYPE_QUICK_CHAT, quickChatId) end,
					rightClickFunction = function() end,
				})
        end
	
	elseif currentType == ACTION_TYPE_COLLECTIBLE then
		
		local function collectibleCategoryIterator(catData)
			for i=1, catData:GetNumCollectibles() do
				local collectibleData = catData:GetCollectibleDataByIndex(i)
				if collectibleData:IsUnlocked() then
					table.insert(self.masterList,
						{
							name = collectibleData:GetFormattedName(),
							tooltipFunction = function(control) 
								InitializeTooltip(InformationTooltip, control, LEFT)
								InformationTooltip:AddLine(collectibleData:GetFormattedName(), "ZoFontWinH2")
								InformationTooltip:AddLine(string.format("\n|t48:48:%s|t\n", collectibleData:GetIcon()), "ZoFontGame")
								ZO_Tooltip_AddDivider(InformationTooltip)
								InformationTooltip:AddLine(collectibleData:GetDescription(), "ZoFontGame") 							
							end,
							leftClickFunction = function() setQuickSlot(ACTION_TYPE_COLLECTIBLE, GetCollectibleLink(collectibleData:GetId())) end,
							rightClickFunction = function() 
								if collectibleData:IsUsable(GAMEPLAY_ACTOR_CATEGORY_PLAYER) then
									collectibleData:Use(GAMEPLAY_ACTOR_CATEGORY_PLAYER)
								end
							end,
						})
				end
			end
		end
					
		local collectibleCategoryData = ZO_COLLECTIBLE_DATA_MANAGER:GetCategoryDataById(currentCategory)
		collectibleCategoryIterator(collectibleCategoryData)
		
		for i = 1, collectibleCategoryData:GetNumSubcategories() do
			collectibleCategoryIterator(collectibleCategoryData:GetSubcategoryData(i))
		end
	elseif currentType == ACTION_TYPE_ITEM then
		if currentCategory ~= 3 then 
			local itemTypes = { -- more categories?
			
				[ITEMTYPE_POTION] = 1,
				[ITEMTYPE_FOOD] = 2,
				[ITEMTYPE_DRINK] = 2,
			}
			for slotIndex = 0, GetBagSize(BAG_BACKPACK) do
				if IsValidItemForSlot(BAG_BACKPACK, slotIndex, 1, HOTBAR_CATEGORY_QUICKSLOT_WHEEL) then 
					local itemType = GetItemType(BAG_BACKPACK, slotIndex)
					if itemTypes[itemType] then
						if itemTypes[itemType] == currentCategory then
							table.insert(self.masterList, 
								{
									name = zo_strformat("<<C:1>>", GetItemName(BAG_BACKPACK, slotIndex)),
									tooltipFunction = function(control)
										showItemTooltip(control, getItemLinkTooltip(GetItemLink(BAG_BACKPACK, slotIndex)))
										end,
									leftClickFunction = function() setQuickSlot(ACTION_TYPE_ITEM, GetItemLink(BAG_BACKPACK, slotIndex)) end,
									rightClickFunction = function() end,
								})
						end
					elseif currentCategory == 4 then
							table.insert(self.masterList, 
								{
									name = zo_strformat("<<C:1>>", GetItemName(BAG_BACKPACK, slotIndex)),
									tooltipFunction = function(control) showItemTooltip(control, getItemLinkTooltip(GetItemLink(BAG_BACKPACK, slotIndex))) end,
									leftClickFunction = function() setQuickSlot(ACTION_TYPE_ITEM, GetItemLink(BAG_BACKPACK, slotIndex)) end,
									rightClickFunction = function() end,
								})
					end
				end
			end
		else
			for journalIndex=1, MAX_JOURNAL_QUESTS do 
				for toolIndex=1, GetQuestToolCount(journalIndex) do
					local _, _, _, questItemName, questItemId = GetQuestToolInfo(journalIndex, toolIndex)
					questItemName = zo_strformat("<<C:1>>", questItemName)
					if CanQuickslotQuestItemById(questItemId) then
						table.insert(self.masterList, 
							{
								name = questItemName,
								tooltipFunction = function(control)
									local descr = GetQuestItemTooltipText(questItemId)
									local myIcon = GetQuestItemIcon(questItemId)
									showItemTooltip(control, questItemName, myIcon, {descr})
								end,
								leftClickFunction = function() end,
								rightClickFunction = function() end,
							})
					end
				end
			end
		end
		-- 1) potions
		-- 2) food/drink
		-- 3) quest items
		-- 4) others
			
	end	
end

function CSPS_qsCollectibleList:FilterScrollList()
	local scrollData = ZO_ScrollList_GetDataList(self.list)
	ZO_ClearNumericallyIndexedTable(scrollData)
	for _, data in ipairs(self.masterList) do
		table.insert(scrollData, ZO_ScrollList_CreateDataEntry(1, data))
	end
end


local function updateCategoryCombo(myType)
	currentType = myType
	categoryComboBox = categoryComboBox or ZO_ComboBox_ObjectFromContainer(CSPSWindowCollectiblesCategories)
	
	categoryComboBox:ClearItems()
	categoryComboBox:SetSortsItems(false)
	
	local function OnItemSelect(choiceValue)
		currentCategory = choiceValue
		
		if not qsCollectibleList then qsCollectibleList = CSPS_qsCollectibleList:New(CSPSWindowCollectibles) end
		qsCollectibleList:RefreshData()
		
		CSPSWindowCollectiblesList:SetHidden(false)
		PlaySound(SOUNDS.POSITIVE_CLICK)
	end
		
	local myTypes = {}
	local preSelectName = false
	
	if myType == ACTION_TYPE_EMOTE then
		for _, emoteType in pairs(PLAYER_EMOTE_MANAGER:GetEmoteCategories()) do	
			if emoteType ~= EMOTE_CATEGORY_INVALID then
				table.insert(myTypes, {name = zo_strformat("<<C:1>>", GS("SI_EMOTECATEGORY", emoteType)), value = emoteType})
			end
		end
	elseif myType == ACTION_TYPE_QUICK_CHAT then
		CSPSWindowCollectiblesCategories:SetHidden(true)
		OnItemSelect(1)
	elseif myType == ACTION_TYPE_ITEM then
		local itemTypeCategories = {
			GS(SI_ITEMTYPE7), --potions
			string.format("%s/%s", GS(SI_ITEMTYPE4), GS(SI_ITEMTYPE12)), -- 4: food, 12: drink
			GS(SI_ITEMFILTERTYPE26), -- quest items (not in the regular inventory)
			GS(SI_FURNITURETHEMETYPE1), -- others
		}
		for i, v in pairs(itemTypeCategories) do
			table.insert(myTypes, {name = zo_strformat("<<C:1>>", v), value = i})
		end
	elseif myType == ACTION_TYPE_COLLECTIBLE then
		local collectibleCategoryIdByBarCat = {
			[HOTBAR_CATEGORY_QUICKSLOT_WHEEL] = {
					91, -- Companions
					5, -- Collectibles
					66, -- Tools
					3, -- Non-Combat Pet
					13, -- appearances
				},
			[HOTBAR_CATEGORY_ALLY_WHEEL] = { 91 },
			[HOTBAR_CATEGORY_MEMENTO_WHEEL] = { 5 },
			[HOTBAR_CATEGORY_TOOL_WHEEL] = { 66 },
		}
		local collectibleCategories = collectibleCategoryIdByBarCat[barCategories[slotToEdit.bar]]
		for _, v in pairs(collectibleCategories) do
			table.insert(myTypes, {name = zo_strformat("<<C:1>>", (ZO_COLLECTIBLE_DATA_MANAGER:GetCategoryDataById(v):GetName())), value = v})
		end
		if #collectibleCategories == 1 then
			preSelectName = myTypes[1].name
			OnItemSelect(collectibleCategories[1])
		end
	end
	
	for _, v in pairs(myTypes) do
		categoryComboBox:AddItem(categoryComboBox:CreateItemEntry(v.name, function() OnItemSelect(v.value) end))
	end
	
	
	categoryComboBox:SetSelectedItem(preSelectName or "-")
end

local function updateTypeCombo()
	typeComboBox = typeComboBox or ZO_ComboBox_ObjectFromContainer(CSPSWindowCollectiblesTypes)
	
	typeComboBox:ClearItems()
	typeComboBox:SetSortsItems(false)
	
	local actionCatsForBarCats = {
		[HOTBAR_CATEGORY_QUICKSLOT_WHEEL] = { ACTION_TYPE_COLLECTIBLE, ACTION_TYPE_EMOTE, ACTION_TYPE_ITEM, ACTION_TYPE_QUICK_CHAT, },
		[HOTBAR_CATEGORY_ALLY_WHEEL] = { ACTION_TYPE_COLLECTIBLE, }, 
		[HOTBAR_CATEGORY_MEMENTO_WHEEL] = { ACTION_TYPE_COLLECTIBLE, },
		[HOTBAR_CATEGORY_TOOL_WHEEL] = { ACTION_TYPE_COLLECTIBLE, }, 
		[HOTBAR_CATEGORY_EMOTE_WHEEL] = { ACTION_TYPE_EMOTE, 	ACTION_TYPE_QUICK_CHAT,	},
	}
	
	local choosableCategoryNames = {
			[ACTION_TYPE_COLLECTIBLE] = GS(SI_ITEMFILTERTYPE12),
			[ACTION_TYPE_EMOTE] = GS(SI_HOTBARCATEGORY11),
			[ACTION_TYPE_ITEM] = GS(SI_INVENTORY_MODE_ITEMS),
			[ACTION_TYPE_QUICK_CHAT] = GS(SI_QUICK_CHAT_EMOTE_MENU_ENTRY_NAME),
	}
	
	local function OnItemSelect(actionCategory)
		CSPSWindowCollectiblesCategories:SetHidden(false)
		CSPSWindowCollectiblesList:SetHidden(true)
		updateCategoryCombo(actionCategory)
		PlaySound(SOUNDS.POSITIVE_CLICK)
	end
	
	local preSelectName = false
	local preSeletType = false
	local numberTypes = 0
	
	for _, actionCategory in pairs(actionCatsForBarCats[barCategories[slotToEdit.bar]]) do
		preSelectName = choosableCategoryNames[actionCategory]
		typeComboBox:AddItem(typeComboBox:CreateItemEntry(preSelectName, function() OnItemSelect(actionCategory) end))
		numberTypes = numberTypes + 1
		preSeletType = actionCategory

	end
	if numberTypes > 1 then 
		preSelectName = false 
	else
		CSPSWindowCollectiblesCategories:SetHidden(false)
		CSPSWindowCollectiblesList:SetHidden(true)
		updateCategoryCombo(preSeletType)
		
	end
	typeComboBox:SetSelectedItem(preSelectName or "-")
	updateCategoryCombo(HOTBAR_CATEGORY_ALLY_WHEEL)
end


local function setupCombos()
	-- tooltip 
	--CSPSWindowCollectiblesCategories.data = {tooltipText = GS(CSPS_Tooltiptext_ProfileCombo)}
	--CSPSWindowCollectiblesCategories:SetHandler("OnMouseEnter", ZO_Options_OnMouseEnter)
	--CSPSWindowCollectiblesCategories:SetHandler("OnMouseExit", ZO_Options_OnMouseExit)
	
	-- tooltip 
	--CSPSWindowCollectiblesTypes.data = {tooltipText = GS(CSPS_Tooltiptext_ProfileCombo)}
	--CSPSWindowCollectiblesTypes:SetHandler("OnMouseEnter", ZO_Options_OnMouseEnter)
	--CSPSWindowCollectiblesTypes:SetHandler("OnMouseExit", ZO_Options_OnMouseExit)
end

function CSPS.openCollectibleList()
	
	--Categories
	CSPSWindowCollectiblesCategories:SetHidden(true)
	CSPSWindowCollectiblesList:SetHidden(true)
	setupCombos()
	updateTypeCombo()
	
	--Types
	--List
	--Cancel
	--Ok
	CSPSWindowCollectibles:SetHidden(false)
end

function CSPS.setupQsSection(control, node, data)

	if node:IsOpen() and not data.fillContent then
		
	end
	
end

-- /script CSPS.setupQsTree()

function CSPS.setupQsTree()
	
	local myTree = CSPS.getTreeControl()
	myTree:AddTemplate("CSPSQSLE", NodeSetupQS, nil, nil, 24, 0)
	local fillContent = {}
	for barIndex, barTable in pairs(qsBars) do
		local fillContentBar = {}
		for qsIndex, itemLink in pairs(barTable) do
			table.insert(fillContentBar, {"CSPSQSLE", {barIndex = barIndex, barTable = barTable, qsIndex = qsIndex}})
		end
		table.insert(fillContent, {"CSPSLH", {name = GS("SI_HOTBARCATEGORY", barCategories[barIndex]), variant=8, fillContent=fillContentBar}})
	end
	local overNode = myTree:AddNode("CSPSLH", {name = GS(SI_HOTBARCATEGORY10), variant=8, fillContent=fillContent}) 

	
	myTree:RefreshVisible() -- delete after including this function!
end