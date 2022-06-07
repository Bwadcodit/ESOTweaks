local cpColTex = {
		"esoui/art/champion/champion_points_stamina_icon-hud-32.dds",
		"esoui/art/champion/champion_points_magicka_icon-hud-32.dds",
		"esoui/art/champion/champion_points_health_icon-hud-32.dds",
}

local skMap = CSPSSkillFactoryDBExport.skMap
local cpMap = CSPSSkillFactoryDBExport.cpMap
local cp2Map = CSPSSkillFactoryDBExport.cp2Map
local muMap = CSPSSkillFactoryDBExport.mundusMap
local raMap = CSPSSkillFactoryDBExport.raceMap
local clMap = CSPSSkillFactoryDBExport.classMap
local alMap = CSPSSkillFactoryDBExport.allianceMap
local basisUrl = ""
local GS = GetString

local theLink = ""

local function showLink()
	CSPSWindowImportExportTextEdit:SetText(theLink)
	CSPSWindowImportExportTextEdit:SelectAll()
	CSPSWindowImportExportTextEdit:TakeFocus()
end

local function table_invert(t)
   local s={}
   for k,v in pairs(t) do
     s[v]=k
   end
   return s
end

local function showMundus(myMundusId)
	local myMundus = "-"
	if myMundusId ~= nil then 
		myMundus = zo_strformat("<<C:1>>", GetAbilityName(myMundusId)) 
		CSPS.setMundus(myMundusId) 
	else
		myMundus = "-" 
	end
	myMundus = {SplitString(":", myMundus)}
	
	myMundus = myMundus[#myMundus]
	local ctrMundus = CSPSWindowImportExportMundusValue
	ctrMundus:SetText(myMundus)
	if myMundus ~= "-" and (not CSPS.currentMundus or CSPS.currentMundus ~= myMundusId) then
		ctrMundus:SetMouseEnabled(true)
		ctrMundus:SetColor(CSPS.colors.orange:UnpackRGB())
		ctrMundus:SetHandler("OnMouseEnter", function() CSPS.showMundusTooltip(ctrMundus, myMundusId) end)
		ctrMundus:SetHandler("OnMouseExit", function() ZO_Tooltips_HideTextTooltip() end)
	elseif CSPS.currentMundus == myMundusId then
		ctrMundus:SetColor(CSPS.colors.green:UnpackRGB())
		ctrMundus:SetHandler("OnMouseEnter", function() end)
	else
		ctrMundus:SetColor(CSPS.colors.white:UnpackRGB())
		ctrMundus:SetHandler("OnMouseEnter", function() end)
	end
end


local function generateTextSkills(txtIndex)
	local myText = {}
	local myStart = {1, 4, 8}
	myStart = myStart[txtIndex]
	local myEnd = {3, 7, 8}
	myEnd = myEnd[txtIndex]
	for i, v in ipairs(CSPS.skillTable) do
		if i >= myStart and i <= myEnd then
			local typeTable = {GS("SI_SKILLTYPE", i)}
			local typeHasEntries = false
			for j, w in ipairs(v) do
				local lineTable = {}
				local lineHasEntries = false
				for k, z in ipairs(w) do
					if z.purchased then
						typeHasEntries = true
						lineHasEntries = true
						local myName = string.format("    - %s", z.name)
						if z.passive then myName = string.format("    - %s (%s)", z.name, z.rank) end
						table.insert(lineTable, myName)
					end
				end
				if lineHasEntries then 
					table.insert(typeTable, string.format(" - %s", w.name))
					table.insert(typeTable, table.concat(lineTable, "\n"))
				end
			end
			if typeHasEntries then
				table.insert(myText, table.concat(typeTable, "\n"))
			end
		end	
	end
	myText = table.concat(myText, "\n")
	CSPSWindowImportExportTextEdit:SetText(myText)
end

local function generateTextOther()
	local myTable = {zo_strformat("<<C:1>>", GetUnitName("player"))}

	table.insert(myTable, zo_strformat("<<C:1>>", GetRaceName(GetUnitGender('player'), GetUnitRaceId('player'))))
	table.insert(myTable, zo_strformat("<<C:1>>", GetAllianceName(GetUnitAlliance('player'))))
	table.insert(myTable, zo_strformat("<<C:1>>", GetClassName(GetUnitGender('player'), GetUnitClassId('player'))))
	local myAttributes = {GS(SI_STATS_ATTRIBUTES)}
	table.insert(myAttributes, string.format(" - %s: %s", GS(SI_ATTRIBUTES1), CSPS.attrPoints[1]))
	table.insert(myAttributes, string.format(" - %s: %s", GS(SI_ATTRIBUTES2), CSPS.attrPoints[2]))
	table.insert(myAttributes, string.format(" - %s: %s", GS(SI_ATTRIBUTES3), CSPS.attrPoints[3]))
	myAttributes = table.concat(myAttributes, "\n")
	table.insert(myTable, myAttributes)
	local myMundus = CSPS.currentMundus and zo_strformat("<<C:1>>", GetAbilityName(CSPS.currentMundus)) or "-"
	table.insert(myTable, myMundus)
	for i=1, 2 do
		table.insert(myTable, string.format("%s %s:", GS(CSPS_ImpEx_HbTxt), i))
		for j=1, 6 do
			local mySkill = CSPS.hbTables[i][j]
			if mySkill ~= nil then 
				mySkill = string.format("   %s) %s", j, CSPS.skillTable[mySkill[1]][mySkill[2]][mySkill[3]].name)
			else
				mySkill = string.format("   %s) -", j)
			end
		table.insert(myTable, mySkill)
		end
	end
	myTable = table.concat(myTable, "\n")
	CSPSWindowImportExportTextEdit:SetText(myTable)
end

local function generateLinkSF()	
	local lang = string.lower(GetCVar("Language.2"))
	basisUrlTab = {
		["en"] = "https://www.eso-skillfactory.com/en/build-planer/#",
		["de"] = "https://www.eso-skillfactory.com/de/skillplaner/#",
		["fr"] = "https://www.eso-skillfactory.com/fr/planificateur-de-talents/#",
	}
	basisUrl = basisUrlTab[lang] or basisUrlTab["en"]

	-- Skills
	local lnkSkTab = {}
	local skillsToIgnore = {
		[150185] = true, -- armor passives that are auto grant
		[152778] = true,
		[150181] = true,
		[150184] = true,
		[152780] = true,
	}
	for i, skTyp in ipairs(CSPS.skillTable) do
		for j, skLin in ipairs(skTyp) do
			for k, skId in ipairs(skLin) do
				if skId.purchased == true then
					local myRank = skId.rank
					myRank = myRank or 0
					local myId = GetSpecificSkillAbilityInfo(i,j,k,skId.morph,1)
					myId = skillsToIgnore[myId] and "-" or skMap[myId]
					if myId ~= nil then
						if myId ~= "-" then table.insert(lnkSkTab, string.format("%s:%s", myId,myRank)) end
					else
						d(string.format("[CSPS] %s", zo_strformat(GetString(CSPS_ImpEx_ErrSk), skId.name)))
					end
				end
			end
		end
	end
	local hbTab = {}
	if CSPS.hbTables ~= nil and CSPS.hbTables ~= {} then
		for ind1= 1, 2 do
			hbTab[ind1] = {}
			for ind2=1,6 do
				local ijk = CSPS.hbTables[ind1][ind2]
				if ijk ~= nil then
					local myId = GetSpecificSkillAbilityInfo(ijk[1],ijk[2],ijk[3],CSPS.skillTable[ijk[1]][ijk[2]][ijk[3]].morph,1)
					myId = skMap[myId]
					if myId ~= nil then
						table.insert(hbTab[ind1], myId)
					else
						table.insert(hbTab[ind1], 0)
					end
				else 
					table.insert(hbTab[ind1], 0)
				end
				
			end
		end
	else
		hbTab = {{"", "", "", "", "", ""}, {"","","","","",""}}
	end
	-- Read CP
	local cpTable = {}
	for i, v in pairs (CSPS.cp2Table) do
		local myId = cp2Map[i]
		if v[2] ~= 0 and myId then 			
			table.insert(cpTable, string.format("%s:%s", myId, v[2]))
		end
	end
	local cpHbTable = {}
	for i, v in pairs(CSPS.cp2HbTable) do
		for j, w in pairs(v) do 
			local myPos = (i-1) * 4 + j
			local myId = cp2Map[w]
			if myId then
				table.insert(cpHbTable, string.format("%s:%s", myPos, myId))
			end
		end
	end
	-- Generate the whole link 
	-- Alliance, Race, Class, Attributes
	local myAlliance , myRace, myClass = GetUnitAlliance("player"), GetUnitRaceId("player"), GetUnitClassId("player")
	local lnkBaseData = {"v2", 
		alMap[myAlliance] or 0,
		raMap[myRace] or 0, 
		clMap[myClass] or 0,
		CSPS.currentMundus and muMap[CSPS.currentMundus] or 0,
		CSPS.attrPoints[2], 
		CSPS.attrPoints[1], 
		CSPS.attrPoints[3]}
	local linkTable = { } 
	
	CSPS.impExpAddInfo(myAlliance, myRace, myClass)
	showMundus(CSPS.currentMundus)
	
	linkTable[1] = table.concat(lnkBaseData, ",")
	linkTable[2] = table.concat(lnkSkTab, ",") -- includes alliance/race/class because they are separated by , not ;
	
	linkTable[3] = string.format("%s,%s", table.concat(hbTab[1], ":"), table.concat(hbTab[2], ":"))  -- Hotbar 2
	linkTable[4] = "" --setInfo
	if CSPSBuildSkillFactorySetList then linkTable[4] = CSPSBuildSkillFactorySetList() end
	linkTable[5] = string.format("%s,%s,%s", CSPS.cp2ColorSum[1], CSPS.cp2ColorSum[2], CSPS.cp2ColorSum[3])-- cp-sums green blue red
	linkTable[6] = table.concat(cpTable, ",") -- cp as id:value
	linkTable[7] = table.concat(cpHbTable, ",") -- cp hb as pos:id
	linkTable[8] = "" -- placeholder to close with a ;
	local linkParam = table.concat(linkTable, ";")
	theLink = string.format("%s%s", basisUrl, linkParam)
	--CSPSWindowImportExportTextEdit:SetText(theLink)
end

function importSkills(auxTable)
	if #auxTable == 0 then return end
	CSPS.resetSkills()
	local skillTable = CSPS.skillTable
	for skillType, typeData in pairs(auxTable) do
		for skillLineIndex, lineData in pairs(typeData) do
			for skillIndex, skillData in pairs(lineData) do
				local isPassive = IsSkillAbilityPassive(skillType, skillLineIndex, skillIndex)
				local skEntry = skillTable[skillType][skillLineIndex][skillIndex]
				
				skEntry.rank = isPassive and skillData[2] or 1
				skEntry.purchased = true
				skEntry.morph = not isPassive and skillData[1] or nil
				skEntry:setPoints()
			end
			skillTable[skillType][skillLineIndex]:sumUpSkills()
		end
		skillTable[skillType]:sumUpSkills()
	end
	CSPS.unsavedChanges = true
	CSPS.refreshSkillPointSum()	
end

local function importLinkSF()
	local myLink = CSPSWindowImportExportTextEdit:GetText()
	if myLink == nil or myLink == "" then return end
	local lnkParameter = {SplitString("#", myLink)}
	if lnkParameter == nil or #lnkParameter < 2 then return end
	lnkParameter = lnkParameter[2]
	local sfV2 = false
	if string.sub(lnkParameter, 1, 3) == "v2," then sfV2 = true end
	lnkParameter = string.gsub(lnkParameter, ';;', ';-;')
	lnkParameter = {SplitString(";", lnkParameter)}
	CSPS.lnkParameter = lnkParameter
	local muMapBw = table_invert(muMap) -- invert the mapping-tables
	local skMapBw = table_invert(skMap)
	local alMapBw = table_invert(alMap)
	local cp2MapBw = table_invert(cp2Map)
	local raMapBw = table_invert(raMap)
	local clMapBw = table_invert(clMap)
	if lnkParameter[1] == nil or lnkParameter[1] == "-" then d('[CSPS] No Parameter 1') return end
	local lnkSkTab = {SplitString(",", lnkParameter[1])}
	if #lnkSkTab < 3 or (sfV2 and #lnkSkTab < 8) then d('[CSPS] Missing parameters') return end
	
	local lnkBaseData = {}
	if sfV2 then 
		for i=1, 7 do -- in version 2 the first parameter is reserved for the version number
			lnkBaseData[i] = tonumber(lnkSkTab[i+1]) or 0
		end
	else
		for i=1, 3 do
			local baseDataString = SplitString("flrc", lnkSkTab[i])
			lnkBaseData[i] = tonumber(baseDataString) or 0
		end
	end
	
	local myAlliance = alMapBw[lnkBaseData[1]]
	local myRace = raMapBw[lnkBaseData[2]]
	local myClass = clMapBw[lnkBaseData[3]]
	
	CSPS.impExpAddInfo(myAlliance, myRace, myClass)
	local raceCorrect = true
	if GetUnitRaceId('player') ~= myRace then raceCorrect = false end
	local classCorrect = true
	if GetUnitClassId('player') ~= myClass then classCorrect = false end
	local auxTable = {}
	
	if sfV2 then	-- in v1 the skill list was part of the first array, in v2 it's the next one
		lnkSkTab = {SplitString(",", lnkParameter[2])}
	else
		for i=1, 3 do 
			table.remove(lnkSkTab, 1)
		end
	end
	
	if lnkSkTab ~= nil and lnkSkTab ~= "-" then
		for i, v in ipairs(lnkSkTab) do
			local abilityId, myRank = SplitString(":", v)
			abilityId = skMapBw[tonumber(abilityId)]
			if abilityId ~= nil then
				local skTyp, skLin, skId, morph, rank = GetSpecificSkillAbilityKeysByAbilityId(abilityId)	
				if not ((skTyp==1 and classCorrect == false) or (skTyp==7 and raceCorrect == false)) then -- only try to read class/race skills if fitting
					if auxTable[skTyp] == nil then auxTable[skTyp] = {} end
					if auxTable[skTyp][skLin] == nil then auxTable[skTyp][skLin] = {} end
					auxTable[skTyp][skLin][skId] = {morph, tonumber(myRank)}
				end
			end
		end
	end
	importSkills(auxTable)
	local versionAdd = sfV2 and 1 or 0
	if lnkParameter[2 + versionAdd] ~= nil and lnkParameter[2 + versionAdd] ~= "-" then
		-- Hotbar
		local lnkHotbars = {}
		if sfV2 then 
			lnkHotbars = {SplitString(",", lnkParameter[3])}
		else
			lnkHotbars = {lnkParameter[3], lnkParameter[4]}
		end
		
		for ind1= 1, 2 do
			CSPS.hbEmpty(ind1)
			local lnkHbTab = {SplitString(":", lnkHotbars[ind1])}
			if #lnkHbTab == 6 then
				CSPS.hbTables[ind1] = {}
				for ind2=1,6 do
					local myId = skMapBw[tonumber(lnkHbTab[ind2])]
					if myId ~= nil then
						local i, j, k, morph, rank = GetSpecificSkillAbilityKeysByAbilityId(myId)
						if i == 1 and j > 3 then
							CSPS.hbTables[ind1][ind2] = nil
						else
							CSPS.hbTables[ind1][ind2] = {i, j, k}
							CSPS.skillTable[i][j][k].hb[ind1] = ind2
						end
					else
						CSPS.hbTables[ind1][ind2] = nil
					end
				end
			else
				d(string.format("[CSPS] %s", zo_strformat(GetString(CSPS_ImpEx_ErrHb), ind1)))
			end
		end
		CSPS.hbPopulate()
	end
	local myMundus = sfV2 and lnkBaseData[4] or tonumber(lnkParameter[4])
	myMundus = muMapBw[myMundus]
	showMundus(myMundus)
	--5 Attributes
	if sfV2 then 
		CSPS.attrPoints[2] = lnkBaseData[5]
		CSPS.attrPoints[1] = lnkBaseData[6]
		CSPS.attrPoints[3] = lnkBaseData[7]
	else
		local myAttributes = {SplitString(",", lnkParameter[5])} 
		CSPS.attrPoints[2] = tonumber(myAttributes[1]) or 0
		CSPS.attrPoints[1] = tonumber(myAttributes[2]) or 0
		CSPS.attrPoints[3] = tonumber(myAttributes[3]) or 0
	end
	--v1: 6 Armorpieces, 7 CP,8 Cp sums, 9 Weapons
	--v2: 
	-- 4: gear info, comma separated format posistion:setid:type:quality:trait:enchantement (planned for the future)
	-- 5: CP-sums (green-blue-red)
	-- 6: CP-values (id:value), 7: CP-hotbars (position:id), 1-4 = green, 5-8 = blue, 9-12 = red
	local lnkGearTab = sfV2 and lnkParameter[4] and lnkParameter[4] ~= "-" and lnkParameter[4]
	if lnkGearTab and CSPS.doGear then CSPSImportSkillFactorySetList(lnkGearTab) end
	
	local lnkCpTab = false
	lnkCpTab = sfV2 and lnkParameter[6] ~= nil and lnkParameter[6] ~= "-" and {SplitString(",", lnkParameter[6])}
	if lnkCpTab and type(lnkCpTab) == "table" and #lnkCpTab > 0 then
		CSPS.cp2ResetTable()
		for i, v in pairs(lnkCpTab) do
			local myId, myValue = SplitString(":", v)
			myId = tonumber(myId)
			myValue = tonumber(myValue)
			if myId and myValue then
				myId = cp2MapBw[myId]
				if CSPS.cp2Table[myId] then
					if myValue > GetChampionSkillMaxPoints(myId) then myValue = GetChampionSkillMaxPoints(myId) end
					CSPS.cp2Table[myId][2] = myValue
				end
			end
		end
		local lnkCpHb = false
		lnkCpHb = lnkParameter[7] ~= nil and lnkParameter[7] ~= "-" and {SplitString(",", lnkParameter[7])}
		if lnkCpHb and type(lnkCpHb) == "table" and #lnkCpHb > 0 then
			CSPS.cp2HbTable = {{}, {}, {}}
			for i, v in pairs(lnkCpHb) do
				local myPos, myId = SplitString(":", v)
				myPos = tonumber(myPos)
				myId = tonumber(myId)
				if myId then myId = cp2MapBw[myId] end
				if myPos and myId then
					local myDisc = math.floor((myPos-1) / 4)
					myPos = myPos - (myDisc * 4)
					myDisc = myDisc + 1
					CSPS.cp2HbTable[myDisc][myPos] = myId
				end
			end
		end
		for i=1, 3 do
			CSPS.cp2UpdateUnlock(i)
			CSPS.cp2UpdateSum(i)
			CSPS.cp2ReCheckHotbar(i)
		end
		CSPS.cp2UpdateHbMarks()
		CSPS.cp2UpdateSumClusters()
	end
	
	if not CSPS.tabEx then CSPS.createTable()	end		
	CSPS.refreshTree() 
	CSPS.showElement("apply", true)
	CSPS.showElement("save", true)
end

local transferLevels = {}

function CSPS.transferProfile(cpPSub)
	CSPS.showElement("apply", true)
	CSPS.showElement("save", true)
	local myTable
	if not cpPSub then 
		if transferLevels[4] == 0 then
			myTable = CSPSSavedVariables[transferLevels[1]][transferLevels[2]]["$AccountWide"]["charData"][transferLevels[3]]
		else
			myTable = CSPSSavedVariables[transferLevels[1]][transferLevels[2]]["$AccountWide"]["charData"][transferLevels[3]]["profiles"][transferLevels[4]]
		end
		
		if myTable == nil then return end
		
		if myTable.werte == nil then d(string.format("[CSPS] %s", GS(CSPS_NoSavedData))) return end
	elseif cpPSub == 1 then
		myTable = CSPSSavedVariables[transferLevels[1]][transferLevels[2]]["$AccountWide"]["charData"][transferLevels[3]]["cpProfiles"][transferLevels[4]]
	elseif cpPSub == 2 then
		myTable = CSPSSavedVariables[transferLevels[1]][transferLevels[2]]["$AccountWide"]["charData"][transferLevels[3]]["cpHbProfiles"][transferLevels[4]]
	end
	if not cpPSub then
		local skillTableClean = myTable.werte
		local attrComp = myTable.attribute
		local hbComp = myTable.hbwerte
		CSPS.tableExtract(skillTableClean.prog, skillTableClean.pass)
			
		if CSPS.doGear then
			local gearComp = myTable.gearComp or ""
			CSPS.extractGearString(gearComp)
		end
		CSPS.hbTables = CSPS.hbExtract(hbComp)
		CSPS.hbLinkToSkills(CSPS.hbTables)
		CSPS.hbPopulate()
		CSPS.attrExtract(attrComp)
		CSPS.refreshSkillPointSum()
	end
	
	if cpPSub ~= 2 then
		local cp2Comp = ""
		if not cpPSub then cp2Comp = myTable.cp2werte or "" else cp2Comp = myTable.cpComp or "" end
		CSPS.cp2Extract(cp2Comp)
	end
	local cp2HbComp = ""
	if not cpPSub then cp2HbComp = myTable.cp2hbwerte or "" else cp2HbComp = myTable.hbComp or "" end
	CSPS.cp2HbTable = CSPS.cp2HbExtract(cp2HbComp)
	
	if not CSPS.tabEx then CSPS.createTable() end
	for i=1,3 do
		CSPS.cp2HbIcons(i)
	end
	CSPS.cp2UpdateHbMarks()
	
	 CSPS.refreshTree() 
	CSPS.unsavedChanges = false
	CSPS.toggleImportExport(false)
end


function CSPS.transferCPProfile()
	CSPS.transferProfile(1)
end

function CSPS.transferCPHbProfile()
	CSPS.transferProfile(2)
end

function CSPS.transferBindingsDiag(keepThem)
	local sourceName = CSPSSavedVariables[transferLevels[1]][transferLevels[2]]["$AccountWide"]["charData"][transferLevels[3]]["$lastCharacterName"]
	local destName = CSPS.currentCharData["$lastCharacterName"]
	ZO_Dialogs_ShowDialog(CSPS.name.."_YesNoDiag", 
				{yesFunc = function() CSPS.transferBindings(keepThem) end,
				noFunc = function() end,
				}, 
				{mainTextParams = {zo_strformat(GS(CSPS_ImpExp_TransConfirm), sourceName, destName)}}
				) 
end

function CSPS.transferBindings(keepThem)
	CSPS.showElement("apply", true)
	CSPS.showElement("save", true)
	local myTableBd = CSPSSavedVariables[transferLevels[1]][transferLevels[2]]["$AccountWide"]["charData"][transferLevels[3]]["bindings"] or {}
	local myTableHk = CSPSSavedVariables[transferLevels[1]][transferLevels[2]]["$AccountWide"]["charData"][transferLevels[3]]["cp2hbpHotkeys"] or {}
	local myTableHb = CSPSSavedVariables[transferLevels[1]][transferLevels[2]]["$AccountWide"]["charData"][transferLevels[3]]["cpHbProfiles"]
	if myTableHb == nil then d(string.format("[CSPS] %s", GS(CSPS_NoSavedData))) return end
	local myMappings = {}
	local takenInd = 0
	if not keepThem then CSPS.currentCharData.cpHbProfiles = {} end
	for i, _ in pairs(CSPS.currentCharData.cpHbProfiles) do
		if i > takenInd then takenInd = i end
	end
	for i, v in pairs(myTableHb) do
		local newIndex = i + takenInd
		CSPS.currentCharData.cpHbProfiles[newIndex] = v
	end
	for i=1, 20 do
		CSPS.cp2hbpHotkeys[i] = {}
	end
	for i, v in pairs(myTableHk) do
		for j, w in pairs(v) do
			CSPS.cp2hbpHotkeys[i][j] = w + takenInd
		end
	end
	ZO_DeepTableCopy(myTableBd,  CSPS.bindings)
	CSPS.currentCharData.cp2hbpHotkeys = CSPS.cp2hbpHotkeys 
	CSPS.currentCharData.bindings = CSPS.bindings
	CSPS.initConnect()
end


function CSPS.updateTransferCombo(myLevel)
	if myLevel == nil then return end
	
	local ctrNames = {"Server", "Account", "Char", "Profiles", "CPProfiles", "CPHbProfiles"}
	local myControl = CSPSWindowImportExportTransfer:GetNamedChild(ctrNames[myLevel])
	local myButton = CSPSWindowImportExportTransfer:GetNamedChild(ctrNames[myLevel].."Btn")
	local myPromptNames = {
		GS(CSPS_ImpExp_Transfer_Server).."...", 
		GS(SI_CURRENCYLOCATION3).."...", 		-- Account
		GS(SI_CURRENCYLOCATION0).."...", 		-- Character
		GS(CSPS_ImpExp_Transfer_Profiles),
		GS(CSPS_ImpExp_Transfer_CPP),
		GS(CSPS_ImpExp_Transfer_CPHb)
		}
		
	local selectPrompt = myPromptNames[myLevel]
		-- tooltip 
	myControl.data = {tooltipText = selectPrompt}
	myControl:SetHandler("OnMouseEnter", ZO_Options_OnMouseEnter)
	myControl:SetHandler("OnMouseExit", ZO_Options_OnMouseExit)
	myControl.comboBox = myControl.comboBox or ZO_ComboBox_ObjectFromContainer(myControl)
	local myComboBox = myControl.comboBox
	myComboBox:ClearItems()
	local choices = {}
	if CSPSSavedVariables == nil then return end
	for i=4, 6 do
		CSPSWindowImportExportTransfer:GetNamedChild(ctrNames[i].."Btn"):SetHidden(true)
	end
	if myLevel < 4 then
		for i=4, 6 do
			CSPSWindowImportExportTransfer:GetNamedChild(ctrNames[i]):SetHidden(true)
			CSPSWindowImportExportTransfer:GetNamedChild(ctrNames[i].."Btn"):SetHidden(true)
		end
		CSPSWindowImportExportTransfer:GetNamedChild("CPHkCopyReplace"):SetHidden(true)
		CSPSWindowImportExportTransfer:GetNamedChild("CPHkCopyAdd"):SetHidden(true)
	end
	if myLevel < 3 then	CSPSWindowImportExportTransfer:GetNamedChild(ctrNames[3]):SetHidden(true) end
	if myLevel < 2 then	CSPSWindowImportExportTransfer:GetNamedChild(ctrNames[2]):SetHidden(true) end
	-- CSPSSavedVariables["EU Megaserver"]["@Irniben"]["$AccountWide"]["charData"]
	
	-- Nothing is selected, filling the server list
	if myLevel == 1 then	
		for i, _ in pairs(CSPSSavedVariables) do
			choices[i] = i
		end
	-- Server selected, fill account list
	elseif myLevel == 2 then
		for i, _ in pairs(CSPSSavedVariables[transferLevels[1]]) do
			choices[i] = i
		end

	-- Account selected, fill char list
	elseif myLevel == 3 then
		for i, v in pairs(CSPSSavedVariables[transferLevels[1]][transferLevels[2]]["$AccountWide"]["charData"]) do
			local myName = v["$lastCharacterName"]
		    if myName ~= nil then choices[myName] = i end
		end
	
	-- Char selected, fill and show the profile lists etc.
	elseif myLevel == 4 then
		choices["Standard"] = 0
		if CSPSSavedVariables[transferLevels[1]][transferLevels[2]]["$AccountWide"]["charData"][transferLevels[3]]["profiles"] ~= nil then
			for i, v in pairs(CSPSSavedVariables[transferLevels[1]][transferLevels[2]]["$AccountWide"]["charData"][transferLevels[3]]["profiles"]) do
				local myName = v["name"]
				if myName ~= nil then choices[myName] = i end
			end	
		end
		
		CSPSWindowImportExportTransfer:GetNamedChild("CPHkCopyReplace"):SetHidden(false)
		CSPSWindowImportExportTransfer:GetNamedChild("CPHkCopyAdd"):SetHidden(false)
	elseif myLevel == 5 then
		if CSPSSavedVariables[transferLevels[1]][transferLevels[2]]["$AccountWide"]["charData"][transferLevels[3]]["cpProfiles"] ~= nil then
			for i, v in pairs(CSPSSavedVariables[transferLevels[1]][transferLevels[2]]["$AccountWide"]["charData"][transferLevels[3]]["cpProfiles"]) do
				local myName = v["name"]
				if myName ~= nil then 
					myName = string.format("|t25:25:%s|t %s", cpColTex[v["discipline"]], myName)
					choices[myName] = i 
				end
			end	
		end
	elseif myLevel == 6 then
		if CSPSSavedVariables[transferLevels[1]][transferLevels[2]]["$AccountWide"]["charData"][transferLevels[3]]["cpHbProfiles"] ~= nil then
			for i, v in pairs(CSPSSavedVariables[transferLevels[1]][transferLevels[2]]["$AccountWide"]["charData"][transferLevels[3]]["cpHbProfiles"]) do
				local myName = v["name"]
				if myName ~= nil then 
					myName = string.format("|t25:25:%s|t %s", cpColTex[v["discipline"]], myName)
					choices[myName] = i 
				end
			end	
		end
	end
	myControl:SetHidden(false)	
	local function OnItemSelect(_, choiceText, _)
		local myGroup = choices[choiceText] or nil
		transferLevels[myLevel] = myGroup
		if myLevel < 4 then CSPS.updateTransferCombo(myLevel + 1) end
		if myLevel == 3 then
			CSPS.updateTransferCombo(5) 
			CSPS.updateTransferCombo(6) 
		end
		if myLevel > 3 then 
			myButton:SetHidden(false)
			myButton:SetText(GS(CSPS_ImpExp_TransferLoad))
		end
		PlaySound(SOUNDS.POSITIVE_CLICK)
	end

	myComboBox:SetSortsItems(true)
	
	for i,j in pairs(choices) do
		myComboBox:AddItem(myComboBox:CreateItemEntry(i, OnItemSelect))
	end
	myComboBox:SetSelectedItem(selectPrompt)
end

function CSPS.generateLink()
	if not CSPS.tabEx then CSPSWindowImportExportTextEdit:SetText(GetString(CSPS_ImpEx_NoData)) return end
	if CSPS.formatImpExp == "txtCP2_1" then
		CSPS.checkTextExportCP(1)
		return
	elseif CSPS.formatImpExp == "txtCP2_2" then
		CSPS.checkTextExportCP(2)
		return
	elseif CSPS.formatImpExp == "txtCP2_3" then
		CSPS.checkTextExportCP(3)
		return
	end
	if not CSPS.tabEx then CSPSWindowImportExportTextEdit:SetText(GetString(CSPS_ImpEx_NoData)) return end
	if CSPS.formatImpExp == "sf" then 
		generateLinkSF()
		showLink()
	elseif CSPS.formatImpExp == "txtSk1" then
		generateTextSkills(1)
	elseif CSPS.formatImpExp == "txtSk2" then
		generateTextSkills(2)
	elseif CSPS.formatImpExp == "txtSk3" then
		generateTextSkills(3)
	elseif CSPS.formatImpExp == "txtOd" then
		generateTextOther()
	end
end

function CSPS.importLink(ctrl, shift, alt, button)
	if CSPS.formatImpExp == "sf" then 
		importLinkSF()
	elseif CSPS.formatImpExp == "csvCP" then
		CSPS.importListCP()
	elseif CSPS.formatImpExp == "txtCP2_1" then -- (discipline, convertMe, sumUp, createDynamicProfile, accountWide)
		CSPS.importTextCP(1, button == 1 and ctrl, shift, button == 2, ctrl)
	elseif CSPS.formatImpExp == "txtCP2_2" then
		CSPS.importTextCP(2, button == 1 and ctrl, shift, button == 2, ctrl)
	elseif CSPS.formatImpExp == "txtCP2_3" then
		CSPS.importTextCP(3, button == 1 and ctrl, shift, button == 2, ctrl)
	end
end