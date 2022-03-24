--			CAROCHAMPIONPOINT

-- This file contains all presets found in the addon. The numbers for the presets have no meaning, but have to be in consecutive order and have to be unambiguous. 
-- The name doesn't have to contain the source and the role as they appear in separate columns.
-- The roles are numbered: 1 = DD (unspecific), 2 = Tank, (3 = undefined), 4 = Heal, 5 = Magicka DD, 6 = Stamina DD, 7 = Not role-specific
-- Disciplines: 1 = Craft, 2 = Warfare, 3 = Fitness
-- BasestatsToFill: Skills in this category will be filled with remaining points in the end
-- Slotted: The four skills that should be slotted if available.
-- switch = number If this field is present, a message will be displayed promting to switch to a specific skill.
-- situational = {} If this list contains entries, the user will get a message with recommended situational skills.

CSPSCPPresets = {

------------------------------------------------------------
------------------------- RED TREE -------------------------
------------------------------------------------------------

	-- HEALER --
--[[
50 Rejuvenation (slot)
50 Boundless Vitality (slot)
15 Tumbling 1
10 Mystic Tenacity 1
20 Hero's Vigor
10 Piercing Gaze 1
25 Tempered Soul 1
50 Spirit Mastery (slot)
16 Hasty
30 Tumbling 2
50 Fortified (slot)
20 Defiance					331
20 Sprinter
10 Tireless Guardian 1
30 Fortification
6 Nimble Protector
20 Tireless Guardian 2
50 Mystic Tenacity 2
50 Tempered Soul 2
30 Piercing Gaze 2
30 Savage Defense			
20 Bashing Brutality		542
--]]
	[1] = {
		name = "Healer (up to 542)",
		addInfo = "",
		updated = {11, 04, 2021},
		points = "(dynamic)",
		source = "@Xisel",
		role = 4,
		discipline = 3,
		preset = {
			{35, 50},	-- Rejuvenation (slot)
			{2, 50},	-- Boundless Vitality (slot)
			{37, 15},	-- Tumbling 1
			{53, 10},	-- Mystic Tenacity 1
			{113, 20},	-- Hero's Vigor
			{45, 10},	-- Piercing Gaze 1
			{58, 25},	-- Tempered Soul 1
			{56, 50},	-- Spirit Mastery (slot)
			{42, 16},	-- Hasty
			{37, 30},	-- Tumbling 2
			{34, 50},	-- Fortified (slot)
			{128, 20},	-- Defiance					331
			{38, 20},	-- Sprinter
			{39, 10},	-- Tireless Guardian 1
			{43, 30},	-- Fortification
			{44, 6},	-- Nimble Protector
			{39, 20},	-- Tireless Guardian 2
			{53, 50},	-- Mystic Tenacity 2
			{58, 50},	-- Tempered Soul 2
			{45, 30},	-- Piercing Gaze 2
			{40, 30},	-- Savage Defense			
			{50, 20},	-- Bashing Brutality		542
		},
		basestatsToFill = {},
		slotted = {35,2,56,34}, -- Rejuvenation, Boundless Vitality, Spirit Mastery, Fortified
	},

	-- TANK --
--[[
50 Rejuvenation (slot)
50 Boundless Vitality (slot)
20 Tireless Guardian
16 Hasty
30 Fortification
6 Nimble Protector
15 Tumbling 1
50 Expert Evasion (slot)
10 Defiance 1
20 Hero's Vigor				
50 Fortified (slot)			317
30 Tumbling 2
20 Defiance 2				
50 Mystic Tenacity
20 Sprinter
10 Piercing Gaze 1
50 Tempered Soul
30 Savage Defense
20 Bashing Brutality		
30 Piercing Gaze 2			542
--]]
	[2] = {
		name = "Tank (up to 502)",
		addInfo = "",
		updated = {11, 04, 2021},
		points = "(dynamic)",
		source = "@Xisel",
		role = 2,
		discipline = 3,
		preset = {
			{35, 50},	-- Rejuvenation (slot)
			{2, 50},	-- Boundless Vitality (slot)
			{39, 20},	-- Tireless Guardian
			{42, 16},	-- Hasty
			{43, 30},	-- Fortification
			{44, 6},	-- Nimble Protector
			{37, 15},	-- Tumbling 1
			{51, 50},	-- Expert Evasion (slot)
			{128, 10},	-- Defiance 1
			{113, 20},	-- Hero's Vigor				
			{34, 50},	-- Fortified (slot)			317
			{37, 30},	-- Tumbling 2
			{128, 20},	-- Defiance 2				
			{53, 50},	-- Mystic Tenacity
			{38, 20},	-- Sprinter
			{45, 10},	-- Piercing Gaze 1
			{58, 50},	-- Tempered Soul
			{40, 30},	-- Savage Defense
			{50, 20},	-- Bashing Brutality		
			{45, 30},	-- Piercing Gaze 2			542
		},
		basestatsToFill = {},
		slotted = {35,2,51,34}, -- Rejuvenation, Boundless Vitality, Expert Evasion, Fortified
	},

	-- MAGICKA --
--[[
50 Fortified (slot)
50 Boundless Vitality (slot)
30 Tumbling
20 Defiance
10 Mystic Tenacity 1
20 Hero’s Vigor
16 Hasty
50 Siphoning Spells (slot)
10 Shield Master
50 Bastion (slot)			306
20 Sprinter
20 Tireless Guardian
30 Fortification
6 Nimble Protector
50 Mystic Tenacity 2		422
50 Tempered Soul
30 Piercing Gaze
30 Savage Defense			
20 Bashing Brutality		552
--]]
	[3] = {
		name = "Magicka DPS (up to 552)",
		addInfo = "",
		updated = {11, 04, 2021},
		points = "(dynamic)",
		source = "@Xisel",
		role = 5,
		discipline = 3,
		preset = {
			{34, 50},	-- Fortified (slot)
			{2, 50},	-- Boundless Vitality (slot)
			{37, 30},	-- Tumbling
			{128, 20},	-- Defiance
			{53, 10},	-- Mystic Tenacity 1
			{113, 20},	-- Hero’s Vigor
			{42, 16},	-- Hasty
			{47, 50},	-- Siphoning Spells (slot)
			{63, 10},	-- Shield Master
			{46, 50},	-- Bastion (slot)			306
			{38, 20},	-- Sprinter
			{39, 20},	-- Tireless Guardian
			{43, 30},	-- Fortification
			{44, 6},	-- Nimble Protector
			{53, 50},	-- Mystic Tenacity 2		422
			{58, 50},	-- Tempered Soul
			{45, 30},	-- Piercing Gaze
			{40, 30},	-- Savage Defense			
			{50, 20},	-- Bashing Brutality		552
		},
		basestatsToFill = {},
		slotted = {34,2,47,46}, -- Fortified, Boundless Vitality, Siphoning Spells, Bastion
	},

	-- MAGICKA FARM --
--[[
50 Boundless Vitality (slot)
30 Tumbling
20 Defiance
10 Mystic Tenacity 1
20 Hero’s Vigor
16 Hasty
50 Celerity (slot)
50 Siphoning Spells (slot)
10 Shield Master
50 Bastion (slot)			306
20 Sprinter
20 Tireless Guardian
30 Fortification
6 Nimble Protector
50 Mystic Tenacity 2		422
50 Tempered Soul
30 Piercing Gaze
30 Savage Defense			
20 Bashing Brutality		552
--]]
	[4] = {
		name = "Magicka Farm (up to 552)",
		addInfo = "Replace Fortified with Celerity",
		updated = {11, 04, 2021},
		points = "(dynamic)",
		source = "@Xisel",
		role = 5,
		discipline = 3,
		preset = {
			{2, 50},	-- Boundless Vitality (slot)
			{37, 30},	-- Tumbling
			{128, 20},	-- Defiance
			{53, 10},	-- Mystic Tenacity 1
			{113, 20},	-- Hero’s Vigor
			{42, 16},	-- Hasty
			{270, 50},	-- Celerity (slot)
			{47, 50},	-- Siphoning Spells (slot)
			{63, 10},	-- Shield Master
			{46, 50},	-- Bastion (slot)			306
			{38, 20},	-- Sprinter
			{39, 20},	-- Tireless Guardian
			{43, 30},	-- Fortification
			{44, 6},	-- Nimble Protector
			{53, 50},	-- Mystic Tenacity 2		422
			{58, 50},	-- Tempered Soul
			{45, 30},	-- Piercing Gaze
			{40, 30},	-- Savage Defense			
			{50, 20},	-- Bashing Brutality		552
		},
		basestatsToFill = {},
		slotted = {270,2,47,46}, -- Celerity, Boundless Vitality, Siphoning Spells, Bastion
	},

-- MAGICKA PvP --
--[[
50 Boundless Vitality (slot)
30 Tumbling
20 Defiance
50 Mystic Tenacity
20 Hero’s Vigor
16 Hasty
50 Pain’s Refuge (slot)
50 Sustained by Suffering (slot)
50 Slippery (slot)			
20 Sprinter
20 Tireless Guardian
30 Fortification
6 Nimble Protector
30 Savage Defense			
20 Bashing Brutality		
30 Piercing Gaze
50 Tempered Soul
--]]
	[5] = {
		name = "Magicka PvP  (up to 552)",
		addInfo = "",
		updated = {22, 02, 2022},
		points = "(dynamic)",
		source = "@Xisel",
		role = 5,
		discipline = 3,
		preset = {
			{2, 50},	-- Boundless Vitality (slot)
			{37, 30},	-- Tumbling
			{128, 20},	-- Defiance
			{53, 50},	-- Mystic Tenacity
			{113, 20},	-- Hero’s Vigor
			{42, 16},	-- Hasty
			{275, 50},	-- Pain’s Refuge (slot)
			{273, 50},	-- Sustained by Suffering (slot)
			{52, 50},	-- Slippery (slot)			
			{38, 20},	-- Sprinter
			{39, 20},	-- Tireless Guardian
			{43, 30},	-- Fortification
			{44, 6},	-- Nimble Protector
			{40, 30},	-- Savage Defense			
			{50, 20},	-- Bashing Brutality		
			{45, 30},	-- Piercing Gaze
			{58, 50},	-- Tempered Soul 			552
		},
		basestatsToFill = {},
		slotted = {2,275,273,52}, -- Boundless Vitality, Pain’s Refuge, Sustained by Suffering, Slippery
	},

	-- STAMINA --
--[[
50 Fortified (slot)
50 Boundless Vitality (slot)
30 Tumbling
20 Defiance
10 Mystic Tenacity 1
20 Hero’s Vigor
16 Hasty
50 Bloody Renewal (slot)
10 Shield Master
50 Bastion (slot)			306
20 Sprinter
20 Tireless Guardian
30 Fortification
6 Nimble Protector
50 Mystic Tenacity 2		422
50 Tempered Soul
30 Piercing Gaze
30 Savage Defense			
20 Bashing Brutality		552
--]]
	[6] = {
		name = "Stamina DPS (up to 552)",
		addInfo = "",
		updated = {11, 04, 2021},
		points = "(dynamic)",
		source = "@Xisel",
		role = 6,
		discipline = 3,
		preset = {
			{34, 50},	-- Fortified (slot)
			{2, 50},	-- Boundless Vitality (slot)
			{37, 30},	-- Tumbling
			{128, 20},	-- Defiance
			{53, 10},	-- Mystic Tenacity 1
			{113, 20},	-- Hero’s Vigor
			{42, 16},	-- Hasty
			{48, 50},	-- Bloody Renewal (slot)
			{63, 10},	-- Shield Master
			{46, 50},	-- Bastion (slot)			306
			{38, 20},	-- Sprinter
			{39, 20},	-- Tireless Guardian
			{43, 30},	-- Fortification
			{44, 6},	-- Nimble Protector
			{53, 50},	-- Mystic Tenacity 2		422
			{58, 50},	-- Tempered Soul
			{45, 30},	-- Piercing Gaze
			{40, 30},	-- Savage Defense			
			{50, 20},	-- Bashing Brutality		552
		},
		basestatsToFill = {},
		slotted = {34,2,48,46}, -- Fortified, Boundless Vitality, Bloody Renewal, Bastion
	},

	-- STAMINA FARM --
--[[
50 Boundless Vitality (slot)
30 Tumbling
20 Defiance
10 Mystic Tenacity 1
20 Hero’s Vigor
16 Hasty
50 Celerity (slot)
50 Bloody Renewal (slot)
10 Shield Master
50 Bastion (slot)			306
20 Sprinter
20 Tireless Guardian
30 Fortification
6 Nimble Protector
50 Mystic Tenacity 2		422
50 Tempered Soul
30 Piercing Gaze
30 Savage Defense			
20 Bashing Brutality		552
--]]
	[7] = {
		name = "Stamina Farm (up to 552)",
		addInfo = "Replace Fortified with Celerity",
		updated = {11, 04, 2021},
		points = "(dynamic)",
		source = "@Xisel",
		role = 6,
		discipline = 3,
		preset = {
			{2, 50},	-- Boundless Vitality (slot)
			{37, 30},	-- Tumbling
			{128, 20},	-- Defiance
			{53, 10},	-- Mystic Tenacity 1
			{113, 20},	-- Hero’s Vigor
			{42, 16},	-- Hasty
			{270, 50},	-- Celerity (slot)
			{48, 50},	-- Bloody Renewal (slot)
			{63, 10},	-- Shield Master
			{46, 50},	-- Bastion (slot)			306
			{38, 20},	-- Sprinter
			{39, 20},	-- Tireless Guardian
			{43, 30},	-- Fortification
			{44, 6},	-- Nimble Protector
			{53, 50},	-- Mystic Tenacity 2		422
			{58, 50},	-- Tempered Soul
			{45, 30},	-- Piercing Gaze
			{40, 30},	-- Savage Defense			
			{50, 20},	-- Bashing Brutality		552
		},
		basestatsToFill = {},
		slotted = {270,2,48,46}, -- Celerity, Boundless Vitality, Bloody Renewal, Bastion
	},

------------------------------------------------------------
------------------------- BLUE TREE ------------------------
------------------------------------------------------------

	-- HEALER --
--[[
50 Arcane Supremacy (slot)
20 Precision
20 Eldritch Insight
20 Blessed
50 Hope Infusion (slot)
50 From the Brink (slot)
50 Enlivening Overflow (slot)
20 Quick Recovery
20 Preparation					300
20 Piercing 
20 Flawless Ritual 1
30 War Mage
20 Elemental Aegis
20 Hardy						410
40 Flawless Ritual 2
20 Tireless Discipline
40 Battle Mastery			
30 Mighty						520
--]]
	[8] = {
		name = "Healer (up to 520)",
		addInfo = "",
		updated = {11, 04, 2021},
		points = "(dynamic)",
		source = "@Xisel",
		role = 4,
		discipline = 2,
		preset = {
			{3, 50},	-- Arcane Supremacy (slot)
			{11, 20},	-- Precision
			{99, 20},	-- Eldritch Insight
			{108, 20},	-- Blessed
			{261, 50},	-- Hope Infusion (slot)
			{262, 50},	-- From the Brink (slot)
			{263, 50},	-- Enlivening Overflow (slot)
			{20, 20},	-- Quick Recovery
			{14, 20},	-- Preparation					300
			{10, 20},	-- Piercing
			{17, 20},	-- Flawless Ritual
			{21, 30},	-- War Mage
			{15, 20},	-- Elemental Aegis
			{16, 20},	-- Hardy						410
			{17, 40},	-- Flawless Ritual
			{6, 20},	-- Tireless Discipline
			{18, 40},	-- Battle Mastery			
			{22, 30},	-- Mighty						520
		},
		basestatsToFill = {},
		slotted = {3,261,262,263},
	},

	-- TANK --
--[[
20 Tireless Discipline
20 Eldritch Insight
20 Quick Recovery
10 Hardy 1
10 Elemental Aegis 1
20 Preparation
50 Unassailable (slot)
50 Duelist's Rebuff (slot)
50 Enduring Resolve (slot)
50 Bulwark (slot)					300
20 Hardy 2
20 Elemental Aegis 2
20 Blessed
10 Piercing 1
40 Flawless Ritual 					390
40 Battle Mastery
20 Piercing 2
30 War Mage
30 Mighty
20 Precision						520
--]]
	[9] = {
		name = "Tank (up to 520)",
		addInfo = "",
		updated = {11, 04, 2021},
		points = "(dynamic)",
		source = "@Xisel",
		role = 2,
		discipline = 2,
		preset = {
			{6, 20},	-- Tireless Discipline
			{99, 20},	-- Eldritch Insight
			{20, 20},	-- Quick Recovery
			{16, 10},	-- Hardy 1
			{15, 10},	-- Elemental Aegis 1
			{14, 20},	-- Preparation
			{133, 50},	-- Unassailable (slot)
			{134, 50},	-- Duelist's Rebuff (slot)
			{136, 50},	-- Enduring Resolve (slot)
			{159, 50},	-- Bulwark (slot)					300
			{16, 20},	-- Hardy 2
			{15, 20},	-- Elemental Aegis 2
			{108, 20},	-- Blessed
			{10, 10},	-- Piercing 1
			{17, 40},	-- Flawless Ritual 					390
			{18, 40},	-- Battle Mastery
			{10, 20},	-- Piercing 2
			{21, 30},	-- War Mage
			{22, 30},	-- Mighty
			{11, 20},	-- Precision						520
		},
		basestatsToFill = {},
		slotted = {136,133,134,159},
	},

	-- MAGICKA DPS --
--[[
20 Precision
20 Eldritch Insight
50 Wrathful Strikes (slot)
20 Piercing
50 Fighting Finesse / Backstabber (slot) 
20 Quick Recovery
20 Preparation
50 Deadly Aim (slot)
50 Master-at-Arms (slot)	300
40 Flawless Ritual
30 War Mage
20 Elemental Aegis
20 Hardy					410
20 Blessed
20 Tireless Discipline
40 Battle Mastery
30 Mighty					520
--]]
	[10] = {
		name = "Magicka Solo (up to 520)",
		addInfo = "Use Fightning Fitness instead of Backstabber for group. Also keep in mind Thaumaturge and Biting Aura.",
		updated = {11, 04, 2021},
		points = "(dynamic)",
		source = "@Xisel",
		role = 5,
		discipline = 2,
		preset = {
			{11, 20},	-- Precision
			{99, 20},	-- Eldritch Insight
			{8, 50},	-- Wrathful Strikes (slot)
			{10, 20},	-- Piercing
			{12, 50},	-- Fighting Finesse (slot)
			{20, 20},	-- Quick Recovery
			{14, 20},	-- Preparation
			{25, 50},	-- Deadly Aim (slot)
			{264, 50},	-- Master-at-Arms (slot)	300
			{17, 40},	-- Flawless Ritual
			{21, 30},	-- War Mage
			{15, 20},	-- Elemental Aegis
			{16, 20},	-- Hardy					410
			{108, 20},	-- Blessed
			{6, 20},	-- Tireless Discipline
			{18, 40},	-- Battle Mastery
			{22, 30},	-- Mighty					520
		},
		basestatsToFill = {},
		slotted = {8,25,264,12},
	},
	[11] = {
		name = "Magicka DPS (up to 520)",
		addInfo = "Use Backstabber instead of Fightning Fitness for solo. Also keep in mind Thaumaturge and Biting Aura.",
		updated = {11, 04, 2021},
		points = "(dynamic)",
		source = "@Xisel",
		role = 5,
		discipline = 2,
		preset = {
			{11, 20},	-- Precision
			{99, 20},	-- Eldritch Insight
			{8, 50},	-- Wrathful Strikes (slot)
			{10, 20},	-- Piercing
			{31, 50},	-- Backstabber (slot)
			{20, 20},	-- Quick Recovery
			{14, 20},	-- Preparation
			{25, 50},	-- Deadly Aim (slot)
			{264, 50},	-- Master-at-Arms (slot)	300
			{17, 40},	-- Flawless Ritual
			{21, 30},	-- War Mage
			{15, 20},	-- Elemental Aegis
			{16, 20},	-- Hardy					410
			{108, 20},	-- Blessed
			{6, 20},	-- Tireless Discipline
			{18, 40},	-- Battle Mastery
			{22, 30},	-- Mighty					520
		},
		basestatsToFill = {},
		slotted = {8,25,264,31},
	},

	-- MAGICKA PvP --
--[[
20 Precision
20 Eldritch Insight
50 Arcane Supremacy (slot)
20 Piercing
50 Untamed Aggression (slot)
20 Quick Recovery
20 Preparation
50 Deadly Aim (slot)
50 Duelist’s Rebuff (slot)	300
20 Elemental Aegis
20 Hardy					
20 Blessed
20 Tireless Discipline
40 Flawless Ritual
30 War Mage
40 Battle Mastery
30 Mighty					520
--]]
	[12] = {
		name = "Magicka PvP (up to 520)",
		addInfo = "",
		updated = {22, 02, 2022},
		points = "(dynamic)",
		source = "@Xisel",
		role = 5,
		discipline = 2,
		preset = {
			{11, 20},	-- Precision
			{99, 20},	-- Eldritch Insight
			{3, 50},	-- Arcane Supremacy (slot)
			{10, 20},	-- Piercing
			{4, 50},	-- Untamed Aggression (slot)
			{20, 20},	-- Quick Recovery
			{14, 20},	-- Preparation
			{25, 50},	-- Deadly Aim (slot)
			{134, 50},	-- Duelist’s Rebuff (slot)	300
			{15, 20},	-- Elemental Aegis
			{16, 20},	-- Hardy					410
			{108, 20},	-- Blessed
			{6, 20},	-- Tireless Discipline
			{17, 40},	-- Flawless Ritual
			{21, 30},	-- War Mage
			{18, 40},	-- Battle Mastery
			{22, 30},	-- Mighty					520
		},
		basestatsToFill = {},
		slotted = {3,4,25,134},
	},

	-- STAMINA --
--[[
20 Precision
20 Tireless Discipline
50 Wrathful Strikes (slot)
20 Piercing
50 Fighting Finesse / Backstabber (slot)
20 Quick Recovery
20 Preparation
50 Deadly Aim (slot)
50 Master-at-Arms (slot)		300
40 Battle Mastery
30 Mighty
20 Elemental Aegis
20 Hardy						410
20 Blessed
20 Eldritch Insight
40 Flawless Ritual
30 War Mage 					520
--]]
	[13] = {
		name = "Stamina Solo (up to 520)",
		addInfo = "Use Fightning Fitness instead of Backstabber for group. Also keep in mind Thaumaturge and Biting Aura.",
		updated = {11, 04, 2021},
		points = "(dynamic)",
		source = "@Xisel",
		role = 6,
		discipline = 2,
		preset = {
			{11, 20},	-- Precision
			{6, 20},	-- Tireless Discipline
			{8, 50},	-- Wrathful Strikes (slot)
			{10, 20},	-- Piercing
			{12, 50},	-- Fighting Finesse (slot)
			{20, 20},	-- Quick Recovery
			{14, 20},	-- Preparation
			{25, 50},	-- Deadly Aim (slot)
			{264, 50},	-- Master-at-Arms (slot)		300
			{18, 40},	-- Battle Mastery
			{22, 30},	-- Mighty
			{15, 20},	-- Elemental Aegis
			{16, 20},	-- Hardy						410
			{108, 20},	-- Blessed
			{99, 20},	-- Eldritch Insight
			{17, 40},	-- Flawless Ritual
			{21, 30},	-- War Mage 					520
		},
		basestatsToFill = {},
		slotted = {8,25,264,12},
	},
	[14] = {
		name = "Stamina DPS (up to 520)",
		addInfo = "Use Backstabber instead of Fightning Fitness for solo. Also keep in mind Thaumaturge and Biting Aura.",
		updated = {11, 04, 2021},
		points = "(dynamic)",
		source = "@Xisel",
		role = 6,
		discipline = 2,
		preset = {
			{11, 20},	-- Precision
			{6, 20},	-- Tireless Discipline
			{8, 50},	-- Wrathful Strikes (slot)
			{10, 20},	-- Piercing
			{31, 50},	-- Backstabber (slot)
			{20, 20},	-- Quick Recovery
			{14, 20},	-- Preparation
			{25, 50},	-- Deadly Aim (slot)
			{264, 50},	-- Master-at-Arms (slot)		300
			{18, 40},	-- Battle Mastery
			{22, 30},	-- Mighty
			{15, 20},	-- Elemental Aegis
			{16, 20},	-- Hardy						410
			{108, 20},	-- Blessed
			{99, 20},	-- Eldritch Insight
			{17, 40},	-- Flawless Ritual
			{21, 30},	-- War Mage 					520
		},
		basestatsToFill = {},
		slotted = {8,25,264,31},
	},

------------------------------------------------------------
------------------------ GREEN TREE ------------------------
------------------------------------------------------------

	-- CRAFT --
--[[
50 Steed's Blessing
10 Gilded Fingers 1
10 Fortune's Favor 1
15 Wanderer
10 Steadfast Enchantment
50 Treasure Hunter
50 Meticulous Disassembly
75 Master Gatherer
50 Plentiful Harvest
50 Gilded Fingers 2
50 Fortune's Favor 2
50 Breakfall
100 Gifted Rider 
--]]
	[15] = {
		name = "Craft 320-450",
		addInfo = "Use the Treasure Hunter skill path to avoid useless points in Inspiration. No Gifted Rider, Treasure Hunter in slot 2.",
		updated = {11, 04, 2021},
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
		},
		basestatsToFill = {},
		slotted = {66,79,81,83}, -- Steed's Blessing, Treasure Hunter, Plentiful Harvest, Meticulous Disassembly
	},
	[16] = {
		name = "Craft 470-550",
		addInfo = "Use the Treasure Hunter skill path to avoid useless points in Inspiration. Gifted Rider in slot 2.",
		updated = {11, 04, 2021},
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
		},
		basestatsToFill = {},
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
15 Wanderer
50 Breakfall
100 Gifted Rider 
--]]
	[17] = {
		name = "Craft (+Inspiration) 340-485",
		addInfo = "No Gifted Rider, Treasure Hunter in slot 2.",
		updated = {11, 04, 2021},
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
			{70, 15},	-- Wanderer
			{69, 50},	-- Breakfall
		},
		basestatsToFill = {},
		slotted = {66,79,81,83}, -- Steed's Blessing, Treasure Hunter, Plentiful Harvest, Meticulous Disassembly
	},
	[18] = {
		name = "Craft (+Inspiration) 505-585",
		addInfo = "Gifted Rider in slot 2.",
		updated = {11, 04, 2021},
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
			{70, 15},	-- Wanderer
			{69, 50},	-- Breakfall
			{92, 100},	-- Gifted Rider
		},
		basestatsToFill = {},
		slotted = {66,92,81,83}, -- Steed's Blessing, Gifted Rider, Plentiful Harvest, Meticulous Disassembly
	},

	-- FARM -- 
--[[
50 Steed's Blessing
50 Gilded Fingers
50 Breakfall
15 Wanderer 1
10 Steadfast Enchantment 1
50 Treasure Hunter
15 Master Gatherer
50 Plentiful Harvest
100 Gifted Rider 
75 Master Gatherer
50 Fortune's Favor
30 Out of Sight
40 Fleet Phantom
75 Wanderer 2
50 Steadfast Enchantment 2
33 Soul Reservoir
--]]
	[19] = {
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
			{78, 15},	-- Master Gatherer
			{81, 50},	-- Plentiful Harvest
			{92, 100},	-- Gifted Rider 
			{78, 75},	-- Master Gatherer
			{71, 50},	-- Fortune's Favor
			{68, 30},	-- Out of Sight
			{67, 40},	-- Fleet Phantom
			{70, 75},	-- Wanderer 2
			{75, 50},	-- Steadfast Enchantment 2
			{87, 33},	-- Soul Reservoir
		},
		basestatsToFill = {},
		slotted = {66,92,81,79}, -- Steed's Blessing, Gifted Rider, Plentiful Harvest, Treasure Hunter
	},

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
100 Gifted Rider 
30 Out of Sight
40 Fleet Phantom
50 Steadfast Enchantment 2
50 Fortune's Favor
33 Soul Reservoir
75 Wanderer 2
--]]
	[20] = {
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
		basestatsToFill = {},
		slotted = {66,92,86,79}, -- Steed's Blessing, Gifted Rider, Liquid Efficiency, Treasure Hunter
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

		-- ORIGINAL PRESETS --

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
--]=]