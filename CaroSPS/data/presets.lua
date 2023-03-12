--			CAROCHAMPIONPOINT

-- This file contains all presets found in the addon. The numbers for the presets have no meaning, but have to be in consecutive order and have to be unambiguous. 
-- The name doesn't have to contain the source and the role as they appear in separate columns.
-- The roles are numbered: 1 = DD (unspecific), 2 = Tank, (3 = undefined), 4 = Heal, 5 = Magicka DD, 6 = Stamina DD, 7 = Not role-specific
-- Disciplines: 1 = Craft, 2 = Warfare, 3 = Fitness
-- BasestatsToFill: Skills in this category will be filled with remaining points in the end
-- Slotted: The four skills that should be slotted if available.
-- switch = number If this field is present, a message will be displayed promting to switch to a specific skill.
-- situational = {} If this list contains entries, the user will get a message with recommended situational skills.
-- aoe, penetration, crit, aoe, offBalance, offBalanceUp: can be used to give recommendations for certain scenarios
		
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


	-- ORIGINAL PRESETS 5.0 --

	CSPS.CPPresets = {
	[1] = {
		name = "Tank", 			-- Warfare
		website = "thetankclub.com",
		updated = {11, 18, 2022},
		points = "(dynamic)",
		discipline = 2,
		role = 2,
		source = "The Tank Club",
		preset = {
			{6,10}, {20,10}, {14,20}, 
			{15,13}, {16,7}, {15,20}, 
			{6,20}, {16,20}, {265,10}, 
			{265,13}, {134,10}, {136,10}, {133,10}, 
			{265,27}, {136,20}, {133,20}, {265,30}, 
			{134,20}, {136,30}, {133,30}, {265,40}, 
			{134,30}, {136,40}, {133,33}, {265,50}, 
			{134,40}, {136,47}, {133,40}, {99,10}, 
			{134,50}, {136,50}, {133,50}, {99,20}, 
			{108,13}, {20,20}, {11,20}, {10,7}, {108,20}, 
			{10,10}, {17,30}, {17,40}, {18,23}, {21,17}, 
			{18,40}, {21,20}, {10,20}, {22,20}, {21,30}, 
			{22,30}, {159,50}, {263,50}, {33,50}, {161,50},
			{26,50}, {28,50}, {24,50}
			--[[
			{6, 10}, {20, 10}, {14, 33},
			{14, 40},	{15, 7},
			{16, 20}, {15, 20},
			{16, 33}, {15, 40},
			{16, 40}, {134, 10}, {136, 7}, {133, 10},
			{136, 10}, {159, 30}, {134, 20}, 	{136, 13},
			{159, 50}, {134, 40}, {136, 40}, {133, 30},
			{134, 50}, 	{136, 50}, 	{133, 43}, {99, 10},
			{6, 27}, {133, 50}, {99, 30}, {6, 40},
			{10, 10}, {18, 13}, {99, 40}, {17, 20},
			{18, 27}, {17, 40}, {18, 40}, {108, 40},
			{20, 40}, {11, 40},	{10, 40}, {22, 30}, {21, 30},]]--
		},
		 
		slotted = {136,265,134,133}, --{136, 133, 134, 159},
	},
	[2] = {
		name = "Tank",			-- Fitness
		website = "thetankclub.com",
		updated = {03, 10, 2021},
		points = "(dynamic)",
		discipline = 3,
		role = 2,
		source = "The Tank Club",
		preset = {
			{2, 10},{34, 10},{35, 46},
			{2, 15}, {35, 50},{39, 10},{43, 15},
			{2, 18},{43, 45},{2, 30}, {37, 15},
			{51, 40}, {2, 43}, {34, 20},
			{51, 50},{2, 50},	{34, 50}, {53, 10},
			{113, 20}, {128, 13}, {113, 40},{39, 30},
			{128, 40}, {53, 20}, {39, 40},
			{37, 18}, {53, 50}, {44, 6}, {37, 45},
			{44, 10}, {38, 30}, {44, 15}, {38, 40},
			{42, 32}, {40, 45}, {50, 40}, {49, 50},
			
		},
		basestatsToFill = {35,2,34},
		slotted = {51, 2, 34, 35},
	},
	[3] = {
		name = zo_strformat("Full DPS, <<C:1>>+<<C:2>>", GetChampionSkillName(31), GetChampionSkillName(25)),  -- Warfare mag
		website = "www.youtube.com/c/SkinnyCheeksGaming/",
		updated = {06, 01, 2021},
		points = "(dynamic)",
		discipline = 2,
		role = 5,
		source = "Skinny Cheeks",
		old = true,
		preset = {
			{11, 10}, {31, 50}, {12, 50}, {10, 20},
			{264, 50}, {25, 50}, {11, 20}, {99, 20},
			{17, 20},{21, 30}, {17, 40}, {20, 10},
			{14, 20}, {18, 40}, {6, 20}, {22, 30}, 
			{15, 20}, {16, 20}, {20, 20}, {108, 20},
			{23, 50}, {27, 50}, 
		},
		slotted = {12, 25, 264, 31},
		situational = {23, 27},
	},
	[4] = {
		name = zo_strformat("Full DPS, <<C:1>>+<<C:2>>", GetChampionSkillName(31), GetChampionSkillName(25)),  -- Warfare stam
		website = "www.youtube.com/c/SkinnyCheeksGaming/",
		updated = {06, 01, 2021},
		points = "(dynamic)",
		discipline = 2,
		role = 6,
		source = "Skinny Cheeks",
		old = true,
		preset = {
			{11, 10}, {31, 50}, {12, 50}, {10, 20},
			{264, 50}, {25, 50}, {11, 20}, {6, 20},
			{18, 20}, {22, 30}, {18, 40}, {20, 10},
			{14, 20}, {17, 40}, {99, 20}, {21, 30},
			{15, 20}, {16, 20}, {20, 20}, {108, 20},
			{23, 50}, {27, 50}, 
		},
		slotted = {12, 25, 264, 31},
		situational = {23, 27},
	},
	[5] = {
		name = "Balanced",  -- Warfare mag
		website = "www.youtube.com/c/SkinnyCheeksGaming/",
		updated = {05, 30, 2021},
		points = "(dynamic)", 
		discipline = 2,
		role = 5,
		source = "Skinny Cheeks",
		old = true,
		preset = {
			{99, 10}, {20, 10}, {14, 20}, {11, 10},
			{31, 50}, {12, 50}, {10, 20}, {264, 50},
			{25, 50}, {11, 20}, {99, 20}, {17, 20},
			{21, 30}, {17, 40}, {15, 20}, {16, 20},
			{18, 40}, {6, 20}, {22, 30}, {20, 20},
			{108, 20}, {23, 50}, {27, 50}, 
		},
		slotted = {12, 25, 264, 31},
		situational = {23, 27},
	},
	[6] = {
		name = "Balanced",  -- Warfare stam
		website = "www.youtube.com/c/SkinnyCheeksGaming/",
		updated = {05, 30, 2021},
		points = "(dynamic)",
		discipline = 2,
		role = 6,
		source = "Skinny Cheeks",
		old = true,
		preset = {
			{6, 10}, {20, 10}, {14, 20}, {11, 10},
			{31, 50}, {12, 50}, {10, 20}, {264, 50},
			{25, 50}, {11, 20}, {6, 20}, {18, 20},
			{22, 30}, {18, 40}, {15, 20}, {16, 20},
			{17, 40}, {99, 20}, {21, 30}, {20, 20},
			{108, 20}, {23, 50}, {27, 50}, 
		},
		slotted = {12, 25, 264, 31},
		situational = {23, 27},
	},
	[7] = {
		name = "Mag DD",  -- Fitness
		website = "www.youtube.com/c/SkinnyCheeksGaming/",
		updated = {06, 01, 2021},
		points = "(dynamic)",
		discipline = 3,
		role = 5,
		source = "Skinny Cheeks",
		preset = {
			{2, 50}, {35, 50}, {38, 10}, {42, 8}, 
			{113, 20}, {47, 50},  {34, 50}, {39, 10}, 
			{43, 30}, {37, 30}, {128, 20}, {42, 16}, 
			{39, 20}, {40, 30}, {50, 20}, {38, 20}, 
			{45, 10}, {58, 50}, {44, 6},  {53, 50}, {45, 30},
		},
		slotted = {2, 35, 34, 47},
	},
	[8] = {
		name = "Stam DD",  -- Fitness
		website = "www.youtube.com/c/SkinnyCheeksGaming/",
		updated = {06, 01, 2021},
		points = "(dynamic)",
		discipline = 3,
		role = 6,
		source = "Skinny Cheeks",
		old = true,
		preset = {
			{2, 50}, {35, 50}, {38, 10}, {42, 8}, 
			{113, 20}, {48, 50}, {34, 50}, {39, 10}, 
			{43, 30}, {37, 30}, {128, 20}, {42, 16}, 
			{39, 20}, {40, 30}, {50, 20}, {38, 20}, 
			{45, 10}, {58, 50}, {44, 6},  {53, 50}, {45, 30},
		},
		slotted = {2, 35, 34, 48},
	},
	[9] = {
		name = "Dummy Parsing",  -- Warfare mag
		website = "www.youtube.com/c/SkinnyCheeksGaming/",
		updated = {06, 01, 2021},
		points = "(dynamic)",
		old = true,
		discipline = 2,
		role = 5,
		source = "Skinny Cheeks",
		preset = {
			{11, 10}, {31, 50}, {12, 50}, {10, 10},
			{264, 50}, {25, 50}, {11, 20}, {99, 20},
			{17, 20}, {21, 30}, {17, 40}, {18, 40},
			{6, 20}, {22, 30}, {23, 50}, {27, 50}, 
		},
		slotted = {12, 25, 264, 31},
		situational = {23, 27},
	},
	[10] = {
		name = "Dummy Parsing",  -- Warfare stam
		website = "www.youtube.com/c/SkinnyCheeksGaming/",
		updated = {06, 01, 2021},
		points = "(dynamic)",
		old = true,
		discipline = 2,
		role = 6,
		source = "Skinny Cheeks",
			
		preset = {
			{11, 10}, {31, 50}, {12, 50}, {10, 20},
			{264, 50}, {25, 50}, {11, 20}, {6, 20},
			{18, 20}, {22, 30}, {18, 40}, {17, 40},
			{99, 20}, {21, 30}, {23, 50}, {27, 50}, 
		},
		slotted = {12, 25, 264, 31},
		situational = {23, 27},
	},
	[11] = {  -- Backstabber + Biting Aura
		name = zo_strformat("Full DPS, <<C:1>>+<<C:2>>", GetChampionSkillName(31), GetChampionSkillName(23)),
		website = "www.youtube.com/c/SkinnyCheeksGaming/",
		updated = {06, 01, 2021},
		points = "(dynamic)",
		discipline = 2,
		role = 5,
		source = "Skinny Cheeks",
		old = true,
		preset = {
			{11, 10}, {31, 50}, {12, 50}, {10, 20},
			{264, 50}, {23, 50}, {11, 20}, {99, 20},
			{17, 20},{21, 30}, {17, 40}, {20, 10},
			{14, 20}, {18, 40}, {6, 20}, {22, 30}, 
			{15, 20}, {16, 20}, {20, 20}, {108, 20},
			{25, 50}, {27, 50}, 
		},
		slotted = {12, 23, 264, 31},
		situational = {25, 27},
	},
	[12] = {
		name = zo_strformat("Full DPS, <<C:1>>+<<C:2>>", GetChampionSkillName(31), GetChampionSkillName(23)),
		website = "www.youtube.com/c/SkinnyCheeksGaming/",
		updated = {06, 01, 2021},
		points = "(dynamic)",
		discipline = 2,
		role = 6,
		source = "Skinny Cheeks",
		old = true,
		preset = {
			{11, 10}, {31, 50}, {12, 50}, {10, 20},
			{264, 50}, {23, 50}, {11, 20}, {6, 20},
			{18, 20}, {22, 30}, {18, 40}, {20, 10},
			{14, 20}, {17, 40}, {99, 20}, {21, 30},
			{15, 20}, {16, 20}, {20, 20}, {108, 20},
			{25, 50}, {27, 50}, 
		},
		slotted = {12, 23, 264, 31},
		situational = {25, 27},
	},
	[13] = { -- Full DPS, Backstabber + Thaumaturge Warfare
		name = zo_strformat("Full DPS, <<C:1>>+<<C:2>>", GetChampionSkillName(31), GetChampionSkillName(27)),
		website = "www.youtube.com/c/SkinnyCheeksGaming/",
		updated = {06, 01, 2021},
		points = "(dynamic)",
		discipline = 2,
		role = 5,
		source = "Skinny Cheeks",
		old = true,
		preset = {
			{11, 10}, {31, 50}, {12, 50}, {10, 20},
			{264, 50}, {27, 50}, {11, 20}, {99, 20},
			{17, 20},{21, 30}, {17, 40}, {20, 10},
			{14, 20}, {18, 40}, {6, 20}, {22, 30}, 
			{15, 20}, {16, 20}, {20, 20}, {108, 20},
			{23, 50}, {25, 50}, 
		},
		slotted = {12, 27, 264, 31},
		situational = {23, 25},
	},
	[14] = {
		name = zo_strformat("Full DPS, <<C:1>>+<<C:2>>", GetChampionSkillName(31), GetChampionSkillName(27)),
		website = "www.youtube.com/c/SkinnyCheeksGaming/",
		updated = {06, 01, 2021},
		points = "(dynamic)",
		discipline = 2,
		role = 6,
		source = "Skinny Cheeks",
		old = true,
		preset = {
			{11, 10}, {31, 50}, {12, 50}, {10, 20},
			{264, 50}, {27, 50}, {11, 20}, {6, 20},
			{18, 20}, {22, 30}, {18, 40}, {20, 10},
			{14, 20}, {17, 40}, {99, 20}, {21, 30},
			{15, 20}, {16, 20}, {20, 20}, {108, 20},
			{23, 50}, {25, 50},
		},
		slotted = {12, 27, 264, 31},
		situational = {23, 25},
	},
	[15] = {
		name = "Healer",
		website = "eso-u.com",
		updated = {04, 04, 2021},
		points = "(dynamic)",
		source = "ESO University",
		role = 4,
		discipline = 3,
		preset = {
			{34, 50}, {35, 50}, {2, 50}, {37, 15}, {51, 50},
			{38, 10}, {42, 8}, {113, 40}, {38, 40}, {42, 32},
			{37, 30}, {39, 10}, {43, 30}, {40, 8}, {37, 45},
			{128, 40}, 	{39, 40}, {43, 45}, {40, 45}, {53, 50},
			{44, 15}, {45, 10}, {58, 40}, {58, 125}, {47, 50}, 
			{46, 50}
		},
		slotted = {34, 35, 2, 51},
		situational = {47, 46},
	},
	[16] = {
		name = "Healer",
		website = "eso-u.com",
		updated = {04, 04, 2021},
		points = "(dynamic)",
		source = "ESO University",
		role = 4,
		discipline = 2,
		preset = {
			{99, 10}, {108, 40}, {24, 50}, {26, 50}, {28, 50},
			{9, 50}, {99, 40}, {20, 10}, {14, 10}, {11, 40},
			{10, 10}, {17, 40}, {10, 40}, {20, 40}, {16, 40},
			{15, 40}, {14, 40}, {6, 40}, {21, 30}, {18, 40},
			{22, 30},
		},
		slotted = {24, 9, 26, 28},
	},
	[17] = {
		name = "Jack of all Trades (Farming)",
		addInfo = GetString(CSPS_CPPDescr_JoaTFarming),
		updated = {04, 04, 2021},
		points = "(dynamic)",
		source = "@Orejana",
		role = 7,
		discipline = 1,
		preset = {
			{68, 10}, {76, 25}, {84, 50}, {83, 50}, {78, 75},
			{81, 50}, {91, 25}, {79, 50}, {75, 10}, {85, 30},
			{74, 50}, {1, 50}, {66, 50}, {77, 25}, {70, 75},
			{75, 50}, {71, 50}, {69, 50}, {90, 75}, {68, 30},
			{86, 75}, {88, 50}, {89, 25}, {65, 50}, {67, 40},
			{80, 75}, {92, 20},
		},
		slotted = {66, 85},
	},
	[18] = {
		name = "Jack of all Trades (Fishing)",
		addInfo = GetString(CSPS_CPPDescr_JoaTFishing),
		updated = {04, 04, 2021},
		points = "(dynamic)",
		source = "@Orejana",
		role = 7,
		discipline = 1,
		preset = {
			{69, 10}, {70, 15}, {75, 10}, {79, 50}, {78, 15},
			{81, 10}, {91, 25}, {88, 50}, {89, 25}, {85, 30},
			{66, 50}, {81, 50}, {78, 75}, {70, 75}, {69, 50},
			{74, 50}, {71, 50}, {1, 50}, {83, 50}, {84, 50},
			{90, 75}, {76, 25}, {68, 30}, {77, 25}, {75, 50},
			{86, 75}, {65, 50}, {67, 40}, {80, 75}, {92, 20},
		},
		slotted = {66, 85},
	},
	[19] = {
		name = "Jack of all Trades (Thieving)",
		addInfo = GetString(CSPS_CPPDescr_JoaTThieving),
		updated = {04, 04, 2021},
		points = "(dynamic)",
		source = "@Orejana",
		role = 7,
		discipline = 1,
		preset = {
			{68, 30}, {76, 25}, {77, 25}, {80, 75}, {90, 75},
			{67, 40}, {84, 50}, {65, 50}, {66, 50}, {74, 50},
			{71, 50}, {78, 15}, {81, 10}, {91, 25}, {79, 50},
			{81, 50}, {78, 75}, {75, 10}, {85, 30}, {70, 75},
			{1, 50}, {69, 50}, {83, 50}, {75, 50}, {86, 75},
			{89, 25}, {88, 50}, {92, 20},
		},
		slotted = {66, 85},
	},
	[20] = {
		name = "Combat focus",
		addInfo = GetString(CSPS_CPPDescr_CombatFocus),
		updated = {04, 04, 2021},
		points = "(dynamic)",
		source = "@Irniben",
		role = 7,
		discipline = 1,
		preset = {
			{66,20}, {69,10}, {70,15}, {75,10}, {85,10}, 
			{86,75}, {85,20}, {66,50}, {69,20}, {75,50}, {69,50}, 
			{85,30}, {79,50}, {70,45}, {74,50}, {71,20}, {70,75}, 
			{71,50}, {68,30}, {67,40}, {87,33}, {1,50}, {78,15}, 
			{81,10}, {91,25}, {92,100}, {78,75}, {81,50}, {65,50}, 
			{82,120}, {76,25}, {77,25}, {84,50}, {89,25},
		},
		slotted = {66, 85, 86, 79},
	},
	[21] = {
		name = "Crafter/Harvester",
		updated = {04, 04, 2021},
		points = "(dynamic)",
		source = "@Irniben",
		role = 7,
		discipline = 1,
		preset = {
			{74,10}, {71,10}, {72,15}, {83,50}, {78,15}, 
			{81,50}, {78,30}, {70,15}, {75,10}, {85,30}, 
			{66,50}, {78,45}, {74,30}, {79,50}, {74,50}, 
			{91,25}, {78,75}, {70,75}, {69,50}, {75,50}, 
			{86,75}, {68,30}, {67,40}, {1,50}, {92,100}, 
			{76,25}, {84,50}, {76,25}, {77,25}, {65,50}, 
			{82,120},
		},
		slotted = {66, 83, 78, 81},
	},
	[22] = {
		name = "Crafter (leveling)",
		updated = {04, 04, 2021},
		points = "(dynamic)",
		source = "@Irniben",
		role = 7,
		discipline = 1,
		preset = {
			{74,10}, {71,10}, {72,45}, {66,50}, {83,50}, 
			{78,15}, {81,50}, {74,30}, {78,30}, {70,15}, 
			{75,10}, {85,30}, {78,45}, {79,50}, {74,50}, 
			{91,25}, {78,75}, {70,75}, {69,50}, {75,50}, 
			{86,75}, {68,30}, {67,40}, {1,50}, {92,100}, 
			{76,25}, {84,50}, {76,25}, {77,25}, {65,50}, 
			{82,120},
		},
		slotted = {66, 83, 78, 81},
	},
	[23] = {
		name = "Allrounder",
		updated = {04, 04, 2021},
		points = "(dynamic)",
		source = "@Irniben",
		role = 7,
		discipline = 1,
		preset = {
			{66,20}, {69,10}, {70,15}, {75,10}, {85,10}, 
			{79,50}, {85,20}, {66,50}, {69,20}, {74,20}, 
			{85,30}, {74,50}, {78,15}, {81,10}, {91,25}, 
			{70,45}, {69,50}, {71,20}, {86,75}, {70,75}, 
			{75,50}, {71,50}, {68,30}, {67,40}, {87,33},
			{1,50}, {92,100}, {78,75}, {81,50}, {65,47}, 
			{76,25}, {77,25}, {84,50}, {89,25}, {82,120},
		},
		slotted = {66, 85, 79, 91},
	},
	[24] = {  -- deadly aim + thaumaturge
		name = zo_strformat("Full DPS, <<C:1>>+<<C:2>>", GetChampionSkillName(25), GetChampionSkillName(27)),
		website = "www.youtube.com/c/SkinnyCheeksGaming/",
		updated = {06, 01, 2021},
		points = "(dynamic)",
		discipline = 2,
		role = 5,
		source = "Skinny Cheeks",
		old = true,
		preset = {
			{11, 10}, {12, 50}, {10, 20},
			{264, 50}, {25, 50}, {27, 50}, {11, 20}, {99, 20},
			{17, 20},{21, 30}, {17, 40}, {20, 10},
			{14, 20}, {18, 40}, {6, 20}, {22, 30}, 
			{15, 20}, {16, 20}, {20, 20}, {108, 20},
			{23, 50}, {31, 50},
		},
		slotted = {12, 25, 264, 27},
		situational = {23, 31},
	},
	[25] = {
		name = zo_strformat("Full DPS, <<C:1>>+<<C:2>>", GetChampionSkillName(25), GetChampionSkillName(27)),
		website = "www.youtube.com/c/SkinnyCheeksGaming/",
		updated = {06, 01, 2021},
		points = "(dynamic)",
		discipline = 2,
		role = 6,
		source = "Skinny Cheeks",
		old = true,
		preset = {
			{11, 10}, {12, 50}, {10, 20},
			{264, 50}, {25, 50}, {27, 50}, {11, 20}, {6, 20},
			{18, 20}, {22, 30}, {18, 40}, {20, 10},
			{14, 20}, {17, 40}, {99, 20}, {21, 30},
			{15, 20}, {16, 20}, {20, 20}, {108, 20},
			{23, 50}, {31, 50},
		},
		slotted = {12, 25, 264, 27},
		situational = {23, 31},
	},	
	[26] = {
		name = zo_strformat("NB (<<C:1>>/<<C:2>>/<<C:3>>/<<C:4>>)", 
			GetChampionSkillName(25), GetChampionSkillName(264), GetChampionSkillName(8), GetChampionSkillName(27)),  -- Warfare mag
		website = "www.skinnycheeks.gg",
		updated = {11, 18, 2022},
		points = "(dynamic)",
		discipline = 2,
		role = 5,
		source = "Skinny Cheeks",
		preset = {
			{11, 10}, {10, 20}, 
			{25, 50}, {264, 50}, {8, 50}, {27, 50}, 
			{11, 20}, {99, 20}, {17, 20},{21, 30}, {17, 40}, {20, 10}, {14, 20}, {18, 40}, {6, 20}, {22, 30}, {15, 20}, {16, 20}, {20, 20}, {108, 20},
			{23, 50}, {276, 50}, {31, 50}, {12, 50}, {277, 50}, 
		},
		slotted = {25, 264, 8, 27},
		aoe = {23},
		penetration = {276},
		crit = {31, 12},
		offBalance = {277},
		offBalanceUp = 25,
	},
	[27] = {
		name = zo_strformat("NB (<<C:1>>/<<C:2>>/<<C:3>>/<<C:4>>)", 
			GetChampionSkillName(25), GetChampionSkillName(264), GetChampionSkillName(8), GetChampionSkillName(27)),  -- Warfare stam
		website = "www.skinnycheeks.gg",
		updated = {11, 18, 2022},
		points = "(dynamic)",
		discipline = 2,
		role = 6,
		source = "Skinny Cheeks",
		preset = {
			{11, 10}, {10, 20},
			{25, 50}, {264, 50}, {8, 50}, {27, 50}, 
			{11, 20}, {6, 20},	{18, 20}, {22, 30}, {18, 40}, {20, 10},	{14, 20}, {17, 40}, {99, 20}, {21, 30},	{15, 20}, {16, 20}, {20, 20}, {108, 20},
			{23, 50}, {276, 50}, {31, 50}, {12, 50}, {277, 50}, 
		},
		slotted = {25, 264, 8, 27},
		aoe = {23},
		penetration = {276},
		crit = {31, 12},
		offBalance = {277},
		offBalanceUp = 25,
	},
	[28] = {
		name = zo_strformat("NB Trial-Dummy (<<C:1>>/<<C:2>>/<<C:3>>/<<C:4>>)", 
			GetChampionSkillName(25), GetChampionSkillName(264), GetChampionSkillName(8), GetChampionSkillName(277)),  -- Warfare mag
		website = "www.skinnycheeks.gg",
		updated = {11, 18, 2022},
		points = "(dynamic)",
		discipline = 2,
		role = 5,
		source = "Skinny Cheeks",
		preset = {
			{11, 10}, {10, 20}, 
			{25, 50}, {264, 50}, {8, 50},  {277, 50}, 
			{11, 20}, {99, 20}, {17, 20},{21, 30}, {17, 40}, {20, 10}, {14, 20}, {18, 40}, {6, 20}, {22, 30}, {15, 20}, {16, 20}, {20, 20}, {108, 20},
			{23, 50}, {276, 50}, {31, 50}, {12, 50}, {27, 50},
		},
		slotted = {25, 264, 8, 277},
		situational = {27},
		aoe = {23},
		penetration = {276},
		crit = {31, 12},
	},
	[29] = {
		name = zo_strformat("NB Trial-Dummy (<<C:1>>/<<C:2>>/<<C:3>>/<<C:4>>)", 
			GetChampionSkillName(25), GetChampionSkillName(264), GetChampionSkillName(8), GetChampionSkillName(277)),  -- Warfare stam
		website = "www.skinnycheeks.gg",
		updated = {11, 18, 2022},
		points = "(dynamic)",
		discipline = 2,
		role = 6,
		source = "Skinny Cheeks",
		preset = {
			{11, 10}, {10, 20},
			{25, 50}, {264, 50}, {8, 50},  {277, 50}, 
			{11, 20}, {6, 20},	{18, 20}, {22, 30}, {18, 40}, {20, 10},	{14, 20}, {17, 40}, {99, 20}, {21, 30},	{15, 20}, {16, 20}, {20, 20}, {108, 20},
			{23, 50}, {276, 50}, {31, 50}, {12, 50}, {27, 50},
		},
		slotted = {25, 264, 8, 277},
		situational = {27},
		aoe = {23},
		penetration = {276},
		crit = {31, 12},
	},
	[30] = {
		name = zo_strformat("DK (<<C:1>>/<<C:2>>/<<C:3>>/<<C:4>>)", 
			GetChampionSkillName(25), GetChampionSkillName(8), GetChampionSkillName(27), GetChampionSkillName(264)),  -- Warfare mag
		website = "www.skinnycheeks.gg",
		updated = {11, 18, 2022},
		points = "(dynamic)",
		discipline = 2,
		role = 5,
		source = "Skinny Cheeks",
		preset = {
			{11, 10}, {10, 20}, 
			{25, 50}, {8, 50}, {27, 50}, {264, 50}, 
			{11, 20}, {99, 20}, {17, 20},{21, 30}, {17, 40}, {20, 10}, {14, 20}, {18, 40}, {6, 20}, {22, 30}, {15, 20}, {16, 20}, {20, 20}, {108, 20},
			{23, 50}, {276, 50}, {31, 50}, {12, 50}, {277, 50}, 
		},
		slotted = {25, 8, 27, 264},
		aoe = {23},
		penetration = {276},
		crit = {31, 12},
		offBalance = {277},
		offBalanceUp = 25,
	},
	[31] = {
		name = zo_strformat("DK (<<C:1>>/<<C:2>>/<<C:3>>/<<C:4>>)", 
			GetChampionSkillName(25), GetChampionSkillName(8), GetChampionSkillName(27), GetChampionSkillName(264)),  -- Warfare stam
		website = "www.skinnycheeks.gg",
		updated = {11, 18, 2022},
		points = "(dynamic)",
		discipline = 2,
		role = 6,
		source = "Skinny Cheeks",
		preset = {
			{11, 10}, {10, 20},
			{25, 50}, {8, 50}, {27, 50}, {264, 50}, 
			{11, 20}, {6, 20},	{18, 20}, {22, 30}, {18, 40}, {20, 10},	{14, 20}, {17, 40}, {99, 20}, {21, 30},	{15, 20}, {16, 20}, {20, 20}, {108, 20},
			{23, 50}, {276, 50}, {31, 50}, {12, 50}, {277, 50}, 
		},
		slotted = {25, 8, 27, 264},
		aoe = {23},
		penetration = {276},
		crit = {31, 12},
		offBalance = {277},
		offBalanceUp = 25,
	},
	[32] = {
		name = zo_strformat("Templar (<<C:1>>/<<C:2>>/<<C:3>>/<<C:4>>)", 
			GetChampionSkillName(25), GetChampionSkillName(27), GetChampionSkillName(8), GetChampionSkillName(264)),  -- Warfare mag
		website = "www.skinnycheeks.gg",
		updated = {11, 18, 2022},
		points = "(dynamic)",
		discipline = 2,
		role = 5,
		source = "Skinny Cheeks",
		preset = {
			{11, 10}, {10, 20}, 
			{25, 50}, {27, 50}, {8, 50}, {264, 50}, 
			{11, 20}, {99, 20}, {17, 20},{21, 30}, {17, 40}, {20, 10}, {14, 20}, {18, 40}, {6, 20}, {22, 30}, {15, 20}, {16, 20}, {20, 20}, {108, 20},
			{23, 50}, {276, 50}, {31, 50}, {12, 50}, {277, 50}, 
		},
		slotted = {25, 27, 8, 264},
		aoe = {23},
		penetration = {276},
		crit = {31, 12},
		offBalance = {277},
		offBalanceUp = 25,
	},
	[33] = {
		name = zo_strformat("Templar (<<C:1>>/<<C:2>>/<<C:3>>/<<C:4>>)", 
			GetChampionSkillName(25), GetChampionSkillName(27), GetChampionSkillName(8), GetChampionSkillName(264)), -- Warfare stam
		website = "www.skinnycheeks.gg",
		updated = {11, 18, 2022},
		points = "(dynamic)",
		discipline = 2,
		role = 6,
		source = "Skinny Cheeks",
		preset = {
			{11, 10}, {10, 20},
			{25, 50}, {27, 50}, {8, 50}, {264, 50}, 
			{11, 20}, {6, 20},	{18, 20}, {22, 30}, {18, 40}, {20, 10},	{14, 20}, {17, 40}, {99, 20}, {21, 30},	{15, 20}, {16, 20}, {20, 20}, {108, 20},
			{23, 50}, {276, 50}, {31, 50}, {12, 50}, {277, 50}, 
		},
		slotted = {25, 27, 8, 264},
		aoe = {23},
		penetration = {276},
		crit = {31, 12},
		offBalance = {277},
		offBalanceUp = 25,
	},	
	[34] = {
		name = zo_strformat("Necro (<<C:1>>/<<C:2>>/<<C:3>>/<<C:4>>)", 
			GetChampionSkillName(25), GetChampionSkillName(264), GetChampionSkillName(8), GetChampionSkillName(277)),   -- Warfare mag
		website = "www.skinnycheeks.gg",
		updated = {11, 18, 2022},
		points = "(dynamic)",
		discipline = 2,
		role = 5,
		source = "Skinny Cheeks",
		preset = {
			{11, 10}, {10, 20}, 
			{8, 50}, {27, 50}, {25, 50}, {264, 50}, 
			{11, 20}, {99, 20}, {17, 20},{21, 30}, {17, 40}, {20, 10}, {14, 20}, {18, 40}, {6, 20}, {22, 30}, {15, 20}, {16, 20}, {20, 20}, {108, 20},
			{23, 50}, {276, 50}, {31, 50}, {12, 50}, {277, 50}, 
		},
		slotted = {8, 27, 25, 264},
		aoe = {23},
		penetration = {276},
		crit = {31, 12},
		offBalance = {277},
		offBalanceUp = 30,
	},
	[35] = {
		name = zo_strformat("Necro (<<C:1>>/<<C:2>>/<<C:3>>/<<C:4>>)", 
			GetChampionSkillName(25), GetChampionSkillName(264), GetChampionSkillName(8), GetChampionSkillName(277)),  -- Warfare stam
		website = "www.skinnycheeks.gg",
		updated = {11, 18, 2022},
		points = "(dynamic)",
		discipline = 2,
		role = 6,
		source = "Skinny Cheeks",
		preset = {
			{11, 10}, {10, 20},
			{8, 50}, {27, 50}, {25, 50}, {264, 50}, 
			{11, 20}, {6, 20},	{18, 20}, {22, 30}, {18, 40}, {20, 10},	{14, 20}, {17, 40}, {99, 20}, {21, 30},	{15, 20}, {16, 20}, {20, 20}, {108, 20},
			{23, 50}, {276, 50}, {31, 50}, {12, 50}, {277, 50}, 
		},
		slotted = {8, 27, 25, 264},
		aoe = {23},
		penetration = {276},
		crit = {31, 12},
		offBalance = {277},
		offBalanceUp = 30,
	},
	[36] = {
		name = zo_strformat("Necro Trial-Dummy (<<C:1>>/<<C:2>>/<<C:3>>/<<C:4>>)", 
			GetChampionSkillName(8), GetChampionSkillName(27), GetChampionSkillName(25), GetChampionSkillName(277)),  -- Warfare mag
		website = "www.skinnycheeks.gg",
		updated = {11, 18, 2022},
		points = "(dynamic)",
		discipline = 2,
		role = 5,
		source = "Skinny Cheeks",
		preset = {
			{11, 10}, {10, 20}, 
			{8, 50}, {27, 50}, {25, 50}, {277, 50}, 
			{11, 20}, {99, 20}, {17, 20},{21, 30}, {17, 40}, {20, 10}, {14, 20}, {18, 40}, {6, 20}, {22, 30}, {15, 20}, {16, 20}, {20, 20}, {108, 20},
			{23, 50}, {276, 50}, {31, 50}, {12, 50}, {264, 50},
		},
		slotted = {8, 27, 25, 277},
		situational = {264},
		aoe = {23},
		penetration = {276},
		crit = {31, 12},
	},
	[37] = {
		name = zo_strformat("Necro Trial-Dummy (<<C:1>>/<<C:2>>/<<C:3>>/<<C:4>>)", 
			GetChampionSkillName(8), GetChampionSkillName(27), GetChampionSkillName(25), GetChampionSkillName(277)),  -- Warfare stam
		website = "www.skinnycheeks.gg",
		updated = {11, 18, 2022},
		points = "(dynamic)",
		discipline = 2,
		role = 6,
		source = "Skinny Cheeks",
		preset = {
			{11, 10}, {10, 20},
			{8, 50}, {27, 50}, {25, 50}, {277, 50}, 
			{11, 20}, {6, 20},	{18, 20}, {22, 30}, {18, 40}, {20, 10},	{14, 20}, {17, 40}, {99, 20}, {21, 30},	{15, 20}, {16, 20}, {20, 20}, {108, 20},
			{23, 50}, {276, 50}, {31, 50}, {12, 50}, {264, 50},
		},
		slotted = {8, 27, 25, 277},
		situational = {264},
		aoe = {23},
		penetration = {276},
		crit = {31, 12},
	},
	[38] = {
		name = zo_strformat("Warden (<<C:1>>/<<C:2>>/<<C:3>>/<<C:4>>)", 
			GetChampionSkillName(25), GetChampionSkillName(8), GetChampionSkillName(264), GetChampionSkillName(27)),  -- Warfare mag
		website = "www.skinnycheeks.gg",
		updated = {11, 18, 2022},
		points = "(dynamic)",
		discipline = 2,
		role = 5,
		source = "Skinny Cheeks",
		preset = {
			{11, 10}, {10, 20}, 
			{25, 50}, {8, 50}, {264, 50}, {27, 50}, 
			{11, 20}, {99, 20}, {17, 20},{21, 30}, {17, 40}, {20, 10}, {14, 20}, {18, 40}, {6, 20}, {22, 30}, {15, 20}, {16, 20}, {20, 20}, {108, 20},
			{23, 50}, {276, 50}, {31, 50}, {12, 50}, {277, 50}, 
		},
		slotted = {25, 8, 264, 27},
		aoe = {23},
		penetration = {276},
		crit = {31, 12},
		offBalance = {277},
		offBalanceUp = 28,
	},
	[39] = {
		name = zo_strformat("Warden (<<C:1>>/<<C:2>>/<<C:3>>/<<C:4>>)", 
			GetChampionSkillName(25), GetChampionSkillName(8), GetChampionSkillName(264), GetChampionSkillName(27)), -- Warfare stam
		website = "www.skinnycheeks.gg",
		updated = {11, 18, 2022},
		points = "(dynamic)",
		discipline = 2,
		role = 6,
		source = "Skinny Cheeks",
		preset = {
			{11, 10}, {10, 20},
			{25, 50}, {8, 50}, {264, 50}, {27, 50}, 
			{11, 20}, {6, 20},	{18, 20}, {22, 30}, {18, 40}, {20, 10},	{14, 20}, {17, 40}, {99, 20}, {21, 30},	{15, 20}, {16, 20}, {20, 20}, {108, 20},
			{23, 50}, {276, 50}, {31, 50}, {12, 50}, {277, 50}, 
		},
		slotted = {25, 8, 264, 27},
		aoe = {23},
		penetration = {276},
		crit = {31, 12},
		offBalance = {277},
		offBalanceUp = 28,
	},
	[40] = {
		name = zo_strformat("Sorc (<<C:1>>/<<C:2>>/<<C:3>>/<<C:4>>)", 
			GetChampionSkillName(25), GetChampionSkillName(264), GetChampionSkillName(8), GetChampionSkillName(27)),  -- Warfare mag
		website = "www.skinnycheeks.gg",
		updated = {11, 18, 2022},
		points = "(dynamic)",
		discipline = 2,
		role = 5,
		source = "Skinny Cheeks",
		preset = {
			{11, 10}, {10, 20}, 
			{25, 50}, {264, 50}, {8, 50}, {27, 50}, 
			{11, 20}, {99, 20}, {17, 20},{21, 30}, {17, 40}, {20, 10}, {14, 20}, {18, 40}, {6, 20}, {22, 30}, {15, 20}, {16, 20}, {20, 20}, {108, 20},
			{23, 50}, {276, 50}, {31, 50}, {12, 50}, {277, 50}, 
		},
		slotted = {25, 264, 8, 27},
		aoe = {23},
		penetration = {276},
		crit = {31, 12},
		offBalance = {277},
		offBalanceUp = 25,
	},
	[41] = {
		name = zo_strformat("Sorc (<<C:1>>/<<C:2>>/<<C:3>>/<<C:4>>)", 
			GetChampionSkillName(25), GetChampionSkillName(264), GetChampionSkillName(8), GetChampionSkillName(27)),  -- Warfare stam
		website = "www.skinnycheeks.gg",
		updated = {11, 18, 2022},
		points = "(dynamic)",
		discipline = 2,
		role = 6,
		source = "Skinny Cheeks",
		preset = {
			{11, 10}, {10, 20},
			{25, 50}, {264, 50}, {8, 50}, {27, 50}, 
			{11, 20}, {6, 20},	{18, 20}, {22, 30}, {18, 40}, {20, 10},	{14, 20}, {17, 40}, {99, 20}, {21, 30},	{15, 20}, {16, 20}, {20, 20}, {108, 20},
			{23, 50}, {276, 50}, {31, 50}, {12, 50}, {277, 50}, 
		},
		slotted = {25, 264, 8, 27},
		aoe = {23},
		penetration = {276},
		crit = {31, 12},
		offBalance = {277},
		offBalanceUp = 25,
	},	
	[42] = {
		name = zo_strformat("Sorc Trial-Dummy (<<C:1>>/<<C:2>>/<<C:3>>/<<C:4>>)", 
			GetChampionSkillName(25), GetChampionSkillName(264), GetChampionSkillName(8), GetChampionSkillName(277)),  -- Warfare mag
		website = "www.skinnycheeks.gg",
		updated = {11, 18, 2022},
		points = "(dynamic)",
		discipline = 2,
		role = 5,
		source = "Skinny Cheeks",
		preset = {
			{11, 10}, {10, 20}, 
			{25, 50}, {264, 50}, {8, 50}, {277, 50}, 
			{11, 20}, {99, 20}, {17, 20},{21, 30}, {17, 40}, {20, 10}, {14, 20}, {18, 40}, {6, 20}, {22, 30}, {15, 20}, {16, 20}, {20, 20}, {108, 20},
			{23, 50}, {276, 50}, {31, 50}, {12, 50}, {27, 50}, 
		},
		slotted = {25, 264, 8, 277},
		situational = {27},
		aoe = {23},
		penetration = {276},
		crit = {31, 12},
	},
	[43] = {
		name = zo_strformat("Sorc Trial-Dummy (<<C:1>>/<<C:2>>/<<C:3>>/<<C:4>>)", 
			GetChampionSkillName(25), GetChampionSkillName(264), GetChampionSkillName(8), GetChampionSkillName(277)),  -- Warfare stam
		website = "www.skinnycheeks.gg",
		updated = {11, 18, 2022},
		points = "(dynamic)",
		discipline = 2,
		role = 6,
		source = "Skinny Cheeks",
		preset = {
			{11, 10}, {10, 20},
			{25, 50}, {264, 50}, {8, 50}, {277, 50}, 
			{11, 20}, {6, 20},	{18, 20}, {22, 30}, {18, 40}, {20, 10},	{14, 20}, {17, 40}, {99, 20}, {21, 30},	{15, 20}, {16, 20}, {20, 20}, {108, 20},
			{23, 50}, {276, 50}, {31, 50}, {12, 50}, {27, 50}, 
		},
		slotted = {25, 264, 8, 277},
		situational = {27},
		aoe = {23},
		penetration = {276},
		crit = {31, 12},
	},
	[44] = {
		name = zo_strformat("Solo (<<C:1>>/<<C:2>>/<<C:3>>/<<C:4>>)", 
			GetChampionSkillName(276), GetChampionSkillName(12), GetChampionSkillName(25), GetChampionSkillName(8)),  -- Warfare mag
		website = "www.skinnycheeks.gg",
		updated = {11, 18, 2022},
		points = "(dynamic)",
		discipline = 2,
		role = 5,
		source = "Skinny Cheeks",
		preset = {
			{11, 10}, {10, 20}, 
			{276, 50}, {12, 50}, {25, 50}, {8, 50}, 
			{11, 20}, {99, 20}, {17, 20},{21, 30}, {17, 40}, {20, 10}, {14, 20}, {18, 40}, {6, 20}, {22, 30}, {15, 20}, {16, 20}, {20, 20}, {108, 20},
			{23, 50}, {31, 50}, {27, 50}, {264, 50}, {277, 50}, 
		},
		slotted = {276, 12, 25, 8},
		situational = {27, 264},
		aoe = {23},
		offBalance = {277},
		offBalanceUp = 25,
	},
	[45] = {
		name = zo_strformat("Solo (<<C:1>>/<<C:2>>/<<C:3>>/<<C:4>>)", 
			GetChampionSkillName(276), GetChampionSkillName(12), GetChampionSkillName(25), GetChampionSkillName(8)),  -- Warfare stam
		website = "www.skinnycheeks.gg",
		updated = {11, 18, 2022},
		points = "(dynamic)",
		discipline = 2,
		role = 6,
		source = "Skinny Cheeks",
		preset = {
			{11, 10}, {10, 20},
			{276, 50}, {12, 50}, {25, 50}, {8, 50}, 
			{11, 20}, {6, 20},	{18, 20}, {22, 30}, {18, 40}, {20, 10},	{14, 20}, {17, 40}, {99, 20}, {21, 30},	{15, 20}, {16, 20}, {20, 20}, {108, 20},
			{23, 50}, {31, 50}, {27, 50}, {264, 50}, {277, 50}, 
		},
		slotted = {276, 12, 25, 8},
		situational = {27, 264},
		aoe = {23},
		offBalance = {277},
		offBalanceUp = 25,
	},
}
--]=]
