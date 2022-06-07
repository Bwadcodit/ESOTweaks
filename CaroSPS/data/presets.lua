-- This file contains all presets found in the addon. The numbers for the presets have no meaning, but have to be in consecutive order and have to be unambiguous. 
-- The name doesn't have to contain the source and the role as they appear in separate columns.
-- The roles are numbered: 1 = DD (unspecific), 2 = Tank, (3 = undefined), 4 = Heal, 5 = Magicka DD, 6 = Stamina DD, 7 = Not role-specific
-- Disciplines: 1 = Craft, 2 = Warfare, 3 = Fitness
-- BasestatsToFill: Skills in this category will be filled with remaining points in the end
-- Slotted: The four skills that should be slotted if available.
-- switch = number If this field is present, a message will be displayed promting to switch to a specific skill.
-- situational = {} If this list contains entries, the user will get a message with recommended situational skills.

CSPSCPPresets = {
	[1] = {
		name = "Tank", 			-- Warfare
		website = "thetankclub.com",
		updated = {03, 10, 2021},
		points = "(dynamic)",
		discipline = 2,
		role = 2,
		source = "The Tank Club",
		preset = {
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
			{20, 40}, {11, 40},	{10, 40}, {22, 30}, {21, 30},
		},
		basestatsToFill = {},
		slotted = {136, 133, 134, 159},
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
		preset = {
			{11, 10}, {31, 50}, {12, 50}, {10, 20},
			{264, 50}, {25, 50}, {11, 20}, {99, 20},
			{17, 20},{21, 30}, {17, 40}, {20, 10},
			{14, 20}, {18, 40}, {6, 20}, {22, 30}, 
			{15, 20}, {16, 20}, {20, 20}, {108, 20},
			{23, 50}, {27, 50}, 
		},
		basestatsToFill = {},
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
		preset = {
			{11, 10}, {31, 50}, {12, 50}, {10, 20},
			{264, 50}, {25, 50}, {11, 20}, {6, 20},
			{18, 20}, {22, 30}, {18, 40}, {20, 10},
			{14, 20}, {17, 40}, {99, 20}, {21, 30},
			{15, 20}, {16, 20}, {20, 20}, {108, 20},
			{23, 50}, {27, 50}, 
		},
		basestatsToFill = {},
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
		preset = {
			{99, 10}, {20, 10}, {14, 20}, {11, 10},
			{31, 50}, {12, 50}, {10, 20}, {264, 50},
			{25, 50}, {11, 20}, {99, 20}, {17, 20},
			{21, 30}, {17, 40}, {15, 20}, {16, 20},
			{18, 40}, {6, 20}, {22, 30}, {20, 20},
			{108, 20}, {23, 50}, {27, 50}, 
		},
		basestatsToFill = {},
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
		preset = {
			{6, 10}, {20, 10}, {14, 20}, {11, 10},
			{31, 50}, {12, 50}, {10, 20}, {264, 50},
			{25, 50}, {11, 20}, {6, 20}, {18, 20},
			{22, 30}, {18, 40}, {15, 20}, {16, 20},
			{17, 40}, {99, 20}, {21, 30}, {20, 20},
			{108, 20}, {23, 50}, {27, 50}, 
		},
		basestatsToFill = {},
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
		basestatsToFill = {},
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
		preset = {
			{2, 50}, {35, 50}, {38, 10}, {42, 8}, 
			{113, 20}, {48, 50}, {34, 50}, {39, 10}, 
			{43, 30}, {37, 30}, {128, 20}, {42, 16}, 
			{39, 20}, {40, 30}, {50, 20}, {38, 20}, 
			{45, 10}, {58, 50}, {44, 6},  {53, 50}, {45, 30},
		},
		basestatsToFill = {},
		slotted = {2, 35, 34, 48},
	},
	[9] = {
		name = "Dummy Parsing",  -- Warfare mag
		website = "www.youtube.com/c/SkinnyCheeksGaming/",
		updated = {06, 01, 2021},
		points = "(dynamic)",
		discipline = 2,
		role = 5,
		source = "Skinny Cheeks",
		preset = {
			{11, 10}, {31, 50}, {12, 50}, {10, 10},
			{264, 50}, {25, 50}, {11, 20}, {99, 20},
			{17, 20}, {21, 30}, {17, 40}, {18, 40},
			{6, 20}, {22, 30}, {23, 50}, {27, 50}, 
		},
		basestatsToFill = {},
		slotted = {12, 25, 264, 31},
		situational = {23, 27},
	},
	[10] = {
		name = "Dummy Parsing",  -- Warfare stam
		website = "www.youtube.com/c/SkinnyCheeksGaming/",
		updated = {06, 01, 2021},
		points = "(dynamic)",
		discipline = 2,
		role = 6,
		source = "Skinny Cheeks",
			
		preset = {
			{11, 10}, {31, 50}, {12, 50}, {10, 20},
			{264, 50}, {25, 50}, {11, 20}, {6, 20},
			{18, 20}, {22, 30}, {18, 40}, {17, 40},
			{99, 20}, {21, 30}, {23, 50}, {27, 50}, 
		},
		basestatsToFill = {},
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
		preset = {
			{11, 10}, {31, 50}, {12, 50}, {10, 20},
			{264, 50}, {23, 50}, {11, 20}, {99, 20},
			{17, 20},{21, 30}, {17, 40}, {20, 10},
			{14, 20}, {18, 40}, {6, 20}, {22, 30}, 
			{15, 20}, {16, 20}, {20, 20}, {108, 20},
			{25, 50}, {27, 50}, 
		},
		basestatsToFill = {},
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
		preset = {
			{11, 10}, {31, 50}, {12, 50}, {10, 20},
			{264, 50}, {23, 50}, {11, 20}, {6, 20},
			{18, 20}, {22, 30}, {18, 40}, {20, 10},
			{14, 20}, {17, 40}, {99, 20}, {21, 30},
			{15, 20}, {16, 20}, {20, 20}, {108, 20},
			{25, 50}, {27, 50}, 
		},
		basestatsToFill = {},
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
		preset = {
			{11, 10}, {31, 50}, {12, 50}, {10, 20},
			{264, 50}, {27, 50}, {11, 20}, {99, 20},
			{17, 20},{21, 30}, {17, 40}, {20, 10},
			{14, 20}, {18, 40}, {6, 20}, {22, 30}, 
			{15, 20}, {16, 20}, {20, 20}, {108, 20},
			{23, 50}, {25, 50}, 
		},
		basestatsToFill = {},
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
		preset = {
			{11, 10}, {31, 50}, {12, 50}, {10, 20},
			{264, 50}, {27, 50}, {11, 20}, {6, 20},
			{18, 20}, {22, 30}, {18, 40}, {20, 10},
			{14, 20}, {17, 40}, {99, 20}, {21, 30},
			{15, 20}, {16, 20}, {20, 20}, {108, 20},
			{23, 50}, {25, 50},
		},
		basestatsToFill = {},
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
		basestatsToFill = {},
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
		basestatsToFill = {},
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
		basestatsToFill = {},
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
		basestatsToFill = {},
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
		basestatsToFill = {},
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
		basestatsToFill = {},
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
		basestatsToFill = {},
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
		basestatsToFill = {},
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
		basestatsToFill = {},
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
		preset = {
			{11, 10}, {12, 50}, {10, 20},
			{264, 50}, {25, 50}, {27, 50}, {11, 20}, {99, 20},
			{17, 20},{21, 30}, {17, 40}, {20, 10},
			{14, 20}, {18, 40}, {6, 20}, {22, 30}, 
			{15, 20}, {16, 20}, {20, 20}, {108, 20},
			{23, 50}, {31, 50},
		},
		basestatsToFill = {},
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
		preset = {
			{11, 10}, {12, 50}, {10, 20},
			{264, 50}, {25, 50}, {27, 50}, {11, 20}, {6, 20},
			{18, 20}, {22, 30}, {18, 40}, {20, 10},
			{14, 20}, {17, 40}, {99, 20}, {21, 30},
			{15, 20}, {16, 20}, {20, 20}, {108, 20},
			{23, 50}, {31, 50},
		},
		basestatsToFill = {},
		slotted = {12, 25, 264, 27},
		situational = {23, 31},
	},	
}