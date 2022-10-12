-- English Version

local L = {}

	L.SI_BINDING_NAME_CSPS_SHOW = "Show Skill Point Saver"
	L.SI_BINDING_NAME_CSPS_CPHK1 = "CP bar profile hotkey 1"
	L.SI_BINDING_NAME_CSPS_CPHK2 = "CP bar profile hotkey 2"
	L.SI_BINDING_NAME_CSPS_CPHK3 = "CP bar profile hotkey 3"
	L.SI_BINDING_NAME_CSPS_CPHK4 = "CP bar profile hotkey 4"
	L.SI_BINDING_NAME_CSPS_CPHK5 = "CP bar profile hotkey 5"
	L.SI_BINDING_NAME_CSPS_CPHK6 = "CP bar profile hotkey 6"
	L.SI_BINDING_NAME_CSPS_CPHK7 = "CP bar profile hotkey 7"
	L.SI_BINDING_NAME_CSPS_CPHK8 = "CP bar profile hotkey 8"
	L.SI_BINDING_NAME_CSPS_CPHK9 = "CP bar profile hotkey 9"
	L.SI_BINDING_NAME_CSPS_CPHK10 = "CP bar profile hotkey 10"
	L.SI_BINDING_NAME_CSPS_CPHK11 = "CP bar profile hotkey 11"
	L.SI_BINDING_NAME_CSPS_CPHK12 = "CP bar profile hotkey 12"
	L.SI_BINDING_NAME_CSPS_CPHK13 = "CP bar profile hotkey 13"
	L.SI_BINDING_NAME_CSPS_CPHK14 = "CP bar profile hotkey 14"
	L.SI_BINDING_NAME_CSPS_CPHK15 = "CP bar profile hotkey 15"
	L.SI_BINDING_NAME_CSPS_CPHK16 = "CP bar profile hotkey 16"
	L.SI_BINDING_NAME_CSPS_CPHK17 = "CP bar profile hotkey 17"
	L.SI_BINDING_NAME_CSPS_CPHK18 = "CP bar profile hotkey 18"
	L.SI_BINDING_NAME_CSPS_CPHK19 = "CP bar profile hotkey 19"
	L.SI_BINDING_NAME_CSPS_CPHK20 = "CP bar profile hotkey 20"
	
	-- General UI
	L.CSPS_MyWindowTitle = "Caro's Skill Point Saver"
	
	L.CSPS_Tooltiptext_Close = "Close this window"
	L.CSPS_Tooltiptext_Read = "Read current data"
	L.CSPS_Tooltiptext_Save = "Save shown data"
	L.CSPS_Tooltiptext_Load = "Load saved data"
	L.CSPS_Tooltiptext_Apply = "Apply champion points"
	L.CSPS_Tooltiptext_Help = "Help!"
	L.CSPS_Tooltiptext_CP1 = "Do you want to apply the blue champion points?"
	L.CSPS_Tooltiptext_CP2 = "Do you want to apply the red champion points?"
	L.CSPS_Tooltiptext_CP3 = "Do you want to apply the green champion points?"
	
	L.CSPS_Tooltiptext_ApplyCP = "Apply champion points"
	L.CSPS_Tooltiptext_ATTR = "Apply the attribute points"
	L.CSPS_Tooltiptext_Sk = "Apply the skill points"
	
	L.CSPS_Tooltiptext_MinusSk = "Downgrade/remove this skill"
	L.CSPS_Tooltiptext_PlusSk = "Upgrade/add this skill"
	L.CSPS_Tooltiptext_Optional = "Show additional options"
	L.CSPS_Tooltiptext_SkIcon = "Drag skill to slot it on the hotbar.."
	L.CSPS_Tooltiptext_SrcCombo	 = "Select a format for import/export."
	L.CSPS_Tooltiptext_AddProfile = "Add profile..."
	L.CSPS_Tooltiptext_RenameProfile = "Rename profile..."
	L.CSPS_Tooltiptext_DeleteProfile = "Delete profile..."
	L.CSPS_Tooltiptext_ProfileCombo = "Select a profile to load/save your data..."
	L.CSPS_Tooltiptext_MinusSkType = "Remove all skills from this type."
	L.CSPS_Tooltiptext_MinusSkLine = "Remove all skills from this skill line."
	L.CSPS_Tooltiptext_PlusSkLine = "Add all passive skills and set them to their highest rank"
	L.CSPS_Tooltiptext_MinusAttr = "Remove attribute point (hold Shift for 10 points)"
	L.CSPS_Tooltiptext_PlusAttr = "Add attribute point (hold Shift for 10 points)"
	L.CSPS_Tooltiptext_SaveProfile = "Save this profile..."
	L.CSPS_Tooltiptext_CPProfile = "CP profiles" -- also used for the profile-section title
	L.CSPS_Tooltiptext_PlusCP = "Add champion point (hold Shift for 10 points / next stage)"
	L.CSPS_Tooltiptext_MinusCP = "Remove champion point (hold Shift for 10 points / next stage)"
	L.CSPS_Tooltiptext_CpHbHk = "Click here to change the hotkey for this profile."
	L.CSPS_Tooltip_CPBar = "Drag & drop a skill from the list to slot it here. Use rightclick to remove a slotted skill."
	L.CSPS_Tooltip_CPPUpdate = "Last updated: <<1>>/<<2>>/<<3>>"
	L.CSPS_Tooltip_CPPWebsite = "For the most recent updates visit:\n<<1>>"
	L.CSPS_Tooltip_CPCustomBar = "Toggles wether a bar for the slotted champion points should be shown as part of the HUD"
	L.CSPS_Tooltip_CPCustomIcons = "Toggles wether the addon should use custom icons for slottable champion points"
	
	L.CSPS_Tooltip_ReverseLabel = "The standard order for importing of text is: Number, Name.\nCheck this box to reverse the order to: Name, Number."
	L.CSPS_Tooltip_CapLabel = "If this checkbox is activated the addon won't try to import more champion points than available on this account."
	L.CSPS_Tooltip_SelectBarProfile = "Select a bar profile"
	L.CSPS_Tooltip_ImpExp_CleanUp = "This will remove all special characters from the text. It will also remove all dash-separated pairs of numbers that may be used to indicate needed champion point ranges (e.g. on AlcastHQ) but will cause errors in the import process."
	
	L.CSPS_Tooltip_AddBind1 = "If you add this condition, everytime you load the selected dressing room set, the current group will be automatically applied."
	L.CSPS_Tooltip_AddBind2 = "If you add this condition, everytime you load the selected alpha gear set, the current group will be automatically applied."
	L.CSPS_Tooltip_AddBind3 = "If you add this condition, everytime you enter the selected location, the current group will be automatically applied."
	
	L.CSPS_Tooltip_CPAutoOpen = "Check this box, if the addon should be shown every time you enter the champion point window."
	
	L.CSPS_Tooltiptext_DeleteBinding = "Remove binding"
	
	L.CSPS_Tooltip_AddConnection = "Connect to current profile"
	L.CSPS_Tooltip_RemoveConnection = "Remove connection to current profile"
	L.CSPS_Tooltip_ShowConnection = "Connected to champion point profile: %s\n\n Changes made to this champion discipline can be applied to your character but not saved to the current build profile. Loading the build will automatically try to load the connected champion point profile.\n\n|t26:26:esoui/art/miscellaneous/icon_rmb.dds|t: Remove connection"
	
	L.CSPS_Tooltiptext_LoadAndApply = "Load and apply"
	L.CSPS_MORPH = "<<1[No Morph/Morph 1/Morph $d]>>"
	L.CSPS_MyRank = "Rank %s"
	
	L.CSPS_CP_RED = "Red CP"
	L.CSPS_CP_BLUE = "Blue CP"
	L.CSPS_CP_GREEN = "Green CP"
	
	L.CSPS_TxtCp = "CP"	-- shortest form for champion points
	L.CSPS_TxtCpOld = "CP 1.0"
	L.CSPS_TxtCpNew = "CP 2.0"
	--	Errormessages (chat)
	L.CSPS_NoSavedData = "No saved data yet."
	L.CSPS_TxtLangDiff = "The ingame language has been changed. Migrating data for the alphabetically ordered skill types."
	L.CSPS_Txt_NewProfile = "Profile " -- for numbered names
	L.CSPS_Txt_NewProfile2 = "New profile" -- for unnumbered names
	L.CSPS_Txt_StandardProfile = "Standard"
	
	L.CSPS_CPP_Name = "Name"
	L.CSPS_CPP_Points = "Points"
	L.CSPS_CPP_Role = "Role"
	L.CSPS_CPP_Source = "Source"
	L.CSPS_CPP_Hotkey = "Hotkey"
	L.CSPS_CPP_BtnCustAcc = "Custom\n(Account)"
	L.CSPS_CPP_BtnCustChar = "Custom\n(Char)"
	L.CSPS_CPP_BtnImportText = "Import from text"
	L.CSPS_CPP_BtnPresets = "Presets"
	L.CSPS_CPP_BtnHotBar = "Hotbars only"
	L.CSPS_CPApplied = "Champion points succesfully applied"
	L.CSPS_CPNoChanges = "No champion point changes necessary"
	L.CSPS_CPBar_GroupHeading = "Current group: %s/%s"
	L.CSPS_CPBar_GroupKeybind = "Current keybind: %s"
	L.CSPS_CPBar_Manage = "Manage champion bars"
	L.CSPS_CPLoadGroup = "Loading group:"
	
	L.CSPS_CPValueTooHigh = "Value is higher than the maximum for this skill."
	
	L.CSPS_CPPDescr_JoaTFarming = "This preset is optimized to be used with the addon 'Jack of all Trades' and focusses on farming ressources (combat, fishing and crime are added at a higher cp level)."
	L.CSPS_CPPDescr_JoaTFishing = "This preset is optimized to be used with the addon 'Jack of all Trades' and focusses on fishing (farming, combat and crime are added at a higher cp level)."
	L.CSPS_CPPDescr_JoaTThieving = "This preset is optimized to be used with the addon 'Jack of all Trades' and focusses on crime (farming, combat and fishing are added at a higher cp level)."
	L.CSPS_CPPDescr_CombatFocus = "This preset is focussed on the combat related green champion points."
	
	L.CSPS_StrictOrder = "Strict Order"
	L.CSPS_Tooltiptext_StrictOrder = "Check this box to let the addon stop loading a preset at the first skill for which you don't have enough points instead of checking if one of the following skills can be loaded instead. Choosing this option might leave you with more unspent points but might save you the respec-fee of 3000 gold later on."
	L.CSPS_CPPCurrentlyApplied = "Currently applied:  <<1[No points/1 point/$d points]>>"
		
	L.CSPS_MSG_ApplyClosing = "You seem to have unapplied changes in your champion points. Please make sure you didn't forget to apply them."
	
	L.CSPS_CPBar_LocTrial = "Trial/Arena"
	L.CSPS_CPBar_LocCurr = "Current location"
	L.CSPS_CPBar_LocType = "By Type"
	L.CSPS_CPBar_LocName = "Current location (exact name)"
	L.CSPS_CPBar_Location = "Location"
		
	L.CSPS_CPBar_SelectGroup1 = "Select a page..." -- Dressing room
	L.CSPS_CPBar_SelectGroup2 = "Select a profile..." -- Alpha gear
	L.CSPS_CPBar_SelectGroup3 = "Select a category..." -- Location
	
	L.CSPS_CPBar_SelectSet1 = "Select a set..." -- Dressing room
	L.CSPS_CPBar_SelectSet2 = "Select a build..." -- Alpha gear
	L.CSPS_CPBar_SelectSet3 = "Select a location..." -- Location
	
	L.CSPS_CPBar_AddBindings = "Add conditions for this group to be applied automatically..."
	L.CSPS_CPBar_AddBind = "Add binding"
	L.CSPS_CPBar_BindingsHeader = "Existing conditions for this group:"
	
	L.CSPS_CPBar_EditProfiles = "Edit profiles"
	L.CSPS_CPBar_Apply = "Load and apply this group..."
	L.CSPS_CPBar_NoDR = "You either don't have <<1>> installed or you have a version that's not supported right now."
	

	L.CSPS_Help_Oversection1 = "General functions"
	L.CSPS_Help_Head1 = "Saving data:"
	L.CSPS_Help_Sect1 = "1. Click on 'Read current data' (|t28:28:esoui/art/help/help_tabicon_feedback_up.dds|t).\n2. Optionally, click on the plus/minus next to your skills to adjust them (You will be able to edit your skills later, too.)\n3. Click on 'Save shown data'. (|t28:28:esoui/art/mail/mail_tabicon_compose_up.dds|t)\nAll skills, attributes and CP are saved."
	L.CSPS_Help_Head2 = "Loading saved data:"
	L.CSPS_Help_Sect2 = "1. Click on 'Load saved data'. (|t28:28:esoui/art/mail/mail_tabicon_inbox_up.dds|t)\n2. Optionally, click on the plus/minus next to your skills to adjust them.\n3. Click on one of the apply buttons (|t28:28:esoui/art/buttons/accept_up.dds|t) at the top to apply your skills, attributes or champion points.\nYour selected data is applied.\nWhen applying skills, please note that your hotbars have to be applied separately. Make sure your hotbars are displayed at the bottom of the addon. If not, click on 'Options' (top right corner, |t28:28:esoui/art/skillsadvisor/advisor_tabicon_settings_up.dds|t) and enable the hotbars. Then click apply at the bottom of the addon (between the two hotbars, |t28:28:esoui/art/buttons/accept_up.dds|t) and swap your bar."
	L.CSPS_Help_Head3 = "Creating profiles"
	L.CSPS_Help_Sect3 = "You can save all your data (skills, attributes, champion points) to different profiles.\n1. Choose an existing profile via the dropdown menu in the top left corner of the addon window or create a new profile by clicking on the plus button right next to it.\n2. Aside from the standard one you are free to rename and delete all your created profiles (|t28:28:esoui/art/buttons/edit_up.dds|t , |t28:28:esoui/art/buttons/minus_up.dds|t).\n3. To keep your saved data as small as possible, it is recommended to save only those skills to a profile that should actually be changed when applying it. Use the corresponding minus buttons do remove whole skill lines from your profile.\n4. Don't forget to save your profile once you're finished editing it. (|t28:28:esoui/art/mail/mail_tabicon_compose_up.dds|t)"
	L.CSPS_Help_Head4 = "Applying profiles / respeccing"
	L.CSPS_Help_Sect4 = "To apply a profile with skill or attribute points, first go to a shrine and spend some gold to rededicate your skills/attributes.\nIn most cases you won't have to reset all your skills - the morphs should be enough. Stay in rededication mode to apply your changes. Confirm your changes in the eso skills window once you're done. Please note that the addon will treat your changes as conflicts as long as the game is still in respeccing mode and the changes have not been confirmed."
	L.CSPS_Help_Oversection5 = "Champion-\npoints"
	L.CSPS_Help_Head5 = "Champion points in general"
	L.CSPS_Help_Sect5 = "You can save your champion points together with your skills and attributes. Alternatively you have the option to create separate champion profiles.\n1. Click on one of the three buttons in the top right corner, depending on the champion discipline you want to save (|t28:28:esoui/art/champion/champion_points_magicka_icon-hud-32.dds|t, |t28:28:esoui/art/champion/champion_points_health_icon-hud-32.dds|t, |t28:28:esoui/art/champion/champion_points_stamina_icon-hud-32.dds|t).\n2. Choose whether you want to save your champion points just for the current character or for the whole account or whether the profile should contain the whole champion discipline or just the active champion bar.\n3. Instead of creating your own profiles you can also load presets that are included in the addon." 
	L.CSPS_Help_Head6 = "Champion bar automation" 
	L.CSPS_Help_Sect6 = "1. First create profiles for your champion bars (read 'Champion points in general' for more information).\n2. Click on 'Options'. (|t28:28:esoui/art/skillsadvisor/advisor_tabicon_settings_up.dds|t)\n3. Click on 'Manage champion bars'.\n4. Use the arrows at the top |t28:28:esoui/art/buttons/large_leftarrow_up.dds|t und |t28:28:esoui/art/buttons/large_rightarrow_up.dds|t to choose a group (there are 20 groups to fill with profiles). Each group can be assigned a key bind via the control settings.\n5. The selected champion bars can now be loaded and applied via the defined keybind or via one of the automatization options explained in the following sections."
	L.CSPS_Help_Head7 = "Bind to locations"
	L.CSPS_Help_Sect7 = "In the champion bar manager you can choose if a group of champion bars should be applied once you enter a certain location, e.g. a specific trial or arena.\n	1. Click on 'Location'.\n  2. Choose the location, where the current group should be applied automatically, e.g. 'Sunspire'. \n 3. Click on 'Apply'.\nNow the addon will load the selected profiles everytime you enter sunspire."
	L.CSPS_Help_Head8 = "Dressing Room/Alpha Gear"
	L.CSPS_Help_Sect8 = "You also can bind the champion bar profiles to Dressing Room or Alpha Gear sets using the champion bar manager.\n1. Click on 'Dressing Room' or 'Alpha Gear'.\n2. Choose an gear/skill set to which you want to bind your champion bar profile.\n3. Click 'Apply'.\nNow everytime you equip the selected gear/skill set via Dressing Room or Alpha Gear the bound champion bar will also be slotted."
	L.CSPS_Help_Head9 = "Custom CP icons"
	L.CSPS_Help_Sect9 = "To make the champion slots easier to distinguish, the addon can use different icons for each slottable skill. Click on 'Options' (top right corner, |t28:28:esoui/art/skillsadvisor/advisor_tabicon_settings_up.dds|t) and activate the checkbox 'Custom CP icons'."
	L.CSPS_Help_Head10 = "Separate champion bar"
	L.CSPS_Help_Sect10 = "The addon can show your slotted champion skills in a separate bar as part of the in-game overlay, to help you keep track of which ones are currently active.  Click on 'Options' (top right corner, |t28:28:esoui/art/skillsadvisor/advisor_tabicon_settings_up.dds|t) and activate the checkbox 'Separate CP bar'. Here you can also choose wether the slots should be displayed all in one row (1x12), in three rows (3x4) or if only the skills from the craft tree should be shown (1x4)."
	L.CSPS_Help_Oversection11 = "Import/\nExport"
	L.CSPS_Help_Head11 = "Import/Export in general"
	L.CSPS_Help_Sect11 = "1. Click on 'Options'. (|t28:28:esoui/art/skillsadvisor/advisor_tabicon_settings_up.dds|t)\n2. Click on 'Import/Export'. The import/export window opens.\n3. Use the dropdown menu in the top-right corner to choose the data and format you want to import and/or export.\n4. Depending on the chosen format you now have different options.\n5. To import data you first have to copy it to the clipboard and then paste it to the import textfield (Ctrl+V)."
	L.CSPS_Help_Head12 = "Text-based champion point import (1/3)"
	L.CSPS_Help_Sect12 = "1. For this option, first choose which champion discipline you wish to import.\n2. The import text should contain the (English) names of champion skills and the corresponding values as numbers.\n3. The standard format is a number for the value, followed by the name of the skill (e.g. '10 Tireless Discipline' or '(10) → Tireless Discipline'). You can switch this order by clicking on the checkbox at the bottom of the page. Please note that the text should not contain any numbers beside the actual champion points (if you are importing from AlcastHQ the text might contain CP-ranges like '0-120' - click on the 'Clean-up' button in the bottom right corner to eliminate those)."
	L.CSPS_Help_Head13 = "Text-based champion point import (2/3)"
	L.CSPS_Help_Sect13 = "4. If the text contains slottable champion skills the addon will apply them starting from the top. If you want only certain skills to be slotted, mark them in the text with the additional keyword 'slot' (has to be placed next to the name, not next to the value).\n5. If the addon doesn't recognize one or more skill names, you have the possibility to choose them manually from the list. The process won't be completed until all values have either been assigned or discarded."
	L.CSPS_Help_Head14 = "Text-based champion point import (3/3)"
	L.CSPS_Help_Sect14 = "If your text contains multiple values for the same champion skill, only the last value will be imported. Hold shift while clicking the import button to sum up those values instead.\nUse rightclick to create a dynamic profile, additionally hold Ctrl to make it accountwide. Champion points saved in a dynamic profile will be applied from top to bottom until the maximum number of champion points currently available is reached."
	L.CSPS_Help_Head15 = "Step by step - import from AlcastHQ or JustLootIt"
	L.CSPS_Help_Sect15 = "1. Click on the blue, red or green CP icon at the top right corner (depending on which CP color you wish to import).\n2. Click on 'Import from text' (Ctrl+V).\n3. Paste the text from the website to the import-textfield.\n4. Make sure that the word 'slot' is only behind skills you actually want to slot.\n5. Click on 'Clean-up text' at the bottom right.\n6. Check the 'Reverse order' box (because both AlcastHQ and JustLootIt list the name before the value).\n7. Click on 'Import Text'.\n8. The points are now loaded into the addon. You can now either save them to a new profile by clicking on 'Custom (Account)' or 'Custom (Char)' and then on the plus button beneath those buttons, or apply them by clicking on the apply button below the CP profile section."
	
	-- Dialogs
	L.CSPS_MSG_ConfirmSave = "Really save the shown data as profile '<<1>>'? This will overwrite existing data.<<2>>"
	L.CSPS_MSG_ConfirmApply = "Available skill points: %s\nActually needed skill points: %s\n\nConflicts: %s\nNot yet unlocked: %s\nAlready on another morph: %s\nRank already higher: %s\nMorph/rank not yet unlocked: %s\n\nApply these skills?"
	L.CSPS_MSG_ConfirmApplyTitle = "CSPS - Skill points"
	L.CSPS_MSG_ConfirmAttrTitle = "CSPS - Attribute points"
	L.CSPS_MSG_ConfirmAttr = "Needed attribute points: <<1>>\nAvailable attribute points: <<2>>\nApply these attribute points?"
	L.CSPS_MSG_ConfirmAttr1 = "Can't apply attribute points; not enough points available. Please reset your old attribute points first."
	L.CSPS_MSG_ConfirmAttr2 = "Can't apply attribute points; at least one attribute is already set higher then the intended value. Please reset your old attribute points first."	
	L.CSPS_MSG_RenameProfile = "Choose a new name for profile '<<1>>':<<2>>"
	L.CSPS_MSG_DeleteProfile = "Really delete profile '<<1>>'?<<2>><<3>>"
	L.CSPS_MSG_DeleteProfileStan =  "The standard profile will be loaded instead."
	L.CSPS_MSG__ChangeProfile = "Profile '<<1>>' might contain unsaved changes. Do you really want to load profile '<<2>>'?<<3>>"
	L.CSPS_MSG_DeleteSkillType = "Do you really want to remove all skills in '<<1>>' from your profile?" -- <<1>> can either be a skill type or a skill line 
	L.CSPS_MSG_CpPurchTitle = "Apply champion points..."
	L.CSPS_MSG_CpPurchChosen = "Required points: "
	L.CSPS_MSG_CpPurchCost = "Costs: <<1>>|t28:28:esoui/art/loot/icon_goldcoin_pressed.dds|t" -- the cost and a coin-icon
	L.CSPS_MSG_CpPurchNow = "Do you want to apply your selected champion points now?"
	L.CSPS_MSG_CpPurchFailed = "Failed to apply champion points."
	L.CSPS_MSG_CpPurchSuccess = "Champion points succesfully applied."
	L.CSPS_MSG_CpPointsMissing = "You don't have enough champion points - remove points and try again."
	L.CSPS_MSG_Unslotted = "The following slottable skills couldn't be slotted:"
	L.CSPS_MSG_NoCPProfiles = "\n\n|cff7723WARNING!|r\nThis is not the best way to save champion profiles! If you want to save a profile for champion points only, use the three buttons in the top right corner to open the champion profile section. There you will find separate buttons for creating and saving profiles. (|t28:28:esoui/art/champion/champion_points_magicka_icon-hud-32.dds|t, |t28:28:esoui/art/champion/champion_points_health_icon-hud-32.dds|t, |t28:28:esoui/art/champion/champion_points_stamina_icon-hud-32.dds|t)"
	L.CSPS_MSG_CPPaths = "The cheapest paths to unlock '<<C:1>>':\n\n<<2>>"
	L.CSPS_MSG_CPPathOpt = "|c<<1>>Option <<2>> (<<3>>)|r:" -- 1 color 2 number 3 points
	L.CSPS_MSG_ExpTextLang = "If the current game language isn't English, you won't be able to import this list later. Do you wish to use normalized import-friendly skill names instead?"
	
	--	Errorcodes
	L.CSPS_ErrorNumber1 = "The skill has already been learned."
	L.CSPS_ErrorNumber2 = "The skill is already on another morph. Please reset your skills/morphs before trying to apply new ones."
	L.CSPS_ErrorNumber3 = "The current rank of this skill is already higher then the one you are trying to apply."
	L.CSPS_LoadingError = "Please check skill: <<C:1>>"
	
	-- Options
	L.CSPS_ShowHb = "Show hotbar"
	L.CSPS_CPAutoOpen = "Open with CP window"
	L.CSPS_CPCustomBar = "Separate CP bar"
	L.CSPS_CPCustomIcons = "Custom CP icons"
	L.CSPS_CPCustomBarLayout = "Layout"
	L.CSPS_ArmoryAutoOpen = "Open with armory"
	L.CSPS_Tooltip_ArmoryAutoOpen = "Check this box, if the addon should be shown every time you use the armory."
	L.CSPS_SaveSpecificGear = "Save specific gear items"
	L.CSPS_Tooltip_SaveSpecificGear = "Saves the specific item you are wearing instead of the item data. Saved Variables will need a little more space and it will be overwritten for items you are editing inside the addon. This function will make sure to equip the exact same item you were wearing when saving your build. Try to use this option if you encounter problems finding your saved gear."
	L.CSPS_BtnApplyAll = "Apply everything"
	L.CSPS_ShowBtnApplyAll = "Display 'apply everything' button"
	L.CSPS_ShowDateInProfileName = "Show last modified in profile name"
	L.CSPS_AcceptedLevelDifference = "Accepted level difference"
	L.CSPS_AcceptedLevelDifferenceTooltip = "CSPS will only find and equip gear if the difference between your char's and the item's level is less than the selected value."
	L.CSPS_RequiresLibSets = "This function requires LibSets to be installed and activated."
	
	-- Presets
	L.CSPS_MSG_SwitchCP = "Invest points into |c<<1>>'<<2>>'|r instead of one of the other slottables whenever you might profit from it."
	L.CSPS_MSG_SituationalCP = "Consider replacing the slottables by one of the following skills depending on the situation:"
	L.CSPS_CPP_Tank = "Tank"
	
	-- Import/Export
	L.CSPS_ImpEx_BtnImpLink = "Import link"
	L.CSPS_ImpEx_BtnImpText = "Import text"
	L.CSPS_ImpEx_BtnExpLink = "Generate link"
	L.CSPS_ImpEx_BtnExpText = "Generate text"
	L.CSPS_ImpEx_Standard = "You can either paste a link (Ctrl+V) from eso-skillfactory.com to import a build or you can click on 'Generate link' to generate a link for your current selected build to copy (Ctrl+C) and export into your browser and view on eso-skillfactory.com."
	L.CSPS_ImpEx_CpAsText = "You can paste a CP setup in text form to this field  (Ctrl+V). The standard format is a number for each value, followed by the name of the skill. If the text you want to apply uses a different order, click the reverse-order-checkbox at the bottom. If the text contains numbers for the CP-ranges (like on AlcastHQ or JustLootIt), click on the 'Clean-up' button at the bottom to remove them. Then click on 'Import text'. As long as all the CP's names are written fully and correctly, the addon will then automatically fill them into the table for you to review and apply."
	L.CSPS_ImpEx_BtnImpTT = "First paste (Ctrl+V) a link into the field below."
	L.CSPS_ImpEx_BtnImpTTCP = "First paste (Ctrl+V) a text into the field below.\nHold Ctrl to generate code for a preset.\nUse rightclick to create a dynamic profile, additionally hold Ctrl to make it accountwide.\nIf you press Shift, multiple entries for the same CP skill will be summed up instead of replaced."
	L.CSPS_ImpEx_BtnExpTT = "Generate a link from your current displayed build."
	L.CSPS_ImpEx_NoData = "No data found. First load data for your character before you attempt to generate a link."
	L.CSPS_ImpEx_ErrHb = "Error on import for hotbar <<1>>."
	L.CSPS_ImpEx_ErrSk = "Skill could not be mapped: <<1>>."
	L.CSPS_ImpExp_TextSk = "Text export: Skills"
	L.CSPS_ImpExp_TextOd = "Text export: Other data"
	L.CSPS_ImpEx_HbTxt = "Hotbar"
	L.CSPS_ImpEx_CsvCP = "Comma separated CP list"
	L.CSPS_ImpEx_TxtCP2_1 = "CP |cA6D852(green, from text)|r" 
	L.CSPS_ImpEx_TxtCP2_2 = "CP |c5CBDE7(blue, from text)|r" 
	L.CSPS_ImpEx_TxtCP2_3 = "CP |cDE6531(red, from text)|r"
	L.CSPS_ImpExp_TxtOrder1 = "Value → Name(/Slot)"
	L.CSPS_ImpExp_TxtOrder2 = "Name(/Slot)→Value"
	L.CSPS_ImpExp_TxtOrder3 = "Name→Value(→Slot)"
	L.CSPS_ImpEx_CapLabel = "Stop import when number of spendable points is reached"
	L.CSPS_ImpExp_CleanUp = "Clean-up the text"
	L.CSPS_ImpExp_Transfer = "Transfer..."
	L.CSPS_ImpExp_TransferLoad = "Load"
	L.CSPS_ImpExp_TransConfirm = "|cDE6531Do you really wish to transfer all bindings from <<1>> to <<2>>? All current bindings will be overwritten. This process is irreversible.|r"
	L.CSPS_ImpExp_Transfer_Server = "Server"
	L.CSPS_ImpExp_Transfer_Profiles = "Profile..."
	L.CSPS_ImpExp_Transfer_CPP = "Champion profile..."
	L.CSPS_ImpExp_Transfer_CPHb = "Champion bar..."
	L.CSPS_ImpExp_Transfer_CopyReplace = "Transfer all hotbar profiles and bindings (replace current profiles)"
	L.CSPS_ImpExp_Transfer_CopyAdd = "Transfer all hotbar profiles and bindings (keep current profiles)"
	
	L.CSPS_Tooltip_Transfer_CopyReplace = "|cDE6531All bindings and hotbar profiles currently set  for this char will be overwritten.|r"
	L.CSPS_Tooltip_Transfer_CopyAdd = "Transfer hotbar profiles but keep existing ones.\n|cDE6531All bindings currently set for this char will be overwritten.|r"
	
	L.CSPS_CPImp_Success = "Successfully mapped skills:"
	L.CSPS_CPImp_Unmapped = "Not yet assigned skills:"
	L.CSPS_CPImp_BtnApply = "Apply mapping"
	L.CSPS_CPImp_BtnDiscard = "Discard"
	L.CSPS_CPImp_BtnDiscardAll = "Discard all"
	L.CSPS_CPImp_New = "|c<<1>> <<2>>/<<3>> Mapping <<4>> points to: <<C:5>>|r"
	L.CSPS_CPImp_Note = "Click on a skill in the list below to manually map it. Please note that the mapping will only be applied once all skills are either mapped or discarded."
	L.CSPS_CPImp_NoMatch = "Couldn't find any matching data."
	

	
for stringId, stringValue in pairs(L) do
	ZO_CreateStringId(stringId, stringValue)
end