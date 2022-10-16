local GS = GetString
local LAM = LibAddonMenu2
	
function CSPS.setupLam()
	CSPS.savedVariables.settings.applyAllExclude = CSPS.savedVariables.settings.applyAllExclude or {}
	
	local panelData = {
		type = "panel",
		name = "Caro's Skill and Champion Point Saver",
		displayName =  "|c9e0911Caro|r's Skill and Champion Point Saver",
		author = "|c1d6dadIrniben|r",
		registerForRefresh = true,
    }
	
	
	local optionsData = {
		{
			type = "header",
			name = GS(SI_VIDEO_OPTIONS_INTERFACE),
			width = "full",
		},	
		{
			type = "checkbox",
			name = GS(CSPS_CPAutoOpen),
			width = "full",
			tooltip = GS(CSPS_Tooltip_CPAutoOpen),
			getFunc = function() return CSPS.savedVariables.settings.cpAutoOpen end,
			setFunc = function(value) 
					CSPS.savedVariables.settings.cpAutoOpen = value
					CSPS.toggleCPAutoOpen()
				end,
		},
		{
			type = "checkbox",
			name = GS(CSPS_ArmoryAutoOpen),
			width = "full",
			tooltip = GS(CSPS_Tooltip_ArmoryAutoOpen),
			getFunc = function() return CSPS.savedVariables.settings.armoryAutoOpen end,
			setFunc = function(value) 
					CSPS.savedVariables.settings.armoryAutoOpen = value
					CSPS.toggleArmoryAutoOpen()
				end,
		},
		{
			type = "checkbox",
			name = GS(CSPS_ShowDateInProfileName),
			width = "full",
			getFunc = function() return not CSPS.savedVariables.settings.suppressLastModified end,
			setFunc = function(value) 
					CSPS.savedVariables.settings.suppressLastModified = not value
					CSPS.UpdateProfileCombo()
				end,
		},
		{
			type = "header",
			name = GS(SI_STAT_GAMEPAD_CHAMPION_POINTS_LABEL),
			width = "full",
		},	
		{
			type = "checkbox",
			name = GS(CSPS_CPCustomIcons),
			width = "full",
			tooltip = GS(CSPS_Tooltip_CPCustomIcons),
			getFunc = function() return CSPS.savedVariables.settings.useCustomIcons end,
			setFunc = function(value) 
					CSPS.savedVariables.settings.useCustomIcons = value
					CSPS.toggleCPCustomIcons()
				end,
		},
		{
			type = "checkbox",
			name = GS(CSPS_CPCustomBar),
			width = "full",
			tooltip = GS(CSPS_Tooltip_CPCustomBar),
			getFunc = function() return CSPS.savedVariables.settings.cpCustomBar end,
			setFunc = function(value) 
					if not CSPS.savedVariables.settings.cpCustomBar or not value then
						CSPS.savedVariables.settings.cpCustomBar = value and 1 or false
						CSPS.toggleCPCustomBar()
					end
				end,
		},
		{
			type = "dropdown",
			name = GS(CSPS_CPCustomBarLayout),
			width = "full",
			choices = {"1x4", "3x4", "1x12"},
			choicesValues = {3,2,1},
			sort = "value-up",
			default = 3,
			disabled = function() return(not CSPS.savedVariables.settings.cpCustomBar) end,
			getFunc = function() return CSPS.savedVariables.settings.cpCustomBar or 1 end,
			setFunc = function(value) 
				CSPS.savedVariables.settings.cpCustomBar = value 
				CSPS.toggleCPCustomBar() 
			end,
		},
		{
			type = "header",
			name = GS(SI_GAMEPAD_DYEING_EQUIPMENT_HEADER),
			width = "full",
		},	
		{
			type = "slider",
			name = GS(CSPS_AcceptedLevelDifference),
			width = "full",
			tooltip = GS(CSPS_AcceptedLevelDifferenceTooltip),
			min = 0,
			max = 50,
			decimals = 0, 
			getFunc = function() return CSPS.savedVariables.settings.maxLevelDiff or 10 end,
			setFunc = function(value) 
					CSPS.savedVariables.settings.maxLevelDiff = value
					CSPS.getTreeControl():RefreshVisible()
				end,
			disabled = function() return not CSPS.doGear end,
		},
		{
			type = "checkbox",
			name = GS(CSPS_SaveSpecificGear),
			width = "full",
			tooltip = GS(CSPS_Tooltip_SaveSpecificGear),
			getFunc = function() return CSPS.savedVariables.settings.saveSpecificGear end,
			setFunc = function(value) 
					CSPS.savedVariables.settings.saveSpecificGear = value
				end,
			disabled = function() return not CSPS.doGear end,
		},
		{
			type = "checkbox",
			name = GS(CSPS_ShowGearMarkers),
			width = "full",
			tooltip = GS(CSPS_ShowGearMarkersTooltip),
			getFunc = function() return CSPS.savedVariables.settings.showGearMarkers end,
			setFunc = function(value) 
					CSPS.setGearMarkerOption(value)
				end,
			disabled = function() return not CSPS.doGear end,
		},
		{
			type = "checkbox",
			name = GS(CSPS_ShowGearMarkerDataBased),
			width = "full",
			tooltip = GS(CSPS_ShowGearMarkerDataBasedTooltip),
			getFunc = function() return CSPS.savedVariables.settings.showGearMarkerDataBased end,
			setFunc = function(value) 
					CSPS.setGearMarkerOptionData(value)
				end,
			disabled = function() return not (CSPS.doGear and CSPS.savedVariables.settings.showGearMarkers) end,
		},		
		{
			type = "submenu",
			name = GS(CSPS_BtnApplyAll),
			icon = "esoui/art/campaign/campaign_tabicon_summary_up.dds",
			controls = {
				{
					type = "checkbox",
					name = GS(CSPS_ShowBtnApplyAll),
					width = "full",
					getFunc = function() return CSPS.savedVariables.settings.showApplyAll end,
					setFunc = function(value) 
							CSPS.savedVariables.settings.showApplyAll = value
							CSPSWindowBtnApplyAll:SetHidden(not value)
						end,
				},
				
				{
					type = "divider",
					width = "full",
				},
				{
					type = "checkbox",
					name = GS(SI_CHARACTER_MENU_SKILLS),
					width = "full",
					getFunc = function() return not CSPS.savedVariables.settings.applyAllExclude.skills end,
					setFunc = function(value) 
							CSPS.savedVariables.settings.applyAllExclude.skills = not value
						end,
					disabled = function() return not CSPS.savedVariables.settings.showApplyAll end,
				},
				{
					type = "checkbox",
					name = GS(SI_CHARACTER_MENU_STATS),
					width = "full",
					getFunc = function() return not CSPS.savedVariables.settings.applyAllExclude.attr end,
					setFunc = function(value) 
							CSPS.savedVariables.settings.applyAllExclude.attr = not value
						end,
					disabled = function() return not CSPS.savedVariables.settings.showApplyAll end,
				},
				{
					type = "checkbox",
					name = GS(SI_STAT_GAMEPAD_CHAMPION_POINTS_LABEL),
					width = "full",
					getFunc = function() return not CSPS.savedVariables.settings.applyAllExclude.cp end,
					setFunc = function(value) 
							CSPS.savedVariables.settings.applyAllExclude.cp = not value
						end,
					disabled = function() return not CSPS.savedVariables.settings.showApplyAll end,
				},
				{
					type = "checkbox",
					name = GS(SI_INTERFACE_OPTIONS_ACTION_BAR),
					width = "full",
					getFunc = function() return not CSPS.savedVariables.settings.applyAllExclude.hb end,
					setFunc = function(value) 
							CSPS.savedVariables.settings.applyAllExclude.hb = not value
						end,
					disabled = function() return not CSPS.savedVariables.settings.showApplyAll end,
				},
				{
					type = "checkbox",
					name = GS(SI_GAMEPAD_DYEING_EQUIPMENT_HEADER),
					width = "full",
					getFunc = function() return not CSPS.savedVariables.settings.applyAllExclude.gear end,
					setFunc = function(value) 
							CSPS.savedVariables.settings.applyAllExclude.gear = not value
						end,
					disabled = function() return not CSPS.savedVariables.settings.showApplyAll or not CSPS.doGear end,
				},
				{
					type = "checkbox",
					name = GS(SI_HOTBARCATEGORY10),
					width = "full",
					getFunc = function() return not CSPS.savedVariables.settings.applyAllExclude.qs end,
					setFunc = function(value) 
							CSPS.savedVariables.settings.applyAllExclude.qs = not value
						end,
					disabled = function() return not CSPS.savedVariables.settings.showApplyAll end,
				},
			}
		},
	}
	
	if not LibSets then 
		for i, v in pairs(optionsData) do
			if v.name == GS(SI_GAMEPAD_DYEING_EQUIPMENT_HEADER) then
				table.insert(optionsData, i + 1, 
					{
						type = "description",
						text = CSPS.colors.orange:Colorize(GS(CSPS_RequiresLibSets))
					}
				)
				break
			end
		end
	end
	
	local cspsPanel = LAM:RegisterAddonPanel("cspsOptions", panelData)
	LAM:RegisterOptionControls("cspsOptions", optionsData)	
	CSPS.panel = cspsPanel
	--[[
	CALLBACK_MANAGER:RegisterCallback("LAM-PanelOpened", function(panel)
		if panel ~= cwsPanel then return end
			CarosWornSetsIndicator:SetHidden(false)
	end)

	CALLBACK_MANAGER:RegisterCallback("LAM-PanelClosed", function(panel)
		if panel ~= cwsPanel then return end
		CarosWornSetsIndicator:SetHidden(true)
	end)
	]]--
end

function CSPS.openLAM()
	LAM:OpenToPanel(CSPS.panel)
	CSPSWindowOptions:SetHidden(true)
end