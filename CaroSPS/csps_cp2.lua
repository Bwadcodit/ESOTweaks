local GS = GetString
local cpSlT = {
		"esoui/art/champion/actionbar/champion_bar_world_selection.dds",
		"esoui/art/champion/actionbar/champion_bar_combat_selection.dds",
		"esoui/art/champion/actionbar/champion_bar_conditioning_selection.dds",
}
--local cpColHex = {"A6D852", "5CBDE7", "DE6531" }
local cpColors = CSPS.cpColors

CSPS.cpProfDis = 1
CSPS.cpProfType = 1

CSPS.cpColTex = {
		"esoui/art/champion/champion_points_stamina_icon-hud-32.dds",
		"esoui/art/champion/champion_points_magicka_icon-hud-32.dds",
		"esoui/art/champion/champion_points_health_icon-hud-32.dds",
		"esoui/art/mainmenu/menubar_collections_up.dds",
		"esoui/art/mainmenu/menubar_skills_up.dds",	
}

CSPS.changedCP = false

local resizingNow = false

CSPS.customCpIcons = {
	[76] = "esoui/art/icons/ability_thievesguild_passive_004.dds",			-- Friends in Low Places
	[77] = "esoui/art/icons/ability_legerdemain_sly.dds",					-- Infamous
	[80] = "esoui/art/icons/ability_darkbrotherhood_passive_001.dds", 		-- Shadowstrike
	[90] = "esoui/art/icons/ability_legerdemain_lightfingers.dds", 			-- Cutpurse's Art
	[84] = "esoui/art/icons/ability_thievesguild_passive_002.dds",				-- Fade Away 
	[78] = "esoui/art/notifications/gamepad/gp_notification_craftbag.dds", 	-- Master Gatherer 
	[79] = "esoui/art/icons/ability_thievesguild_passive_001.dds", 			-- Treasure Hunter
	[85] = "esoui/art/icons/ability_provisioner_002.dds", 					-- Rationer
	[86] = "esoui/art/icons/ability_alchemy_006.dds", 						-- Liquid Efficiency
	[89] = "esoui/art/icons/crafting_fishing_salmon.dds", 					-- Angler's Instincts
	[88] = "esoui/art/icons/achievements_indexicon_fishing_down.dds", 		-- Reel Technique
	[91] = "esoui/art/crafting/provisioner_indexicon_furnishings_down.dds", -- Homemaker
	[81] = "esoui/art/icons/crafting_flower_corn_flower_r1.dds", 			-- Plentiful Harvest 
	[82] = "esoui/art/mounts/ridingskill_stamina.dds", 						-- War Mount 
	[92] = "esoui/art/mounts/tabicon_mounts_down.dds", 						-- Gifted Rider 
	[83] = "esoui/art/tutorial/inventory_trait_intricate_icon.dds", 		-- Meticulous Disassembly
	[66] = "esoui/art/icons/ability_darkbrotherhood_passive_004.dds", 		-- Steed's Blessing 
	[65] = "esoui/art/icons/ability_armor_007.dds", 						-- Sustaining Shadows 
	[1] = "esoui/art/repair/inventory_tabicon_repair_up.dds", 				-- Professional Upkeep 

	[259] = "esoui/art/icons/ability_templar_005.dds",						-- Weapons Expoert
	[264] = "esoui/art/icons/ability_sorcerer_024.dds",						-- Master at arms
	[260] = "esoui/art/icons/ability_templar_017.dds",						-- Salve of Renewal
	[261] = "esoui/art/icons/ability_templar_021.dds",						-- Hope Infusion
	[262] = "esoui/art/icons/ability_templar_032.dds",						-- From the brink
	[263] = "esoui/art/icons/ability_templar_028.dds",						-- Enlivening Overflow
	[12] = "esoui/art/icons/ability_sorcerer_045.dds", 						-- Fighting Finesse 
	[24] = "esoui/art/icons/ability_templar_016.dds", 						-- Soothing tide
	[9] = "esoui/art/icons/ability_templar_011.dds", 						-- Rejuvenator
	[163] = "esoui/art/icons/ability_alchemy_004.dds",	 					-- Foresight
	[29] = "esoui/art/icons/ability_templar_006.dds", 						-- Cleansing Revival 
	[26] = "esoui/art/icons/ability_templar_004.dds", 						-- Focused Mending
	[28] = "esoui/art/icons/ability_templar_008.dds", 						-- Swift Renewal
	[25] = "esoui/art/icons/ability_vampire_007.dds", 						-- Deadly Aim
	[23] = "esoui/art/icons/ability_sorcerer_006.dds",	 					-- Biting Aura 
	[27] = "esoui/art/icons/ability_sorcerer_004.dds", 						-- Thaumaturge
	[30] = "esoui/art/icons/ability_templar_002.dds",						-- Reaving Blows 
	[8] = "esoui/art/icons/ability_weapon_019.dds", 						-- Wrathful Strikes
	[32] = "esoui/art/icons/ability_sorcerer_010.dds",	 					-- Occult Overload 
	[31] = "esoui/art/icons/ability_weapon_023.dds", 						-- Backstabber
	[13] = "esoui/art/icons/ability_weapon_028.dds", 						-- Resilience
	[136] = "esoui/art/icons/ability_weapon_024.dds", 						-- Enduring Resolve 
	[160] = "esoui/art/icons/ability_psijic_010.dds",						-- Reinforced
	[162] = "esoui/art/icons/ability_armor_013.dds", 						-- Riposte
	[159] = "esoui/art/icons/ability_dragonknight_020.dds", 				-- Bulwark
	[161] = "esoui/art/icons/ability_werewolf_008.dds", 					-- Last Stand
	[33] = "esoui/art/icons/ability_dragonknight_031.dds", 					-- Cutting Defense
	[134] = "esoui/art/icons/ability_armor_014.dds", 						-- Duelist's Rebuff 
	[133] = "esoui/art/icons/ability_dragonknight_029.dds", 				-- Unassailable
	[5] = "esoui/art/icons/ability_scrying_05a.dds", 						-- Endless Endurance
	[4] = "esoui/art/icons/ability_scrying_05d.dds",	 					-- Untamed Aggression
	[3] = "esoui/art/icons/ability_scrying_05b.dds", 						-- Arcane Supremacy
	[265] = "esoui/art/icons/ability_templar_022.dds",						--Ironclad

	[62] = "esoui/art/icons/ability_armor_009.dds", 						-- Rousing Speed
	[57] = "esoui/art/icons/ability_thievesguild_passive_005.dds",			-- Survival Instincts 
	[46] = "esoui/art/icons/ability_armor_005.dds", 						-- Bastion
	[61] = "esoui/art/icons/ability_armor_008.dds", 						-- Arcane Alacrity
	[56] = "esoui/art/icons/ability_templar_026.dds", 						-- Spirit Mastery
	[49] = "esoui/art/icons/ability_templar_029.dds", 						-- Strategic Reserve
	[63] = "esoui/art/icons/ability_templar_027.dds", 						-- Shield Master 
	[48] = "esoui/art/icons/ability_weapon_021.dds", 						-- Bloody Renewal 
	[47] = "esoui/art/icons/ability_weapon_006.dds", 						-- Siphoning Spells
	[60] = "esoui/art/icons/ability_armor_012.dds", 						-- On Guard 
	[51] = "esoui/art/icons/ability_armor_010.dds", 						-- Expert Evasion 
	[52] = "esoui/art/icons/ability_armor_006.dds", 						--  Slippery
	[64] = "esoui/art/icons/ability_darkbrotherhood_passive_002.dds",		-- Unchained
	[59] = "esoui/art/icons/ability_dragonknight_021.dds", 					-- Juggernaut
	[54] = "esoui/art/icons/ability_armor_015.dds", 						-- Peace of Mind 
	[55] = "esoui/art/icons/ability_darkbrotherhood_passive_003.dds", 		-- Hardened
	[35] = "esoui/art/icons/ability_dragonknight_024.dds", 					-- Rejuvenation
	[34] = "esoui/art/icons/ability_dragonknight_034.dds", 					-- Ironclad
	[2] = "esoui/art/icons/ability_scrying_05c.dds", 						-- Boundless Vitality
	[266] = "esoui/art/icons/ability_weapon_030.dds",	 					-- Ward Master
	[267] = "esoui/art/icons/ability_weapon_001.dds",						-- Bracing Anchor
	[268] = "esoui/art/icons/ability_vampire_006.dds",						-- Soothing Shield
	[270] = "esoui/art/icons/ability_weapon_017.dds",						-- Celerity
	[271] = "esoui/art/icons/ability_templar_009.dds",						-- Refreshing Stride
	[272] = "esoui/art/icons/ability_weapon_018.dds",						-- Thrill of the Hunt
	[273] = "esoui/art/icons/ability_sorcerer_023.dds",						-- Sustained by Suffering
	[274] = "esoui/art/icons/ability_templar_019.dds",						-- Relentlessness
	[275] = "esoui/art/icons/ability_weapon_009.dds",						-- Pain's Refuge
}

local newProfileBringToTop = nil
local waitingForCpPurchase = false
local cancelAnimation = false
local numMapSuccessful = 0
local unmappedSkills = {}
local mappingIndex = 1
local cpSkillToMap = nil
local cpDisciToMap = nil
local numRemapped = 0
local mappingUnclear = {}
local numMapUnclear = 0
local numMapCleared = 0
local skillsToImport = {}
local skillsToSlot = {}
local markedToSlot = {}
local slotMarkers = false



local function getLayer(layerLists)
	local newList = {}
	local newLayerX = {}
	for _, aList in pairs(layerLists) do
		for _, v in pairs(aList) do
			if not CSPS.auxListDone[v] == true then
				table.insert(newList, v)
				local newSubList = {GetChampionSkillLinkIds(v)}
				table.insert(newLayerX, newSubList)
				CSPS.auxListDone[v] = true
			end
		end
	end
	return newList, newLayerX
end

function CSPS.cp2fillTable()
	CSPS.cp2Table = CSPS.cp2Table or {}
	CSPS.auxListDone = {}
	CSPS.cp2ClustRoots = {}
	for disciplineIndex = 1, 3 do
		for i, v in ipairs(CSPS.cp2List[disciplineIndex]) do
			CSPS.auxListDone[v] = true
			local skType = GetChampionSkillType(v) + 1
			CSPS.cp2List[disciplineIndex][i] = {v, skType}
			if CSPS.cp2ListCluster[v] ~= nil then
				CSPS.cp2List[disciplineIndex][i][2] = 4
				for j, w in pairs(CSPS.cp2ListCluster[v]) do
					local skType = GetChampionSkillType(w) + 1
					CSPS.auxListDone[w] = true
					CSPS.cp2ClustRoots[w] = v
					CSPS.cp2ListCluster[v][j] = {w, skType}
				end
			end
		end
		CSPS.cp2RootLists[disciplineIndex] = {}
		for skInd=1, GetNumChampionDisciplineSkills(disciplineIndex) do	
			local skId = GetChampionSkillId(disciplineIndex, skInd)
			local skType = GetChampionSkillType(skId) + 1
			CSPS.cp2Disci[skId] = disciplineIndex
			if not CSPS.auxListDone[skId] then table.insert(CSPS.cp2List[disciplineIndex], {skId, skType}) end
			if IsChampionSkillRootNode(skId) then table.insert(CSPS.cp2RootLists[disciplineIndex], skId) end
		end
	end
end

function CSPS.cp2CreateTable()
	CSPS.cp2Table = CSPS.cp2Table or {}
	CSPS.cp2List = {[1] = {}, [2] = {}, [3] = {}}
	CSPS.cp2ListCluster = {}
	CSPS.cp2Disci = {}
	CSPS.cp2ClustRoots = {}
	CSPS.cp2ClustNames = {}
	CSPS.cp2ClustActive = {}
	for disciplineIndex = 1, 3 do
		local myList = CSPS.cp2List[disciplineIndex]
		local discplineId = GetChampionDisciplineId(disciplineIndex)
		
		local auxListDiscipline = {}
		local auxListBasestats = {}
		local auxListRoot = {}
		local auxListCluster = {}
		CSPS.auxListDone = {}
		
		for skInd=1, GetNumChampionDisciplineSkills(disciplineIndex) do	
			local skId = GetChampionSkillId(disciplineIndex, skInd)
			local skType = GetChampionSkillType(skId) + 1	-- normal, slottable, statpool (also slottable) - in my version also 4: cluster root
			local isUnlocked = false
			if IsChampionSkillRootNode(skId) or skType == 3 then isUnlocked = true end -- root nodes and basestats are always unlocked
			CSPS.cp2Table[skId] = CSPS.cp2Table[skId] or {isUnlocked, 0} -- profile values saved by ID (unlocked as boolean, points invested as number)
			CSPS.cp2Disci[skId] = disciplineIndex
			if IsChampionSkillClusterRoot(skId) then				
				CSPS.cp2ListCluster[skId] = {{skId, skType}}
				CSPS.cp2ClustRoots[skId] = skId
				CSPS.cp2ClustNames[skId] = zo_strformat("<<C:1>>", GetChampionClusterName(skId))
				CSPS.cp2ClustActive[skId] = false
				for i, v in pairs({GetChampionClusterSkillIds(skId)}) do
					table.insert(CSPS.cp2ListCluster[skId], {v, GetChampionSkillType(v) + 1})
					CSPS.cp2ClustRoots[v] = skId
					if v ~= skId then CSPS.auxListDone[v] = true end
				end
			end
			if IsChampionSkillRootNode(skId) and skType ~= 3 then 				
				table.insert(auxListRoot, skId)
				--CSPS.auxListDone[skId] = true
			end
			if skType == 3 then				
				table.insert(auxListBasestats, skId)
				CSPS.auxListDone[skId] = true
			end
		end	
		local auxListLayer = {}
		auxListLayer[1] = {}
		local auxListLayer1, newLayer = getLayer({auxListRoot})
		auxListLayer[1] = auxListLayer1
		local layInd = 1
		while #newLayer > 0 do
			layInd = layInd + 1
			auxListLayer[layInd], newLayer = getLayer(newLayer, CSPS.auxListDone)
		end
		for i, v in pairs(auxListBasestats) do
			table.insert(myList, {v, 3})
		end
		for _, aList in pairs(auxListLayer) do
			for i, v in pairs(aList) do
				local skType =  GetChampionSkillType(v) + 1
				if IsChampionSkillClusterRoot(v) then skType = 4 end
				table.insert(myList, {v, skType})
			end
		end
		CSPS.cp2RootLists[disciplineIndex] = auxListRoot
		CSPS.cp2List[disciplineIndex] = myList
	end

end

local function unlockLinked(myList, auxPunkte)
	for i, v in pairs(myList) do
		if CSPS.cp2ClustRoots[v] then CSPS.cp2ClustActive[CSPS.cp2ClustRoots[v]] = true end
		if CSPS.cp2Table[v][1] == false then
			CSPS.cp2Table[v][1] = true
			CSPS.cp2Table[v][2] = auxPunkte[v]
			if WouldChampionSkillNodeBeUnlocked(v, CSPS.cp2Table[v][2]) then
				unlockLinked({GetChampionSkillLinkIds(v)}, auxPunkte)
			end
		end
	end
end

function CSPS.cp2ReCheckHotbar(disciplineIndex)
	for i=1, 4 do
		local mySk = CSPS.cp2HbTable[disciplineIndex][i]
		if mySk ~= nil then
			if not WouldChampionSkillNodeBeUnlocked(mySk, CSPS.cp2Table[mySk][2]) then
				CSPS.cp2HbTable[disciplineIndex][i] = nil
			end
		end
	end
	CSPS.cp2HbIcons(disciplineIndex)
end

function CSPS.cp2UpdateHbMarks()
	CSPS.cp2InHb = {}
	for i=1, 3 do
		if CSPS.cp2HbTable[i] then -- TWEAK HERE: add this line
			for j=1,4 do
				if CSPS.cp2HbTable[i][j] ~= nil then CSPS.cp2InHb[CSPS.cp2HbTable[i][j]] = true end
			end
		end
	end
end
	
function CSPS.clickCPIcon(myId, mouseButton)
	if mouseButton == 2 then
		if CSPS.cp2InHb[myId] then
			local myDiscipline = CSPS.cp2Disci[myId]
			local mySlot = 0
			for i=1, 4 do
				if CSPS.cp2HbTable[myDiscipline][i] == myId then mySlot = i end
			end
			if mySlot > 0 then CSPS.CpHbSkillRemove(myDiscipline, mySlot) end
		end
	end
end


function CSPS.HbRearrange()
	local mySize = CSPS.savedVariables.settings.hbsize or 28
	local mySpace = mySize * 0.12
	if CSPS.cpCustomBar == 1 then							-- 1x12
		CSPSCpHotbar:SetWidth(12 * mySize + 17 * mySpace) 
		CSPSCpHotbar:SetHeight(mySize + 2 * mySpace)
		CSPSCpHotbar:SetDimensionConstraints(346, 30, 1384, 120) -- minX minY maxX maxY	
	elseif CSPS.cpCustomBar == 2 then						-- 3x4
		CSPSCpHotbar:SetWidth(4 * mySize + 5 * mySpace)
		CSPSCpHotbar:SetHeight(3 * mySize + 4 * mySpace)
		CSPSCpHotbar:SetDimensionConstraints(120, 90, 480, 360) 
	else												-- 1x4
		CSPSCpHotbar:SetWidth(4 * mySize + 5 * mySpace)
		CSPSCpHotbar:SetHeight(mySize + 2 * mySpace)
		CSPSCpHotbar:SetDimensionConstraints(120, 30, 480, 120)
	end
	CSPS.myCPBar = CSPS.myCPBar or {}
	for i=1,3 do
		CSPS.myCPBar[i] = CSPS.myCPBar[i] or {}
		for j=1,4 do
			if (CSPS.cpCustomBar ~= 3 or i == 1) then
				CSPS.myCPBar[i][j] = CSPS.myCPBar[i][j] or nil
				if CSPS.myCPBar[i][j] == nil then
					CSPS.myCPBar[i][j] = WINDOW_MANAGER:CreateControlFromVirtual("CSPSCpHotbarSlot"..i.."_"..j, CSPSCpHotbar, "CSPSHbPres" )
					CSPS.myCPBar[i][j]:GetNamedChild("Circle"):SetTexture(cpSlT[i])
					if i == 1 then CSPS.myCPBar[i][j]:GetNamedChild("Circle"):SetColor(0.8235, 0.8235, 0) end	-- re-color the not-so-green circle for the green cp...
				else
					CSPS.myCPBar[i][j]:ClearAnchors()
				end
				CSPS.myCPBar[i][j]:SetHidden(false)
				if CSPS.cpCustomBar == 1 then
					CSPS.myCPBar[i][j]:SetAnchor(TOPLEFT, CSPS.myCPBar[i][j]:GetParent(), TOPLEFT, mySpace + ((i - 1) * 4  + j - 1) * (mySize + mySpace) + 2 * mySpace * (i - 1), mySpace)
				else
					CSPS.myCPBar[i][j]:SetAnchor(TOPLEFT, CSPS.myCPBar[i][j]:GetParent(), TOPLEFT, mySpace + (j - 1) * (mySize + mySpace), (i-1) * mySize + i * mySpace)
				end
				CSPS.myCPBar[i][j]:SetDimensions(mySize, mySize)
				CSPS.myCPBar[i][j]:GetNamedChild("Circle"):SetDimensions(mySize, mySize)
				CSPS.myCPBar[i][j]:GetNamedChild("Icon"):SetDimensions(mySize * 0.73, mySize * 0.73)
			else
				if CSPS.myCPBar[i][j] ~= nil then CSPS.myCPBar[i][j]:SetHidden(true) end
			end
		end
	end
	if CSPS.cpCustomBar then CSPS.showCpBar() end
end

function CSPS.HbSize(forceResize)
	if not resizingNow and not forceResize then return end
	local barWindow = WINDOW_MANAGER:GetControlByName("CSPSCpHotbar")
	if not CSPS or not CSPS.savedVariables then return end
	
	-- Fitting the icons to the new width
	local mySize  = barWindow:GetWidth() * 0.075
	local mySpace = (barWindow:GetWidth() - 12 * mySize) / 17
	if CSPS.cpCustomBar ~= 1 then
		mySize = barWindow:GetWidth() * 0.23
		mySpace = (barWindow:GetWidth() - 4 * mySize) / 5
	end
	CSPS.savedVariables.settings.hbsize = mySize
	
	-- Adjusting the height of the hotbar
	if CSPS.cpCustomBar == 1 then	-- 1x12
		barWindow:SetHeight(mySize + 2 * mySpace)
	elseif CSPS.cpCustomBar == 2 then	-- 3x4
		barWindow:SetHeight(3*mySize + 4*mySpace)
	else	-- 1x4
		barWindow:SetHeight(mySize + 2 * mySpace)
	end
	
	-- Adjusting the anchors of the icons
	CSPS.myCPBar = CSPS.myCPBar or {}
	for i=1,3 do
		CSPS.myCPBar[i] = CSPS.myCPBar[i] or {}
		for j=1,4 do
			if (CSPS.cpCustomBar ~= 3 or i == 1) then
				if CSPS.cpCustomBar == 1 then 
					CSPS.myCPBar[i][j]:SetAnchor(TOPLEFT, CSPS.myCPBar[i][j]:GetParent(), TOPLEFT, mySpace + ((i - 1) * 4  + j - 1) * (mySize + mySpace) + 2 * mySpace * (i - 1), mySpace)
				else
					CSPS.myCPBar[i][j]:SetAnchor(TOPLEFT, CSPS.myCPBar[i][j]:GetParent(), TOPLEFT, mySpace + (j - 1) * (mySize + mySpace), (i-1) * mySize + i * mySpace)
				end
				CSPS.myCPBar[i][j]:SetDimensions(mySize, mySize)
				CSPS.myCPBar[i][j]:GetNamedChild("Circle"):SetDimensions(mySize, mySize)
				CSPS.myCPBar[i][j]:GetNamedChild("Icon"):SetDimensions(mySize * 0.73, mySize * 0.73)
			end
		end
	end
end

function CSPS.HbResizing(control, isResizingNow)
	resizingNow = isResizingNow 
	control:GetNamedChild("BG"):SetHidden(not isResizingNow)
end


function CSPS.OnHotbarMoveStop() 
	CSPS.savedVariables.settings.hbleft = CSPSCpHotbar:GetLeft()
	CSPS.savedVariables.settings.hbtop = CSPSCpHotbar:GetTop()
end

function CSPS.showCpBar()
	for i=1,3 do
		for j=1,4 do
			local mySlot = (i-1) * 4 + j
			local mySk = GetSlotBoundId(mySlot, HOTBAR_CATEGORY_CHAMPION)
			if (CSPS.cpCustomBar ~= 3 or i == 1) then
				if mySk ~= nil and mySk ~= 0 then
					if CSPS.useCustomIcons and CSPS.customCpIcons[mySk] ~= nil then 
						if CSPS.cpCustomBar then CSPS.myCPBar[i][j]:GetNamedChild("Icon"):SetTexture(CSPS.customCpIcons[mySk]) end
						local myZoIcon = WINDOW_MANAGER:GetControlByName(string.format("ZO_ChampionPerksActionBarSlot%sIcon", mySlot))
						if myZoIcon ~= nil then myZoIcon:SetTexture(CSPS.customCpIcons[mySk]) end
					else
						if CSPS.cpCustomBar then CSPS.myCPBar[i][j]:GetNamedChild("Icon"):SetTexture("esoui/art/champion/champion_icon_32.dds") end
					end
					if CSPS.cpCustomBar then 
						CSPS.myCPBar[i][j]:GetNamedChild("Icon"):SetHidden(false)
						CSPS.myCPBar[i][j]:GetNamedChild("Circle"):SetHandler("OnMouseEnter", function() CSPS.showCpTT(CSPS.myCPBar[i][j], mySk, GetNumPointsSpentOnChampionSkill(mySk), true, false) end)
					end
				else
					if CSPS.cpCustomBar then 
						CSPS.myCPBar[i][j]:GetNamedChild("Icon"):SetHidden(true)
						CSPS.myCPBar[i][j]:GetNamedChild("Circle"):SetHandler("OnMouseEnter", function() end)
					end
				end
			else
				local myZoIcon = WINDOW_MANAGER:GetControlByName(string.format("ZO_ChampionPerksActionBarSlot%sIcon", mySlot))
				if myZoIcon ~= nil and mySk ~= nil and mySk > 0 then myZoIcon:SetTexture(CSPS.customCpIcons[mySk]) end
			end
		end
	end
end

function CSPS.showCpTT(control, myId, myValue, withTitle, hotbarExplain)
	InitializeTooltip(InformationTooltip, control, LEFT)
	local myTooltip = myId and GetChampionSkillDescription(myId)
	local myCurrentBonus = myValue and GetChampionSkillCurrentBonusText(myId, myValue) or ""
	if withTitle or true then
		InformationTooltip:AddLine(zo_strformat("<<C:1>>", GetChampionSkillName(myId)), "ZoFontWinH2")
		if  CSPS.useCustomIcons and CSPS.customCpIcons[myId] ~= nil then InformationTooltip:AddLine(string.format("\n|t48:48:%s|t\n", CSPS.customCpIcons[myId]), "ZoFontGame") end
		ZO_Tooltip_AddDivider(InformationTooltip)
	end
	if myId then InformationTooltip:AddLine(myTooltip, "ZoFontGame") end
	if myCurrentBonus ~= "" then InformationTooltip:AddLine(myCurrentBonus, "ZoFontGameBold", ZO_SUCCEEDED_TEXT:UnpackRGBA() ) end
	if hotbarExplain then 
		InformationTooltip:AddLine(GS(CSPS_Tooltip_CPBar), "ZoFontGame")
	else
		local myActualValue = GetNumPointsSpentOnChampionSkill(myId)
		if myValue and myValue ~= myActualValue then
			ZO_Tooltip_AddDivider(InformationTooltip)
			InformationTooltip:AddLine(zo_strformat(GS(CSPS_CPPCurrentlyApplied), myActualValue), "ZoFontGame")
			if myActualValue ~= 0 then 
				local myActualBonus = GetChampionSkillCurrentBonusText(myId, myActualValue) or ""
				if myActualBonus ~= "" then InformationTooltip:AddLine(myActualBonus, "ZoFontGame", CSPS.colors.orange:UnpackRGB()) end
			end
		end
	end
end
 
function CSPS.cp2HbIcons(disciplineIndex)
	local myBar = CSPS.cp2HbTable[disciplineIndex]
	local changeOrderRev = {3, 1, 2}
	for i=1, 4 do
		local myCtrl = CSPSWindowCP2Bar:GetNamedChild("Icon"..changeOrderRev[disciplineIndex].."_"..i.."b")
		local myCtrla = CSPSWindowCP2Bar:GetNamedChild("Icon"..changeOrderRev[disciplineIndex].."_"..i)
		local myCtrlLabel = CSPSWindowCP2Bar:GetNamedChild("Label"..changeOrderRev[disciplineIndex].."_"..i)
		if myBar[i] ~= nil then
			myCtrl:SetHidden(false)
			if CSPS.useCustomIcons and CSPS.customCpIcons[myBar[i]] then 
				myCtrl:SetTexture(CSPS.customCpIcons[myBar[i]])
			else
				myCtrl:SetTexture("esoui/art/champion/champion_icon_32.dds")
			end
			
			local myName = cpColors[disciplineIndex]:Colorize(zo_strformat("<<C:1>>", GetChampionSkillName(myBar[i])))
			myCtrlLabel:SetText(myName)

			myCtrla:SetHandler("OnMouseEnter", function()  CSPS.showCpTT(myCtrla, myBar[i], CSPS.cp2Table[myBar[i]][2], true, true) end) 
			myCtrla:SetHandler("OnMouseExit", function () ZO_Tooltips_HideTextTooltip() end)
		else
			myCtrlLabel:SetText("")
			myCtrl:SetHidden(true)
			myCtrla:SetHandler("OnMouseEnter", function() ZO_Tooltips_ShowTextTooltip(myCtrla, RIGHT, GS(CSPS_Tooltip_CPBar)) end)
			myCtrla:SetHandler("OnMouseExit", function () ZO_Tooltips_HideTextTooltip() end)
		end
	end
end

function CSPS.onCpDrag(skId, disciplineIndex)
	CSPS.cpForHB = {skId, disciplineIndex}
end

function CSPS.onCpHbIconDrag(disciplineIndex, icon)
	if CSPS.cp2HbTable[disciplineIndex][icon] ~= nil then
		CSPS.cpForHB = {CSPS.cp2HbTable[disciplineIndex][icon], disciplineIndex}
	end
end

function CSPS.onCpHbIconReceive(disciplineIndex, icon)
	if CSPS.cpForHB == nil then return end 
	if CSPS.cpForHB[2] ~= disciplineIndex then return end 
	if not WouldChampionSkillNodeBeUnlocked(CSPS.cpForHB[1], CSPS.cp2Table[CSPS.cpForHB[1]][2]) then return end
	for i=1, 4 do
		if CSPS.cp2HbTable[disciplineIndex][i] == CSPS.cpForHB[1] then CSPS.cp2HbTable[disciplineIndex][i] = nil end
	end
	CSPS.cp2HbTable[disciplineIndex][icon] = CSPS.cpForHB[1]
	CSPS.cpForHB = nil
	CSPS.cp2HbIcons(disciplineIndex)
	CSPS.cp2UpdateHbMarks()
	 CSPS.refreshTree()
	CSPS.unsavedChanges = true
	changedCP = true
	CSPS.showElement("apply", true)
	CSPS.showElement("save", true)
end

function CSPS.CpHbSkillRemove(disciplineIndex, icon)
	if CSPS.cp2HbTable[disciplineIndex][icon] ~= nil then
		CSPS.cp2HbTable[disciplineIndex][icon] = nil	
		CSPS.cp2HbIcons(disciplineIndex)		
		CSPS.cp2UpdateHbMarks()
		CSPS.unsavedChanges = true
		CSPS.showElement("apply", true)
		CSPS.showElement("save", true)
		changedCP = true
		 CSPS.refreshTree()
	end
end


function CSPS.cp2UpdateSum(disciplineIndex)
	local auxSum = 0
	for i=1, GetNumChampionDisciplineSkills(disciplineIndex) do
		auxSum = auxSum + CSPS.cp2Table[GetChampionSkillId(disciplineIndex, i)][2]
	end
	CSPS.cp2ColorSum[disciplineIndex] = auxSum
end

function CSPS.cp2UpdateSumClusters()
	for myId, myList in pairs(CSPS.cp2ListCluster) do
		local auxSum = 0
		for i,v in pairs(myList) do
			auxSum = auxSum + CSPS.cp2Table[v[1]][2]
		end
		CSPS.cp2ClusterSum[myId] = auxSum
	end
end

function CSPS.cp2UpdateUnlock(disciplineIndex)
	local auxPunkte = {}
	for i, v in pairs(CSPS.cp2ClustActive) do
		if CSPS.cp2Disci[i] == disciplineIndex and not IsChampionSkillRootNode(i) then CSPS.cp2ClustActive[i] = false end
	end
	for i, v in pairs(CSPS.cp2Table) do
		if CSPS.cp2Disci[i] == disciplineIndex and not IsChampionSkillRootNode(i) then 
			v[1] = false 
			auxPunkte[i] = v[2]
			v[2] = 0
		end
	end
	for i, v in pairs(CSPS.cp2RootLists[disciplineIndex]) do
		if WouldChampionSkillNodeBeUnlocked(v, CSPS.cp2Table[v][2]) then
			unlockLinked({GetChampionSkillLinkIds(v)}, auxPunkte)
		end
	end
end

function CSPS.cp2BtnPlusMinus(skId, x, shift)
	local oldValue = CSPS.cp2Table[skId][2]
	if shift == true then x = x * 10 end
	local myValue = oldValue + x
	if shift == true and DoesChampionSkillHaveJumpPoints(skId) then
		myValue = 0
		for _, v in pairs({GetChampionSkillJumpPoints(skId)}) do
			if x > 0 then 
				if v > oldValue and myValue == 0 then myValue = v end
			else 
				if v < oldValue then myValue = v end
			end
		end
		
	end	
	if myValue < 0 then myValue = 0 end
	if myValue > GetChampionSkillMaxPoints(skId) then myValue = GetChampionSkillMaxPoints(skId) end
	
	CSPS.cp2Table[skId][2] = myValue
	if WouldChampionSkillNodeBeUnlocked(skId, oldValue) ~= WouldChampionSkillNodeBeUnlocked(skId, myValue) then 
		CSPS.cp2UpdateUnlock(CSPS.cp2Disci[skId]) 
	end
	
	CSPS.cp2UpdateSum(CSPS.cp2Disci[skId])
	CSPS.cp2UpdateSumClusters()
	CSPS.cp2ReCheckHotbar(CSPS.cp2Disci[skId])
	CSPS.cp2UpdateHbMarks()
	CSPS.unsavedChanges = true
	changedCP = true
	CSPS.showElement("apply", true)
	CSPS.showElement("save", true)
	 CSPS.refreshTree()
end

function CSPS.cp2ResetTable(disciFilter)
	if type(disciFilter) ~= "table" then
		local disciFilterNum = disciFilter or false
		disciFilter = disciFilterNum and {true, true, true} or {}
		if disciFilterNum then disciFilter[disciFilterNum] = false end
	end
	-- Sets all entries to zero points and locked if not root
	for i, v in pairs(CSPS.cp2ClustActive) do
		if not disciFilter[CSPS.cp2Disci[i]] then
			CSPS.cp2ClustActive[i] = false
		end
	end
	for skId, v in pairs(CSPS.cp2Table) do
		if not disciFilter[CSPS.cp2Disci[skId]] then
			local skType = GetChampionSkillType(skId) + 1
			local isUnlocked = false
			if IsChampionSkillRootNode(skId) or skType == 3 then 
				isUnlocked = true 
				if CSPS.cp2ClustRoots[skId] then CSPS.cp2ClustActive[CSPS.cp2ClustRoots[skId]] = true end
			end		
			CSPS.cp2Table[skId] = {isUnlocked, 0}
		end
	end
end

function CSPS.cp2ReadCurrent()
	CSPS.cp2ResetTable()
	for skId, v in pairs(CSPS.cp2Table) do
		local myPoints = GetNumPointsSpentOnChampionSkill(skId)
		v[2] = myPoints
		if WouldChampionSkillNodeBeUnlocked(skId, myPoints) then
			if CSPS.cp2ClustRoots[skId] then CSPS.cp2ClustActive[CSPS.cp2ClustRoots[skId]] = true end
			v[1] = true
			for i, v in pairs({GetChampionSkillLinkIds(skId)}) do
				CSPS.cp2Table[v][1] = true
			end
		end
	end
	for i=1, 3 do
		for j=1, 4 do
			local mySk = GetSlotBoundId((i-1) * 4 + j, HOTBAR_CATEGORY_CHAMPION)
			if mySk ~= 0 then 
				CSPS.cp2HbTable[i][j] = mySk
			else
				CSPS.cp2HbTable[i][j] = nil
			end
		end
	end
	for i=1, 3 do
		CSPS.cp2UpdateSum(i)
	end
	CSPS.cp2UpdateSumClusters()
	for i=1,3 do
		CSPS.cp2UpdateUnlock(i) 
		CSPS.cp2HbIcons(i)
	end
	CSPS.cp2UpdateHbMarks()
	changedCP = false
end

function CSPS.cp2SingleBarCompress(myBar)
	local cp2BarComp = {}
	for j=1,4 do
		cp2BarComp[j] = myBar[j] or "-"
	end
	cp2BarComp = table.concat(cp2BarComp, ",")
	return cp2BarComp
end

function CSPS.cp2HbCompress(myTable)
	local cp2HbComp = {}
	for i=1, 3 do
		cp2HbComp[i] = CSPS.cp2SingleBarCompress(myTable[i])
	end
	cp2HbComp = table.concat(cp2HbComp, ";")
	return cp2HbComp
end

function CSPS.cp2SingleBarExtract(cp2BarComp)

	local barTable = {}
	local auxHb1 = {SplitString(",", cp2BarComp)}
	for j, v in pairs(auxHb1) do
		if v ~= "-" then barTable[j] = tonumber(v) else barTable[j] = nil end		
	end	
	
	return barTable
end

function CSPS.cp2HbExtract(cp2HbComp, disciFilter)
	local cp2HbTable = {{},{},{}}
	cp2HbComp = cp2HbComp or ""
	if cp2HbComp ~= "" then
		local auxHb = {SplitString(";", cp2HbComp)}
		cp2HbTable = {}
		for i=1, 3 do
			if not disciFilter or not disciFilter[i] then
				cp2HbTable[i] = CSPS.cp2SingleBarExtract(auxHb[i])
			end
		end
	end
	return cp2HbTable
end

function CSPS.cp2Compress(myTable)
	local cp2Comp = {}
	for skId, v in pairs(myTable) do
		if v[2] > 0 then table.insert(cp2Comp, string.format("%s-%s", skId, v[2])) end
	end
	cp2Comp = table.concat(cp2Comp, ";")
	return cp2Comp
end

function CSPS.cp2Extract(cp2Comp, disciFilter)
	CSPS.cp2ResetTable(disciFilter)
	disciFilter = type(disciFilter) == "table" and disciFilter or {}
	if cp2Comp ~= "" then
		local myTable = {SplitString(";", cp2Comp)}
		for i, v in pairs(myTable) do
			local skId, myValue = SplitString("-", v)
			skId = tonumber(skId)
			myValue = tonumber(myValue)
			if not disciFilter[CSPS.cp2Disci[skId]] then
				if myValue > GetChampionSkillMaxPoints(skId) then myValue = GetChampionSkillMaxPoints(skId) end
				CSPS.cp2Table[skId][2] = myValue
			end
		end
		CSPS.cp2UpdateUnlock(1)
		CSPS.cp2UpdateUnlock(2)
		CSPS.cp2UpdateUnlock(3)		
	end
	for i=1, 3 do
		CSPS.cp2UpdateSum(i)
	end
	CSPS.cp2UpdateSumClusters()
end

local function cp2RespecNeeded()
	-- Check if a respec is needed for the current cp-build
	local respecNeeded = false
	local pointsNeeded = {0,0,0}
	local enoughPoints = {true, true, true}
	for skId, v in pairs(CSPS.cp2Table) do
		local myDisc = CSPS.cp2Disci[skId]
		if CSPS.applyCPc[myDisc] and GetNumPointsSpentOnChampionSkill(skId) < v[2] then pointsNeeded[myDisc] = pointsNeeded[myDisc] + v[2] - GetNumPointsSpentOnChampionSkill(skId) end
	end
	for i=1,3 do
		if pointsNeeded[i] > GetNumUnspentChampionPoints(GetChampionDisciplineId(i)) then respecNeeded = true end
		if pointsNeeded[i] > GetNumSpentChampionPoints(GetChampionDisciplineId(i)) + GetNumUnspentChampionPoints(GetChampionDisciplineId(i)) then enoughPoints[i] = false end
	end
	return respecNeeded, enoughPoints, pointsNeeded
end

function CSPS.cp2ApplyGo()
	if CSPS.cp2Table == nil or CSPS.cp2Table == {} then return end
	-- Do I have enough points, do I need to respec, do I need points at all?
	local respecNeeded, enoughPoints, pointsNeeded = cp2RespecNeeded()
	if enoughPoints[1] == false or enoughPoints[2] == false or enoughPoints[3] == false then 
		ZO_Dialogs_ShowDialog(CSPS.name.."_OkDiag", {},  {mainTextParams = {GS(CSPS_MSG_CpPointsMissing)}, titleParams = {GS(CSPS_MSG_CpPurchTitle)}})
		return 
	end
	if respecNeeded and GetCurrencyAmount(CURT_MONEY, CURRENCY_LOCATION_CHARACTER) < GetChampionRespecCost() then
		ZO_Dialogs_ShowDialog(CSPS.name.."_OkDiag", {},  {mainTextParams = {GS(SI_TRADING_HOUSE_ERROR_NOT_ENOUGH_GOLD)}, titleParams = {GS(CSPS_MSG_CpPurchTitle)}})		
		return 
	end
	local myDisciplines = {GS(CSPS_MSG_CpPurchChosen)}
	for i=1,3 do
		if CSPS.applyCPc[i] then table.insert(myDisciplines, zo_strformat(" |t24:24:<<1>>|t |c<<2>><<3>>: <<4>>|r", CSPS.cpColTex[i], cpColors[i]:ToHex(), GetChampionDisciplineName(GetChampionDisciplineId(i)), pointsNeeded[i])) end
	end
	table.insert(myDisciplines, " ")
	local myCost = respecNeeded and GetChampionRespecCost() or 0
	table.insert(myDisciplines, zo_strformat(GS(CSPS_MSG_CpPurchCost), myCost))
	table.insert(myDisciplines, " ")
	table.insert(myDisciplines, GS(CSPS_MSG_CpPurchNow)) 
	myDisciplines = table.concat(myDisciplines, "\n")
	
	ZO_Dialogs_ShowDialog(CSPS.name.."_OkCancelDiag", 
		{returnFunc = function() CSPS.cp2ApplyConfirm(respecNeeded) end},  
		{mainTextParams = {myDisciplines}, titleParams = {GS(CSPS_MSG_CpPurchTitle)}})
	
end



function CSPS.onCPChange(_, result)
	if result > 0 then return end
	if waitingForCpPurchase then d(string.format("[CSPS] %s", GS(CSPS_CPApplied))) waitingForCpPurchase = false end
	if CSPS.cpCustomBar then CSPS.showCpBar() end
end

function CSPS.cp2ApplyConfirm(respecNeeded, hotbarsOnly)
	-- Did a general check for respeccing before the dialog - hotbarsOnly as an array containing booleans for each hotbar
	PrepareChampionPurchaseRequest(respecNeeded)
	local changeValues = hotbarsOnly == nil
	if changeValues then
		for i,v in pairs(CSPS.cp2Table) do
			if respecNeeded or GetNumPointsSpentOnChampionSkill(i) < v[2] then 
				if CSPS.applyCPc[CSPS.cp2Disci[i]] then AddSkillToChampionPurchaseRequest(i, v[2]) end
			end
		end
	end
	hotbarsOnly = hotbarsOnly or {}	
	local unslottedSkills = {}
	
	for i, v in pairs(CSPS.cp2HbTable) do
		if (CSPS.applyCPc[i] and #hotbarsOnly == 0) or hotbarsOnly[i] == true then
			local skToSlot = {}
			for j=1, 4 do
				local hbSkill = v[j]
				if hbSkill then skToSlot[hbSkill] = true end
			end
			for j=1, 4 do
				local hbSkill = v[j]
				if hbSkill then
					if (not changeValues and not WouldChampionSkillNodeBeUnlocked(hbSkill, GetNumPointsSpentOnChampionSkill(hbSkill))) or (changeValues and not WouldChampionSkillNodeBeUnlocked(hbSkill, CSPS.cp2Table[hbSkill][2])) then 
						table.insert(unslottedSkills, hbSkill)
						hbSkill = nil
					end
				else
					local previousSkill = GetSlotBoundId((i-1) * 4 + j, HOTBAR_CATEGORY_CHAMPION)
					if previousSkill ~= 0 and not skToSlot[previousSkill] and 
						((not changeValues and WouldChampionSkillNodeBeUnlocked(previousSkill, GetNumPointsSpentOnChampionSkill(previousSkill))) or
						(changeValues and WouldChampionSkillNodeBeUnlocked(previousSkill, CSPS.cp2Table[previousSkill][2]))) then 
							hbSkill = previousSkill 
					end
				end	
				AddHotbarSlotToChampionPurchaseRequest((i-1) * 4 + j, hbSkill)
			end
		end
	end
	local result = GetExpectedResultForChampionPurchaseRequest()
    if result ~= CHAMPION_PURCHASE_SUCCESS then  -- Show error on fail - show dialog only if not in hotbar only mode
        if #hotbarsOnly == 0 then 
				ZO_Dialogs_ShowDialog(CSPS.name.."_OkDiag", {},  {mainTextParams = {GS("SI_CHAMPIONPURCHASERESULT", result)}, titleParams = {GS(CSPS_MSG_CpPurchTitle)}})
			else
				d(string.format("[CSPS] %s", GS("SI_CHAMPIONPURCHASERESULT", result)))
		end
        return
    end
	
	if CHAMPION_PERKS_SCENE:GetState() == "shown" then 
		CHAMPION_PERKS:PrepareStarConfirmAnimation()
		cancelAnimation = false
	else
		cancelAnimation = true
	end
	ZO_PreHook(CHAMPION_PERKS, "StartStarConfirmAnimation", function()
		--if  CHAMPION_PERKS_SCENE:GetState() == "hidden" then 
		if cancelAnimation then
			cancelAnimation = false
			return true 
		end
	end)
	waitingForCpPurchase = true
	
	SendChampionPurchaseRequest()
	local confirmationSound
    if respecNeeded then
        confirmationSound = SOUNDS.CHAMPION_RESPEC_ACCEPT
    else
        confirmationSound = SOUNDS.CHAMPION_POINTS_COMMITTED
    end
    PlaySound(confirmationSound)
	changedCP = false
	zo_callLater(function()  CSPS.refreshTree() end, 1000)
	if #unslottedSkills > 0 then
		d(string.format("[CSPS] %s", GS(CSPS_MSG_Unslotted)))
		for  i,v in pairs(unslottedSkills) do
			d(cpColors[CSPS.cp2Disci[v]]:Colorize(zo_strformat(" - <<C:1>>", GetChampionSkillName(v))))
		end
	end
end

function CSPS.importListCP()
	local derLink = CSPSWindowImportExportTextEdit:GetText()
	if derLink == nil or derLink == "" then return end
	local lnkParameter = {SplitString(";", derLink)}
	if lnkParameter == nil then return end
	local lnkSkills = lnkParameter[1]
	local lnkHb = ""
	local importedDisciplines = {}
	local importedAnything = false
	if #lnkParameter > 1 then 
		lnkHb = lnkParameter[2]
	end
	lnkSkills = {SplitString(",", lnkSkills)}
	local discLists = {{}, {}, {}}
	for i, v in pairs(lnkSkills) do
		local skId, skValue = SplitString(":", v)
		skId = tonumber(skId)
		skValue = tonumber(skValue)
		if skId and skValue then
			if skValue > GetChampionSkillMaxPoints(skId) then skValue = GetChampionSkillMaxPoints(skId) end
			local myDisc = CSPS.cp2Disci[skId]
			if myDisc ~= nil then 
				if discLists[myDisc] ~= nil then
					table.insert(discLists[myDisc], {skId, skValue})
				end
			end
		end
	end
	for disciplineIndex, myList in pairs(discLists) do
		importedDisciplines[disciplineIndex] = false
		local remainingPoints = 42000
		if CSPS.cpImportCap then
			remainingPoints = GetNumSpentChampionPoints(GetChampionDisciplineId(disciplineIndex)) + GetNumUnspentChampionPoints(GetChampionDisciplineId(disciplineIndex))
		end
		if #myList > 0 then
			CSPS.cp2ResetTable(disciplineIndex)
			for i, v in pairs(myList) do
				if v[2] and v[2] - CSPS.cp2Table[v[1]][2] <= remainingPoints then 
					remainingPoints = remainingPoints -  v[2] + CSPS.cp2Table[v[1]][2]
					CSPS.cp2Table[v[1]][2] = v[2]
				end
			end
			CSPS.cp2UpdateUnlock(disciplineIndex)
			CSPS.cp2UpdateSum(disciplineIndex)
			importedDisciplines[disciplineIndex] = true
			importedAnything = true
		end
	end
	CSPS.cp2UpdateSumClusters()
	lnkHb = {SplitString(",", lnkHb)}
	local hbTables = {{},{}, {}}
	for i,v in pairs(lnkHb) do
		local skId = tonumber(v)
		local myDisc = CSPS.cp2Disci[skId]
		if myDisc ~= nil then 
			if hbTables[myDisc] ~= nil then
				table.insert(hbTables[myDisc], skId)
			end
		end
	end
	
	for i, v in pairs(hbTables) do
		if #v > 0 then
			importedAnything = true
			CSPS.cp2HbTable[i] = {}
			for j, w in pairs(v) do
				table.insert(CSPS.cp2HbTable[i], w)
			end
		end
	end
	if not importedAnything then return end
	for i=1, 3 do
		CSPS.cp2ReCheckHotbar(i)
	end

	CSPS.cp2UpdateHbMarks()
	if not CSPS.tabEx then 
		CSPS.createTable(true) -- Create the treeview for CP only if no treeview exists yet
		CSPS.toggleCP(0, false)
	end
	for i, v in pairs( importedDisciplines) do
		CSPS.toggleCP(i, v)
	end	
	 CSPS.refreshTree()
	
	CSPS.toggleImportExport(false)
	changedCP = true
	CSPS.showElement("apply", true)
	CSPS.showElement("save", true)
end

local function tryToSlot(myDiscipline)
	local unslottedSkills = {}
	if #skillsToSlot > 0 then
		if #skillsToSlot < 5 then
			CSPS.cp2HbTable[myDiscipline] = skillsToSlot
		else
			CSPS.cp2HbTable[myDiscipline] = {}
			for i,v in pairs(skillsToSlot) do
				if DoesChampionSkillHaveJumpPoints(v) then
					local _, myMinJumpPoint = GetChampionSkillJumpPoints(v)
					if CSPS.cp2Table[v][2] < myMinJumpPoint then 
						table.insert(unslottedSkills, v)
					else
						if #CSPS.cp2HbTable[myDiscipline] < 4 then 
							table.insert(CSPS.cp2HbTable[myDiscipline], v)
						else	
							table.insert(unslottedSkills, v)
						end
					end
				else 
					if #CSPS.cp2HbTable[myDiscipline] < 4 then 
						table.insert(CSPS.cp2HbTable[myDiscipline], v) 
					else
						table.insert(unslottedSkills, v)
					end
				end
			end
		end
	end
	if #unslottedSkills > 0 then
		d(string.format("[CSPS] %s", GS(CSPS_MSG_Unslotted)))
		for  i,v in pairs(unslottedSkills) do
			d(cpColors[CSPS.cp2Disci[v]]:Colorize(zo_strformat(" - <<C:1>>", GetChampionSkillName(v))))
		end
	end	
end

local function applyCPMapping()
		tryToSlot(cpDisciToMap)
		CSPS.cp2UpdateUnlock(cpDisciToMap)
		CSPS.cp2UpdateSum(cpDisciToMap)
		CSPS.cp2UpdateSumClusters()
		CSPS.cp2ReCheckHotbar(cpDisciToMap)
		CSPS.cp2UpdateHbMarks()		
		CSPS.toggleCP(cpDisciToMap, true)
		 CSPS.refreshTree()
		CSPS.showElement("apply", true)
		CSPS.showElement("save", true)
		changedCP = true
		CSPS.showElement("cpImport", true)
end

local function updateCPMapProg()
	CSPSWindowCPImportSuccessNum:SetText(numMapSuccessful + numRemapped + numMapCleared)
	CSPSWindowCPImportOpenNum:SetText(#unmappedSkills + #mappingUnclear + 1 - mappingIndex) 
	if mappingIndex <= #unmappedSkills + #mappingUnclear then 
		local mapMe = nil
		if mappingIndex <= #mappingUnclear then 
			cpSkillToMap = cpSkillToMap or mappingUnclear[mappingIndex][1] 
			mapMe = mappingUnclear[mappingIndex][2] 
			CSPSWindowCPImportMapText:SetText(mappingUnclear[mappingIndex][3])
		else
			CSPSWindowCPImportMapText:SetText(unmappedSkills[mappingIndex - #mappingUnclear][1])
			mapMe = unmappedSkills[mappingIndex - #mappingUnclear][2]
			
		end
		CSPSWindowCPProfiles:SetHeight(277)
		CSPSWindowCPImportMap:SetHidden(false)
		CSPSWindowCPImportMapApply:SetEnabled(cpSkillToMap ~= nil)
		CSPSWindowCPImportClose:SetHidden(true)
		CSPSWindowCPImportMapNote:SetText(GS(CSPS_CPImp_Note))
		CSPS.inCpRemapMode = true
		if cpSkillToMap ~= nil then
			CSPSWindowCPImportMapNew:SetText(zo_strformat(GS(CSPS_CPImp_New), cpColors[cpDisciToMap]:ToHex(), mappingIndex, #unmappedSkills + #mappingUnclear, mapMe, GetChampionSkillName(cpSkillToMap)))
		else
			CSPSWindowCPImportMapNew:SetText(zo_strformat(GS(CSPS_CPImp_New), cpColors[cpDisciToMap]:ToHex(), mappingIndex, #unmappedSkills + #mappingUnclear,  mapMe, "?"))
		end		
	else
		CSPS.inCpRemapMode = false
		CSPSWindowCPImportClose:SetHidden(false)
		CSPSWindowCPImportMap:SetHidden(true)
		applyCPMapping()
		CSPSWindowCPProfiles:SetHeight(77)
	end
end

function CSPS.cp2DiscardMap()
	mappingIndex = mappingIndex + 1
	cpSkillToMap = nil
	updateCPMapProg()
end

function CSPS.cp2DiscardAll()
	mappingIndex = #unmappedSkills + #mappingUnclear + 1
	cpSkillToMap = nil
	updateCPMapProg()
end

function CSPS.cp2DoMap()
	if cpSkillToMap == nil then return end
	local mapMe = nil
	if mappingIndex <= #mappingUnclear then
		mapMe = mappingUnclear[mappingIndex][2]
		if GetChampionSkillMaxPoints(cpSkillToMap) < mapMe then d(string.format("[CSPS] %s", GS(CSPS_CPValueTooHigh))) return end
		numMapCleared = numMapCleared + 1
		numMapUnclear = numMapUnclear - 1
	else
		mapMe = unmappedSkills[mappingIndex - #mappingUnclear][2]
		if GetChampionSkillMaxPoints(cpSkillToMap) < mapMe then d(string.format("[CSPS] %s", GS(CSPS_CPValueTooHigh))) return end
		numRemapped = numRemapped + 1
	end
	CSPS.cp2Table[cpSkillToMap][2] = mapMe
	
	if CanChampionSkillTypeBeSlotted(GetChampionSkillType(cpSkillToMap)) and (markedToSlot[cpSkillToMap] or not slotMarkers) then
		table.insert(skillsToSlot, cpSkillToMap)
	end
	 CSPS.refreshTree()
	mappingIndex = mappingIndex + 1
	updateCPMapProg()
end

function CSPS.cpClicked(control, myId, mouseButton) -- TWEAK HERE TODO
	d("Champion skill ID : " .. myId)
	--d(myId)
	if CSPS.inCpRemapMode and mouseButton == 1 then 
		if CSPSWindowCPImport:IsHidden() then CSPS.inCpRemapMode = false return end
		if cpDisciToMap ~= CSPS.cp2Disci[myId] then return end
		cpSkillToMap = myId
		updateCPMapProg()
	end
	if mouseButton == 2 then
		if CSPS.cp2Table[myId][1] == true then return end
		local myPaths = CSPS.showFastestCPWays(myId)
		ZO_Tooltips_ShowTextTooltip(control, RIGHT, zo_strformat(GS(CSPS_MSG_CPPaths), GetChampionSkillName(myId), myPaths))
	end
end

function CSPS.cleanUpText()
	local myText = CSPSWindowImportExportTextEdit:GetText()
	myText = string.gsub(myText, "(%d+%-%d+)", "") 
	myText = string.gsub(myText, "[^a-z0-9A-Z%s]", "") 
	CSPSWindowImportExportTextEdit:SetText(myText)
end

function CSPS.checkTextExportCP(myDiscipline)
	if string.lower(GetCVar("Language.2")) == "en" then CSPS.exportTextCP(myDiscipline, true) return end
	ZO_Dialogs_ShowDialog(CSPS.name.."_YesNoDiag", 
		{
			yesFunc = function() CSPS.exportTextCP(myDiscipline, false) end,
			noFunc = function() CSPS.exportTextCP(myDiscipline, true) end,
		}, 
		{
			mainTextParams = {GS(CSPS_MSG_ExpTextLang)}
		}
	) 
end

function CSPS.exportTextCP(myDiscipline, myLang)
	local exportSlotted = {}
	for i, v in pairs(CSPS.cp2HbTable[myDiscipline]) do
		exportSlotted[v] = true
	end
	local CSPScpNameKeysRev = {}
	if not myLang then
		for i, v in pairs(CSPScpNameKeys[myDiscipline]) do
			CSPScpNameKeysRev[v] = i
		end
	end
	local exportList = {}
	local function insertInExportList(myId)
		if myId ~= -1 and CSPS.cp2Table[myId][1] == true and CSPS.cp2Table[myId][2] > 0 then
				local mySkillName = myLang and zo_strformat("<<C:1>>", GetChampionSkillName(myId)) or CSPScpNameKeysRev[myId]
				local myValue = CSPS.cp2Table[myId][2]
				local mySlotText = exportSlotted[myId] and " (slot)" or ""
				local myTextLine = ""
				if CSPS.cpImportReverse == 2 then
					myTextLine = string.format("%s%s %s", mySkillName, mySlotText,  myValue)
				elseif CSPS.cpImportReverse == 3 then
					myTextLine = string.format("%s %s%s", mySkillName, myValue, mySlotText)
				else
					myTextLine = string.format("%s %s%s", myValue, mySkillName, mySlotText) 
				end
				table.insert(exportList, myTextLine)
		end
	end
	for i, v in pairs(CSPS.cp2List[myDiscipline]) do	-- Go through the auxlists for an order of skills that makes more sense then their ids
		local myId = -1
		if v[2] == 4 then
			for l, w in pairs(CSPS.cp2ListCluster[v[1]]) do
				myId = w[1]
				insertInExportList(myId)
				myId = -1
			end
		else
				myId = v[1]
				insertInExportList(myId)
		end
	end
	CSPSWindowImportExportTextEdit:SetText(table.concat(exportList, "\n"))
end

function CSPS.checkCPNameKeys(engl)
	local myList = {}
	CSPScpNameKeysT = {}
	for i, v in pairs(CSPScpNameKeys) do
		for j, w in pairs(v) do
			CSPScpNameKeysT[w] = j
		end
	end
	for i, v in pairs(CSPS.cp2Table) do
		local myNameKey = zo_strformat("<<C:1>>", GetChampionSkillName(i))
		myNameKey = string.gsub(string.lower(myNameKey), "[^a-z]", "")
		if not CSPScpNameKeysT[i] then 
			table.insert(myList, string.format('["%s"] = %s --%s', myNameKey, i, CSPS.cp2Disci[i]))
		elseif engl then
			if CSPScpNameKeysT[i] ~= myNameKey then d(string.format("Changed: %s from %s to %s", i, CSPScpNameKeysT[i], myNameKey)) end
		end
	end
	d(myList)
	CSPSWindowImportExportTextEdit:SetText(table.concat(myList, "\n"))
end

function CSPS.importTextCP(myDiscipline, convertMe, sumUp, createDynamicProfile, accountWide)
	local myText = CSPSWindowImportExportTextEdit:GetText()
	local myStartPos = 1
	local myImportTable = {}
	local reverseOrder = false
	local slotPrevious = false
	if CSPS.cpImportReverse == 2 then
		reverseOrder = true 
	elseif CSPS.cpImportReverse == 3 then 
		reverseOrder = true 
		slotPrevious = true
	end
	
	markedToSlot = {}
	markedAsBase = {}
	slotMarkers = false
	-- myText = string.gsub(myText, "%b()", "")
	myText = string.format("%s\n", myText)
	while true do
		local i, j = string.find(myText, "%d+", myStartPos)
		if i == nil then break end
		local k = string.find(myText, "%d+", j + 1)
		local nextLine = string.find(myText, "\n", j + 1)
		local myValue = tonumber(string.sub(myText, i, j))
		local myEndPos = -1
		if k ~= nil or nextLine ~= nil then 
			if k == nil or nextLine == nil then myEndPos = k or nextLine else myEndPos = math.min(k, nextLine) end
			myEndPos = myEndPos - 1
		end
		local mySubString = string.sub(myText, j + 1, myEndPos)
		if reverseOrder then 
			mySubString = string.sub(myText, myStartPos, i)
			k = j + 1
		end
		local mySubStringOneLine = string.gsub(mySubString, "\n", " ")
		local mySubstringSimple = string.gsub(string.lower(mySubString), "[^a-z]", "")
        if string.len(mySubStringOneLine) > 84 then mySubStringOneLine = string.sub(mySubStringOneLine, 1, 84) end
		table.insert(myImportTable, {mySubstringSimple, myValue, mySubStringOneLine})
		if k == nil then break end
		myStartPos = k
	end
	skillsToImport = {}
	unmappedSkills = {}
	numMapSuccessful = 0
	numRemapped = 0
	mappingIndex = 1
	mappingUnclear = {}
	numMapUnclear = 0
	numMapCleared = 0
	local namesChecked = {}
	-- Trying to map the normalized skill names directly to keys
	for i, v in pairs(myImportTable) do
		local myKey = CSPScpNameKeys[myDiscipline][v[1]]
		local mustSlot = string.find(v[1], "slot")
		local isBasestat = string.find(v[1], "basestat")
		if myKey ~= nil then
			if v[2] > GetChampionSkillMaxPoints(myKey) or GetChampionAbilityId(myKey) == 0 then 
				local cpSkName = GetChampionSkillName(myKey)
				cpSkName = cpSkName ~= "" and cpSkName or v[1]
				table.insert(mappingUnclear , {myKey, v[2], cpSkName})
				namesChecked[myKey] = true
				numMapUnclear = numMapUnclear + 1	
				if mustSlot then 
					if slotPrevious then
						markedToSlot[mappingUnclear[#mappingUnclear-1][1]] = true 
					else
						markedToSlot[myKey] = true 
					end
					slotMarkers = true
				end
				if isBasestat then markedAsBase[myKey] = true end
			else
				table.insert(skillsToImport, {myKey, v[2]})
				namesChecked[myKey] = true
				if mustSlot then 
					if slotPrevious then
						markedToSlot[skillsToImport[#skillsToImport-1][1]] = true
					else
						markedToSlot[myKey] = true 
					end
					slotMarkers = true
				end
				if isBasestat then markedAsBase[myKey] = true end
				numMapSuccessful = numMapSuccessful + 1
			end
		else
			-- Go through all keys and check if they at least fit partwise
			local myMinStart = string.len(v[1])
			local myMinStartB = 42
			if myMinStart > 4 and v[2] <= 100 then
				local keyInString = nil
				local stringInKey = nil
				for j,w in pairs(CSPScpNameKeys[myDiscipline]) do
					if (not namesChecked[j]) or convertMe or createDynamicProfile then
						-- Check if the normalized skill name is part of the namekey
						local startA = string.find(v[1], j)
						-- Check if the namekey is part of the normalized skill name
						local startB = string.find(j, v[1])
						if startA ~= nil then
							if startA < myMinStart then 
								myMinStart = startA 
								keyInString = j 
							end
						end
						if startB ~= nil then
							if startB < myMinStartB then
								myMinStartB = startB
								stringInKey = j
							end
						end
					end
				end
				if keyInString ~= nil then
					myKey = CSPScpNameKeys[myDiscipline][keyInString]
					table.insert(skillsToImport, {myKey, v[2]})
					namesChecked[myKey] = true
					if mustSlot then 
						if slotPrevious then
							markedToSlot[skillsToImport[#skillsToImport-1][1]] = true
						else
							markedToSlot[myKey] = true 
						end
						slotMarkers = true
					end
					if isBasestat then markedAsBase[myKey] = true end
					numMapSuccessful = numMapSuccessful + 1
				elseif stringInKey then
					if string.len(v[1]) > string.len(stringInKey) / 2 then
						myKey = CSPScpNameKeys[myDiscipline][stringInKey]
						table.insert(skillsToImport, {myKey, v[2]})
						numMapSuccessful = numMapSuccessful + 1
						if mustSlot then 
							if slotPrevious then
								markedToSlot[skillsToImport[#skillsToImport-1][1]] = true
							else
								markedToSlot[myKey] = true 
							end
							slotMarkers = true
						end
						if isBasestat then markedAsBase[myKey] = true end
					else
						myKey = CSPScpNameKeys[myDiscipline][stringInKey]
						table.insert(mappingUnclear , {myKey, v[2], v[3]})
						numMapUnclear = numMapUnclear + 1
						if mustSlot then 
							if slotPrevious then
								markedToSlot[mappingUnclear[#mappingUnclear-1][1]] = true
							else
								markedToSlot[myKey] = true 
							end
							slotMarkers = true
						end
						if isBasestat then markedAsBase[myKey] = true end
					end
					namesChecked[myKey] = true
				end
			end
		end
		if myKey == nil then
			table.insert(unmappedSkills, {v[3], v[2]})
		end
	end
		
	if convertMe or createDynamicProfile then
		local myRole =  GetSelectedLFGRole()
		local myName = GS(CSPS_Txt_NewProfile2)
		if myRole ~= 3 then 
			myName = CSPS.getProfileNameAbbr(myName)
		end
		if myRole == 1 and  CSPS.isMagOrStam() > 0 then myRole = 4 + CSPS.isMagOrStam() end
		if myRole == 3 then myRole = 7 end

		local convPreset = {
			"[x] = {",
			"\tname = \"Put name here\",",
			"\twebsite = \"Put source URL here (as short as possible)\",",
			os.date("\tupdated = {%m, %d, %Y},"),
			"\tpoints = \"(dynamic)\",",
			string.format("\tsource = \"%s\",", GetDisplayName()),
			string.format("\trole = %s,", myRole),
			string.format("\tdiscipline = %s,", myDiscipline),
			"\tpreset = {",
		}
		local setValue = {}
		local myDynamicList = {}
		for i, v in pairs(skillsToImport) do
			if setValue[v[1]] ~= v[2] or sumUp then
				local thisValue = v[2]
				if sumUp and setValue[v[1]] ~= 0 and setValue[v[1]] ~= nil then
					thisValue = thisValue + setValue[v[1]]
				end
				setValue[v[1]] = thisValue
				table.insert(convPreset, string.format("\t\t{%s, %s},", v[1], thisValue))
				table.insert(myDynamicList, string.format("%s-%s", v[1], thisValue))
			end
		end
		table.insert(convPreset, "\t},")
		
		local mySlottables = {}
		local maxFour = 1
		for i, v in pairs(markedToSlot) do
			if CanChampionSkillTypeBeSlotted(GetChampionSkillType(i)) then
				table.insert(mySlottables, i)
				maxFour = maxFour + 1
				if maxFour == 5 then break end
			end
		end
		local myBasestats = {}
		maxFour = 1 -- ok actually max three now
		for i,v in pairs( markedAsBase) do
			table.insert(myBasestats, i)
			maxFour = maxFour + 1
			if maxFour == 4 then break end
		end
		mySlottables = table.concat(mySlottables, ",")
		myBasestats = table.concat(myBasestats, ",")
		mySlottables = mySlottables or ""
		myBasestats = myBasestats or ""
		table.insert(convPreset, string.format("\tbasestatsToFill = {%s},", myBasestats))
		table.insert(convPreset, string.format("\tslotted = {%s},", mySlottables))
		table.insert(convPreset, "}")
		if createDynamicProfile then 
			local myDynamicProfile = {
				["name"] = myName,
				["cpComp"] = table.concat(myDynamicList, ";"),
				["hbComp"] = mySlottables,
				["points"] = "(dynamic)",
				["discipline"] = myDiscipline,
				["isNew"] = true,
			}
			CSPS.savedVariables.cpProfiles = CSPS.savedVariables.cpProfiles or {}
			CSPS.currentCharData.cpProfiles = CSPS.currentCharData.cpProfiles or {}
			if accountWide then
				table.insert(CSPS.savedVariables.cpProfiles, myDynamicProfile)
			else
				table.insert(CSPS.currentCharData.cpProfiles, myDynamicProfile)
			end
			CSPS.toggleImportExport(false)
			
			newProfileBringToTop = true
			if CSPS.cppList then CSPS.cppList:RefreshData()	end
			if CSPSWindowCPProfiles:IsHidden() == true or CSPS.cpProfDis ~= myDiscipline then 
				CSPS.cpProfType = accountWide and 1 or 2
				CSPS.cpProfile(myDiscipline) 
			end
			for i, v in pairs(CSPS.savedVariables.cpProfiles) do
				v.isNew = nil
			end
			for i, v in pairs(CSPS.currentCharData.cpProfiles) do
				v.isNew = nil
			end
			for i, v in pairs(CSPS.currentCharData.cpHbProfiles) do
				v.isNew = nil
			end
		else
			local myConvertedText = table.concat(convPreset, "\n")
			CSPSWindowImportExportTextEdit:SetText(myConvertedText)
		end
		return
	end
	local remainingPoints = 42000
	if CSPS.cpImportCap then
		remainingPoints = GetNumSpentChampionPoints(GetChampionDisciplineId(disciplineIndex)) + GetNumUnspentChampionPoints(GetChampionDisciplineId(disciplineIndex))
	end
	if #skillsToImport + #unmappedSkills + numMapUnclear > 0 then
		CSPS.cp2ResetTable(myDiscipline)
		skillsToSlot = {}
		local skillsToSlotRev = {}
		for i, v in pairs( skillsToImport) do
			if CSPS.cp2Table[v[1]] ~= nil then 
				if v[2] > GetChampionSkillMaxPoints(v[1]) then v[2] = GetChampionSkillMaxPoints(v[1]) end
				if v[2] <= remainingPoints + CSPS.cp2Table[v[1]][2] then
					remainingPoints = remainingPoints - v[2] + CSPS.cp2Table[v[1]][2]
					CSPS.cp2Table[v[1]][2] = v[2] 
					if CanChampionSkillTypeBeSlotted(GetChampionSkillType(v[1])) and not skillsToSlotRev[v[1]] and  (markedToSlot[v[1]] or not slotMarkers) then
						table.insert(skillsToSlot, v[1])
						skillsToSlotRev[v[1]] = true
					end
				end
			end
		end
		CSPS.cp2UpdateSum(myDiscipline)
		CSPS.cp2UpdateSumClusters()
		if not CSPS.tabEx then 
			CSPS.createTable(true) -- Create the treeview for CP only if no treeview exists yet
			CSPS.toggleCP(0, false)
		end
		if CSPS.cp2ParentTreeSection and not CSPS.cp2ParentTreeSection.node:IsOpen() then
			CSPS.onToggleSektion(CSPS.cp2ParentTreeSection:GetNamedChild("Toggle"), MOUSE_BUTTON_INDEX_LEFT) 
		end
		CSPS.toggleCP(myDiscipline, true)
		CSPS.refreshTree()
		CSPS.toggleImportExport(false)
		CSPS.showElement("apply", false)
		CSPS.showElement("save", false)
		CSPS.showElement("cpImport", true)
		cpDisciToMap = myDiscipline
		updateCPMapProg()
	else
		d(string.format("[CSPS] %s", GS(CSPS_CPImp_NoMatch)))
	end
end

local function cpFastestWays(myCpId)
	local passedCPs = {}
	local fastestWay = 42000
	local myPaths = {}
	local function checkPathPoint(myPoint, myPath)
		if not DoesChampionSkillHaveJumpPoints(myPoint) then return end
		local _, unlockPoints = GetChampionSkillJumpPoints(myPoint)
		myPath.points = myPath.points + unlockPoints
		myPath.checked[myPoint] = true
		table.insert(myPath.steps, myPoint)
		if IsChampionSkillRootNode(myPoint) or CSPS.cp2Table[myPoint][1] then
			fastestWay = math.min(fastestWay, myPath.points)
			table.insert(myPaths, myPath)
		else
			for i, v in pairs({GetChampionSkillLinkIds(myPoint)}) do
				if myPath.checked[v] == nil then
					local newPath = {
						points = myPath.points,
						checked = {},
						steps = {},
					}
					for j, w in pairs(myPath.checked) do
						newPath.checked[j] = w
					end
					for j, w in ipairs(myPath.steps) do
						newPath.steps[j] = w
					end
					checkPathPoint(v, newPath)
				end
			end
		end
	end
	local myPath = {
		points = 0,
		checked = {},
		steps = {},
	}
	checkPathPoint(myCpId, myPath)
	local sortedPaths = {}
	for i, v in pairs(myPaths) do
		if #sortedPaths == 0 then
			sortedPaths[1] = v
		else
			for j, w in ipairs(sortedPaths) do
				if w.points >= v.points then table.insert(sortedPaths, j, v) break end
			end
		end
	end
	return sortedPaths
end

function CSPS.showFastestCPWays(myCpId)
	local sortedPaths = cpFastestWays(myCpId)
	local allPaths = {}
	for i=1, 4 do
		if sortedPaths[i] == nil then break end
		local v = sortedPaths[i]
		table.insert(allPaths, zo_strformat(GS(CSPS_MSG_CPPathOpt), cpColors[CSPS.cp2Disci[myCpId]]:ToHex(), i, v.points))
		local myPathNames = {}
		for j=1, #v.steps do
			table.insert(myPathNames, zo_strformat("<<C:1>>", GetChampionSkillName(v.steps[#v.steps + 1 - j])))
		end
		table.insert(allPaths, table.concat(myPathNames, " → "))
	end
	return table.concat(allPaths, "\n")
end

function CSPS.checkCpOnClose()
	if not changedCP then return end
	d(string.format("[CSPS] %s", GS(CSPS_MSG_ApplyClosing)))
	
end

-- switch CP when entering a zone

function CSPS.onPlayerActivated() 
	local zoneId = GetUnitWorldPosition("player")
	if zoneId == CSPS.lastZoneID then return end
	CSPS.lastZoneID = zoneId
	CSPS.locationBinding(zoneId)
end

--------------TWEAK-------------
--[
function CSPS.tweakApplyFull()
--[[
	local function tweakCPHash()
		local hash = ""
		for disc = 1, 3 do
			hash = hash .. tostring(CSPS.cp2ColorSum[disc])
			for slot = 1, 4 do
				hash = hash .. tostring(CSPS.cp2HbTable[disc][slot])
			end
		end
		return hash
	end

	local function tweakLoadCpPresets(presetIDRed, presetIDBlue, presetIDGreen)
		local hash = tweakCPHash()
		for presetIndex, presetId in ipairs({presetIDRed, presetIDBlue, presetIDGreen}) do
			CSPS.loadCPPreset(4, presetId, presetIndex, true)
			--local myPreset = CSPSCPPresets[presetId]
			--if myPreset == nil then return end
			--loadDynamicCP(myPreset.preset, myPreset.slotted, myPreset.basestatsToFill, myPreset.discipline)
		end
		if hash ~= tweakCPHash() then
			d("CPs updated on profile [" .. tostring(CSPS.profiles[CSPS.currentProfile].name) .. "], remember to save.")
		else
			CSPS.loadBuild()
			changedCP = false -- both because author forgot to refactor
			CSPS.changedCP = false
		end
	end

	local function tweakPreApplyCP()
		if not CSPS or not CSPS.profiles or not CSPS.currentProfile or #CSPS.profiles < CSPS.currentProfile or not CSPS.profiles[CSPS.currentProfile] then return end
		local currentProfileName = CSPS.profiles[CSPS.currentProfile].name
		if currentProfileName == nil or currentProfileName == "" then return end
		local currentProfileKey = currentProfileName:sub(1,1)
		local isMag = true
		if CSPS.attrPoints[3] > CSPS.attrPoints[2] then isMag = false end

		if currentProfileKey == "0" then
			if isMag then
				tweakLoadCpPresets(4, 10, 15)
			else
				tweakLoadCpPresets(7, 13, 15)
			end
		elseif currentProfileKey == "1" then
			if isMag then
				tweakLoadCpPresets(4, 10, 19)
			else
				tweakLoadCpPresets(7, 13, 19)
			end
		elseif currentProfileKey == "2" then
			if isMag then
				tweakLoadCpPresets(3, 11, 20)
			else
				tweakLoadCpPresets(6, 14, 20)
			end
		elseif currentProfileKey == "3" then
			if isMag then
				tweakLoadCpPresets(3, 10, 20)
			else
				tweakLoadCpPresets(6, 13, 20)
			end
		elseif currentProfileKey == "4" then
			tweakLoadCpPresets(1, 8, 20)
		elseif currentProfileKey == "5" then
			tweakLoadCpPresets(2, 9, 20)
		elseif currentProfileKey == "6" then
			if isMag then
				tweakLoadCpPresets(5, 12, 20)
			else
				d("CSPS:tweakPreApplyCP() - There is no stam PvP build yet :(")
			end
		end
	end
]]
	local function tweakApplyFullGo()
		CSPS.dialogHook = true
		CSPS.applySkills()
		--CSPS.applySkillsGo()
		CSPS.applyAttr()
		--CSPS.applyAttrGo() doesnt exist anymore
		CSPS.cp2ApplyGo()
		--CSPS.cp2ApplyConfirm()

		if CSPS.profileXPIndex > 0 then
			local profileIndex = CSPS.currentProfile
			CSPS.selectProfile(CSPS.profileXPIndex)
			CSPS.loadBuild()
			CSPS.applySkills()
			--CSPS.applySkillsGo()
			CSPS.selectProfile(profileIndex)
			CSPS.loadBuild()
		end
		CSPS.dialogHook = false

		if AG then
			--if AG_Panel:IsHidden() then AG.ShowMain() end
			local profileNum = CSPS.profiles[CSPS.currentProfile].name:sub(1, 1)
			if profileNum == "0" then profileNum = "1" end
			
			for i, profileAG in ipairs(AG.setdata.profiles) do
				if profileAG.sortKey == profileNum then
					AG.LoadProfile(i)
					if (profileNum == "3") then
						if GetUnitName("player") == "Azeell" then
							AG.LoadSet(5)
						else
							AG.LoadSet(4)
						end
					else
						AG.LoadSet(1)
					end
				end
			end
		end
		CSPS.isShown()
	end

	--tweakPreApplyCP()
	if GetAttributeUnspentPoints() ~= 64 then return end
	for i=1,3 do 
		if GetNumSpentChampionPoints(GetChampionDisciplineId(i)) ~= 0 then return end
	end
	if CSPS.currentProfile == 0 then return end
	CSPS.profileXPIndex = -1
	for i, profile in ipairs(CSPS.profiles) do
		if profile.name:sub(1, 1) == "9" then 
			CSPS.profileXPIndex = i 
			break
		end
	end
	if CSPS.currentProfile == CSPS.profileXPIndex then return end

	ZO_Dialogs_ShowDialog(CSPS.name.."_OkCancelDiag", 
		{returnFunc = function() tweakApplyFullGo() end},  
		{mainTextParams = {zo_strformat("Apply Full Profile?")}, titleParams = {GS(CSPS_MyWindowTitle)}})
end

local function dialogHook(name, data, textParams, isGamepad)
	if CSPS.dialogHook then
		--d("dialogHook: "..tostring(name))
		--if textParams then
		--	d("dialogHook: "..tostring(textParams.titleParams[1]))
		--	d("dialogHook: "..tostring(textParams.mainTextParams[1]))
		--end
		if data.returnFunc ~= nil and type(data.returnFunc) == "function" then
			data.returnFunc()
			return true
		end
	end
end

ZO_PreHook("ZO_Dialogs_ShowDialog", dialogHook)

--]]
--------------------------------
