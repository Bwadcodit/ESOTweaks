local GS = GetString

function CSPS.selectProfile(profileId)
	CSPS.currentProfile = profileId
	CSPSWindowBuildProfileRename:SetHidden(profileId == 0)
	CSPSWindowBuildProfileMinus:SetHidden(profileId == 0)
end

function CSPS.profilePlus()
	local newProfileId = 1
	while CSPS.profiles[newProfileId] ~= nil do
		newProfileId = newProfileId + 1
	end
	local profilEx = true
	local newProfileName = ""
	local j = newProfileId - 1
	while profilEx == true do
		j = j + 1
		newProfileName = GS(CSPS_Txt_NewProfile)..j
		profilEx = false
		for i,v in pairs(CSPS.profiles) do
			if v.name == newProfileName then profilEx = true end
		end
	end
	CSPS.profiles[newProfileId] = {name = newProfileName}
	CSPS.selectProfile(newProfileId)
	if CSPS.currentProfile ~= 0 then CSPS.saveBuildGo() end
	CSPS.UpdateProfileCombo()	
end

function CSPS.profileRename()
	if CSPS.currentProfile ~= 0 then
		local myWarning = (not CSPSWindowCPProfiles:IsHidden()) and GS(CSPS_MSG_NoCPProfiles) or ""
		ZO_Dialogs_ShowDialog(CSPS.name.."_RenameProfile", nil, {mainTextParams = {CSPS.profiles[CSPS.currentProfile].name, myWarning}, initialEditText = CSPS.profiles[CSPS.currentProfile].name})
	end
end

function CSPS.renameProfileGo(txt)
	for i, v in pairs(CSPS.profiles) do
		if v.name == txt then return end
	end
	CSPS.profiles[CSPS.currentProfile].name = txt
	CSPS.UpdateProfileCombo()
end

function CSPS.profileMinus()
	if CSPS.currentProfile ~= 0 then
		
		local myWarning = (not CSPSWindowCPProfiles:IsHidden()) and GS(CSPS_MSG_NoCPProfiles) or ""
		ZO_Dialogs_ShowDialog(CSPS.name.."_OkCancelDiag", 
			{returnFunc = function() CSPS.deleteProfileGo() end},  
			{mainTextParams = {zo_strformat(GS(CSPS_MSG_DeleteProfile), CSPS.profiles[CSPS.currentProfile].name, GS(CSPS_MSG_DeleteProfileStan), myWarning)}, titleParams = {GS(CSPS_MyWindowTitle)}})
	end
end

function CSPS.deleteProfileGo()
	CSPS.profiles[CSPS.currentProfile] = nil
	CSPS.selectProfile(0)
	CSPS.loadBuild()
	CSPS.UpdateProfileCombo()	
end

function CSPS.loadAndApplyByName(profileName, excludeSkills, excludeAttributes, excludeGreenCP, excludeBlueCP, excludeRedCP, excludeHotbar, excludeGear)
	local indexToLoad = false
	if profileName == GS(CSPS_Txt_StandardProfile) then
		indexToLoad = 0
	else
		for i,v in pairs(CSPS.profiles) do
			if v.name == profileName then indexToLoad = i break end
		end
	end
	if not indexToLoad then d("[CSPS] Profile not found.") return end
	CSPS.loadAndApplyByIndex(indexToLoad, excludeSkills, excludeAttributes, excludeGreenCP, excludeBlueCP, excludeRedCP, excludeHotbar, excludeGear)
end

function CSPS.loadAndApplyByIndex(indexToLoad, excludeSkills, excludeAttributes, excludeGreenCP, excludeBlueCP, excludeRedCP, excludeHotbar, excludeGear)
	if indexToLoad == 0 then
		CSPSWindowBuildProfiles.comboBox:SetSelectedItem(GS(CSPS_Txt_StandardProfile))
	else
		CSPSWindowBuildProfiles.comboBox:SetSelectedItem(CSPS.profiles[indexToLoad].name)
	end 
	CSPS.selectProfile(indexToLoad)
	CSPS.loadBuild()
	
	if not excludeSkills then CSPS.applySkills(true) end
	if not excludeAttributes then CSPS.applyAttr() end
	
	if not (excludeGreenCP and excludeBlueCP and not excludeRedCP) then
		CSPS.toggleCP(1, not excludeGreenCP)
		CSPS.toggleCP(2, not excludeBlueCP)
		CSPS.toggleCP(3, not excludeRedCP)
		
		CSPS.cp2ApplyGo(true)
	end
	if not excludeHotbar then CSPS.hbApply() end
	if not excludeGear then CSPS.equipAllFittingGear() end
end