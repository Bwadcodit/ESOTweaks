--			CAROCHAMPIONPOINT

-- This file contains all presets found in the addon. The numbers for the presets have no meaning, but have to be in consecutive order and have to be unambiguous. 
-- The name doesn't have to contain the source and the role as they appear in separate columns.
-- The roles are numbered: 1 = DD (unspecific), 2 = Tank, (3 = undefined), 4 = Heal, 5 = Magicka DD, 6 = Stamina DD, 7 = Not role-specific
-- Disciplines: 1 = Craft, 2 = Warfare, 3 = Fitness
-- BasestatsToFill: Skills in this category will be filled with remaining points in the end
-- Slotted: The four skills that should be slotted if available.
-- switch = number If this field is present, a message will be displayed promting to switch to a specific skill.
-- situational = {} If this list contains entries, the user will get a message with recommended situational skills.

CSPS.CPPresets = {

------------------------------------------------------------
------------------------ GREEN TREE ------------------------
------------------------------------------------------------

	-- STANDARD --
--[[
50 Steed's Blessing 
50 Gilded Fingers
50 Breakfall
15 Wanderer 1
10 Steadfast Enchantment 1
30 Rationer 
50 Treasure Hunter 
75 Liquid Efficiency
15 Master Gatherer
100 Gifted Rider 			445
30 Out of Sight
40 Fleet Phantom
50 Steadfast Enchantment 2
50 Fortune's Favor
33 Soul Reservoir
75 Wanderer 2
--]]
	[1] = {
		name = "Standard 445+",
		addInfo = "",
		updated = {11, 04, 2021},
		points = "(dynamic)",
		source = "@Xisel",
		role = 7,
		discipline = 1,
		preset = {
			{66, 50},	-- Steed's Blessing
			{74, 50},	-- Gilded Fingers
			{69, 50},	-- Breakfall
			{70, 15},	-- Wanderer 1
			{75, 10},	-- Steadfast Enchantment 1
			{85, 30},	-- Rationer
			{79, 50},	-- Treasure Hunter
			{86, 75},	-- Liquid Efficiency
			{78, 15},	-- Master Gatherer
			{92, 100},	-- Gifted Rider
			{68, 30},	-- Out of Sight
			{67, 40},	-- Fleet Phantom
			{75, 50},	-- Steadfast Enchantment 2
			{71, 50},	-- Fortune's Favor
			{87, 33},	-- Soul Reservoir
			{70, 75},	-- Wanderer 2
		},
		slotted = {66,92,86,79}, -- Steed's Blessing, Gifted Rider, Liquid Efficiency, Treasure Hunter
	},

	-- FARM -- 
--[[
50 Steed's Blessing
50 Gilded Fingers
50 Breakfall
15 Wanderer 1
10 Steadfast Enchantment 1
50 Treasure Hunter
15 Master Gatherer 1
50 Plentiful Harvest
100 Gifted Rider 
75 Master Gatherer 2		450
50 Fortune's Favor
30 Out of Sight
40 Fleet Phantom
75 Wanderer 2 				630
50 Steadfast Enchantment 2
33 Soul Reservoir
--]]
	[2] = {
		name = "Farming 310+",
		addInfo = "Prio harvesting, questing",
		updated = {11, 04, 2021},
		points = "(dynamic)",
		source = "@Xisel",
		role = 7,
		discipline = 1,
		preset = {
			{66, 50},	-- Steed's Blessing
			{74, 50},	-- Gilded Fingers
			{69, 50},	-- Breakfall
			{70, 15},	-- Wanderer 1
			{75, 10},	-- Steadfast Enchantment 1
			{79, 50},	-- Treasure Hunter
			{78, 15},	-- Master Gatherer 1
			{81, 50},	-- Plentiful Harvest
			{92, 100},	-- Gifted Rider 
			{78, 75},	-- Master Gatherer 2
			{71, 50},	-- Fortune's Favor
			{68, 30},	-- Out of Sight
			{67, 40},	-- Fleet Phantom
			{70, 75},	-- Wanderer 2
			{75, 50},	-- Steadfast Enchantment 2
			{87, 33},	-- Soul Reservoir
		},
		slotted = {66,92,81,79}, -- Steed's Blessing, Gifted Rider, Plentiful Harvest, Treasure Hunter
	},

	-- CRAFT --
--[[
50 Steed's Blessing
10 Gilded Fingers 1
10 Fortune's Favor 1
15 Wanderer 1
10 Steadfast Enchantment 1
50 Treasure Hunter
50 Meticulous Disassembly
75 Master Gatherer
50 Plentiful Harvest
50 Gilded Fingers 2
50 Fortune's Favor 2
50 Breakfall
100 Gifted Rider 			550
30 Out of Sight
40 Fleet Phantom
75 Wanderer 2 
50 Steadfast Enchantment 2
33 Soul Reservoir
--]]
	[3] = {
		name = "Craft 470+",
		addInfo = "Use the Treasure Hunter skill path to avoid Inspiration. Gifted Rider in slot 2.",
		updated = {17, 10, 2022},
		points = "(dynamic)",
		source = "@Xisel",
		role = 7,
		discipline = 1,
		preset = {
			{66, 50},	-- Steed's Blessing
			{74, 10},	-- Gilded Fingers 1
			{71, 10},	-- Fortune's Favor 1
			{70, 15},	-- Wanderer
			{75, 10},	-- Steadfast Enchantment
			{79, 50},	-- Treasure Hunter
			{83, 50},	-- Meticulous Disassembly
			{78, 75},	-- Master Gatherer
			{81, 50},	-- Plentiful Harvest
			{74, 50},	-- Gilded Fingers 2
			{71, 50},	-- Fortune's Favor 2
			{69, 50},	-- Breakfall
			{92, 100},	-- Gifted Rider
			{68, 30},	-- Out of Sight
			{67, 40},	-- Fleet Phantom
			{70, 75},	-- Wanderer 2
			{75, 50},	-- Steadfast Enchantment 2
			{87, 33},	-- Soul Reservoir
		},
		slotted = {66,92,81,83}, -- Steed's Blessing, Gifted Rider, Plentiful Harvest, Meticulous Disassembly
	},

	-- CRAFT INSPI --
--[[
50 Steed's Blessing
10 Gilded Fingers 1
10 Fortune's Favor 1
45 Inspiration Boost
50 Meticulous Disassembly
50 Treasure Hunter
75 Master Gatherer
50 Plentiful Harvest 
50 Gilded Fingers 2
50 Fortune's Favor 2
50 Breakfall
100 Gifted Rider 			570
30 Out of Sight
40 Fleet Phantom
75 Wanderer
50 Steadfast Enchantment
33 Soul Reservoir
--]]
	[4] = {
		name = "Craft (+Inspiration) 490+",
		addInfo = "Gifted Rider in slot 2.",
		updated = {17, 10, 2022},
		points = "(dynamic)",
		source = "@Xisel",
		role = 7,
		discipline = 1,
		preset = {
			{66, 50},	-- Steed's Blessing
			{74, 10},	-- Gilded Fingers 1
			{71, 10},	-- Fortune's Favor 1
			{72, 45},	-- Inspiration Boost
			{83, 50},	-- Meticulous Disassembly
			{79, 50},	-- Treasure Hunter
			{78, 75},	-- Master Gatherer
			{81, 50},	-- Plentiful Harvest
			{74, 50},	-- Gilded Fingers 2
			{71, 50},	-- Fortune's Favor 2
			{69, 50},	-- Breakfall
			{92, 100},	-- Gifted Rider
			{68, 30},	-- Out of Sight
			{67, 40},	-- Fleet Phantom
			{70, 75},	-- Wanderer
			{75, 50},	-- Steadfast Enchantment
			{87, 33},	-- Soul Reservoir
		},
		slotted = {66,92,81,83}, -- Steed's Blessing, Gifted Rider, Plentiful Harvest, Meticulous Disassembly
	},
}

--[=[	
		-- ARCHIVED PRESETS --


		-- STANDARD NO LIQUID EF --
--[[
50 Steed's Blessing 
50 Gilded Fingers
50 Breakfall
15 Wanderer
10 Steadfast Enchantment
30 Rationer 
50 Treasure Hunter 
15 Master Gatherer
100 Gifted Rider 
--]]
	[20] = {
		name = "Standard prio Gifted Rider 290-370",
		addInfo = "No Liquid Efficiency, Rationer in slot 3",
		updated = {11, 04, 2021},
		points = "(dynamic)",
		source = "@Xisel",
		role = 7,
		discipline = 1,
		preset = {
			{66, 50},	-- Steed's Blessing
			{74, 50},	-- Gilded Fingers
			{69, 50},	-- Breakfall
			{70, 15},	-- Wanderer
			{75, 10},	-- Steadfast Enchantment
			{85, 30},	-- Rationer
			{79, 50},	-- Treasure Hunter
			{78, 15},	-- Master Gatherer
			{92, 100},	-- Gifted Rider
		},
		basestatsToFill = {},
		slotted = {66,92,85,79}, -- Steed's Blessing, Gifted Rider, Rationer, Treasure Hunter
	},
--]=]