local genericArmor = {
	[ARMORTYPE_LIGHT] = {
		[EQUIP_SLOT_HEAD] = 43564,
		[EQUIP_SLOT_CHEST] = 43543,
		[EQUIP_SLOT_SHOULDERS] = 43547,
		[EQUIP_SLOT_WAIST] = 43548,
		[EQUIP_SLOT_HAND] = 43545,
		[EQUIP_SLOT_FEET] = 43544,
		[EQUIP_SLOT_LEGS] = 43546,
	},
	[ARMORTYPE_MEDIUM] = {
		[EQUIP_SLOT_HEAD] = 43563,
		[EQUIP_SLOT_CHEST] = 43550,
		[EQUIP_SLOT_SHOULDERS] = 43554,
		[EQUIP_SLOT_WAIST] = 43555,
		[EQUIP_SLOT_HAND] = 43552,
		[EQUIP_SLOT_FEET] = 43551,
		[EQUIP_SLOT_LEGS] = 43553,
	},
	[ARMORTYPE_HEAVY] = {
		[EQUIP_SLOT_HEAD] = 43562,
		[EQUIP_SLOT_CHEST] = 43537,
		[EQUIP_SLOT_SHOULDERS] = 43541,
		[EQUIP_SLOT_WAIST] = 43542,
		[EQUIP_SLOT_HAND] = 43539,
		[EQUIP_SLOT_FEET] = 43538,
		[EQUIP_SLOT_LEGS] = 43540,
	}
}

local genericWeapons = {
	[WEAPONTYPE_AXE] = 43529,
	[WEAPONTYPE_HAMMER] = 43530,
	[WEAPONTYPE_SWORD] = 43531,
	[WEAPONTYPE_TWO_HANDED_SWORD] = 43534,
	[WEAPONTYPE_TWO_HANDED_AXE] = 43532,
	[WEAPONTYPE_TWO_HANDED_HAMMER] = 43533,
	[WEAPONTYPE_DAGGER] = 43535,
	[WEAPONTYPE_BOW] = 43549,
	[WEAPONTYPE_HEALING_STAFF] = 43560,
	[WEAPONTYPE_FIRE_STAFF] = 43557,
	[WEAPONTYPE_FROST_STAFF] = 43558,
	[WEAPONTYPE_SHIELD] = 43556,
	[WEAPONTYPE_LIGHTNING_STAFF] = 43559,
}

local genericJewelry = {
	[EQUIP_TYPE_RING] = 43536,
	[EQUIP_TYPE_NECK]= 43561,
}

function CSPS.getGenericItemId(weaponType, armorType, gearSlot)
	if weaponType then return genericWeapons[weaponType] end
	if armorType then return genericArmor[armorType][gearSlot] end
	if gearSlot == EQUIP_SLOT_NECK then return genericJewelry[EQUIP_TYPE_NECK] end
	if gearSlot == EQUIP_SLOT_RING1 or gearSlot == EQUIP_SLOT_RING2 then return genericJewelry[EQUIP_TYPE_NECK] end
end

local allPoisonIds = {
	[76826] = {8455424, 66309, 66311, 67337, 72448, 66825, 67869, 99584, 66816, 65536, 8454917, 67328, 99072, 8454912, 66304, 72704, 66843, 8454144, 72477, 72960, 67840},
	[76827] = {165376, 170240, 136734, 133891, 164608, 134405, 8520710, 136480, 133896, 136451, 167178, 136459, 131865, 136973, 132626, 134019, 166664, 132382, 131858, 
				136985, 136978, 133145, 136963, 132119, 136453, 8520473, 136727, 137502, 132636, 138240, 170270, 132384, 137504, 132352, 132101, 133888, 136960, 132104, 
				8520704, 164864, 139264, 8523008, 8526080, 134410, 131072, 138752, 132102, 137472, 135680, 132618, 133650, 8520448, 136458, 131840, 136448, 134400, 136704, 
				132608, 8521216, 133120, 133632, 8519680, 8522496, 132096},
	[76828] = {197888, 8585216, 198400, 198681, 198425, 196608, 204544, 203008, 198656, 201216, 197919},
	[76829] = {262144, 265217, 268037, 262405, 267527, 265223, 300288, 267525, 263451, 263962, 263706, 8656128, 263936, 267520, 262400, 269056, 268059, 268800, 8650752, 
				262427, 265216, 267799, 263424, 268032, 267802, 267803, 263680, 264192, 8653824, 267776},
	[76830] = {329984, 335872, 330014, 327680, 330240, 335616, 335360, 334592, 334622, 8716288},
	[76831] = {393216, 396801, 396809, 397853, 393472, 399374, 395549, 399872, 393501, 396818, 8781824, 395776, 396800, 395520, 8785408, 399901, 400384, 399386, 400640, 
				393500, 395805, 399360, 397824},
	[76832] = {461056, 499200, 461086, 466432, 8855040, 465152, 465408, 465182, 458752},
	[76833] = {531712, 530717, 530688, 524288},
	[76834] = {591872, 628992, 597248, 589824, 597504, 596224, 8984832, 596253, 596254, 594432},
	[76835] = {662784, 659968, 655360},
	[76836] = {724744, 721672, 754432, 724739, 721664, 722944, 755712, 720896},
	[76837] = {786688, 786695, 788224, 820992, 786432, 819456, 9175303},
	[76838] = {851968, 856330, 853258, 886016, 887296, 856325, 854528, 853248},
	[76839] = {919808, 919826, 9306377, 952576, 917504, 917769, 922112, 917760, 950528},
	[76840] = {983040, 987393, 983299, 985088, 990208, 983296, 9371904, 987392, 983324, 9371648, 1016064, 983808},
	[76841] = {1048576, 1055488, 1053213, 1055517, 1053184, 1056000},
	[76842] = {1114112, 1114368, 1114373, 9502720, 1115392},
	[76843] = {1179648, 1187072, 9568256, 1187584, 1187103},
	[76844] = {1249024, 1249025, 1245443, 1245445, 1250565, 1249541, 1250563, 1250560, 1245184, 1250817, 1249027, 1251075, 1251077, 1251072, 1250816, 1246464, 1245952, 
				1245440, 9633792, 1249536},
	[76845] = {1311744, 1315072, 1312256, 1314560, 1310720},
	[76846] = {1376256, 1380864, 1377042, 1379075, 1377024, 1380613, 1379072, 1379335, 1384448, 1383680, 1377546, 1377536, 1378048, 1380608, 9764864, 1378816},
	[76847] = {1445632, 1444865, 1448735, 1446431, 1445917, 1446400, 1445915, 1448730, 1447709, 1444864, 1447680, 1449728, 1448448, 1448477, 1447698, 1445633, 9830400, 
				1442048, 1448704, 1449472, 1449216, 1445888, 1447706, 1442075, 1441792, 1442077, 1448734, 1447711},
	[76848] = {1511168, 1511171, 1510661, 1514783, 9895936, 1547037, 1514271, 1547008, 1514015, 1511965, 1514240, 1508096, 1508101, 1511936, 1515264, 1513728, 9902848, 
				1513984, 1514269, 1508121, 1514752, 1508635, 1507328, 1513757, 1508608, 1508639},
	[76849] = {1578240, 1576449, 1578247, 1577216, 1579934, 1574814, 1613312, 1579776, 1577728, 1579520, 1579806, 9969152, 1574686, 1580544, 1578497, 1578496, 1573127, 
				9961472, 1577217, 1577729, 1578522, 1573147, 1572864, 1573120, 1578526, 1574656},
	[77593] = {1776896, 1776159, 1777408, 1775901, 1776157, 1776128, 1775872, 1809920, 10165760, 1769472, 1809664, 10158080, 1777152, 1776029, 1776158, 1777183},
	[77595] = {1835008, 1842688, 10223616, 1842432, 1841664, 1841693, 1841438, 1841408},
	[77597] = {1638400, 1678848, 1646592, 10034432, 10027008, 1645824, 1678592, 1646080},
	[77599] = {1703936, 1711872, 1744128, 10099968, 1711360, 10092544, 1711391},
	[77601] = {10289152, 1908480, 1900544},
	[77603] = {10354688, 1974016, 1966080},
	[152151] = {2031616, 10420224},
	[158309] = {2097152},
}

local poisonEffectAbilityIds = {
	[499200] = {46206,64562,79860,},
	[1250817] = {47210,45239,80003,79133,},
	[132101] = {28987,46193,79141,},
	[8520710] = {28987,46193,46199,},
	[1379335] = {46292,46202,46206,64562,},
	[132104] = {28987,46193,46206,},
	[396809] = {46199,46204,46208,64564,},
	[132618] = {28987,46199,46208,},
	[399374] = {46199,46210,46204,},
	[396818] = {46199,46204,47203,},
	[267799] = {46193,80003,46210,64566,},
	[133145] = {28987,46206,79717,79712,},
	[1578522] = {46210,80003,79717,},
	[1445915] = {80003,79895,79133,},
	[132636] = {28987,46199,28987,},
	[1053213] = {79895,47203,79860,61549,},
	[1578526] = {46210,80003,79860,},
	[1446431] = {80003,47203,61708,75095,},
	[1711391] = {79717,79860,61549,61708,75095,},
	[1744128] = {79717,79860,61549,},
	[10099968] = {79717,79860,61549,},
	[1711360] = {79717,79860,61549,},
	[10092544] = {79717,},
	[1711872] = {79717,61708,75095,},
	[1703936] = {79717,},
	[335872] = {79141,140699,},
	[330014] = {79141,46208,64564,79860,},
	[327680] = {79141,},
	[330240] = {79141,46208,},
	[335616] = {79141,61708,75095,},
	[335360] = {79141,79860,},
	[334592] = {79141,79133,},
	[334622] = {79141,79133,79860,},
	[8716288] = {79141,},
	[329984] = {79141,46208,64564,},
	[1678848] = {79717,79712,79860,},
	[1646592] = {79717,79712,140699,},
	[10034432] = {79717,79712,79860,61549,},
	[10027008] = {79717,79712,},
	[1645824] = {79717,79712,79860,61549,},
	[1678592] = {79717,79712,79860,61549,},
	[1646080] = {79717,79712,79860,},
	[1638400] = {79717,79712,},
	[197919] = {79137,79141,61708,75095,},
	[198400] = {79137,46206,64562,},
	[198681] = {79137,46206,79717,79712,},
	[196608] = {79137,},
	[204544] = {79137,61708,75095,},
	[203008] = {79137,79717,79712,},
	[198425] = {79137,46206,64562,79717,79712,},
	[198656] = {79137,46206,},
	[201216] = {79137,47203,},
	[8585216] = {79137,},
	[197888] = {79137,79141,},
	[170240] = {28987,79717,79712,},
	[164608] = {28987,79137,},
	[136451] = {28987,46292,79137,},
	[1514752] = {46210,64566,79860,61549,},
	[166664] = {28987,46202,61685,46206,},
	[136978] = {28987,46210,64566,47203,},
	[132626] = {28987,46199,47203,},
	[136963] = {28987,46210,64566,79137,},
	[136453] = {28987,46292,79141,},
	[8520473] = {28987,79137,79717,79712,},
	[132119] = {28987,46193,46210,64566,},
	[137502] = {28987,79717,79712,79860,},
	[131865] = {28987,79137,79717,79712,},
	[138240] = {28987,28987,},
	[170270] = {28987,79717,79712,79860,},
	[136734] = {28987,80003,79860,},
	[137504] = {28987,79717,79712,140699,},
	[136480] = {28987,46292,140699,},
	[132352] = {28987,79141,},
	[133888] = {28987,46202,61685,},
	[136960] = {28987,46210,64566,},
	[8520704] = {28987,46193,},
	[164864] = {28987,46193,},
	[139264] = {28987,140699,},
	[8523008] = {28987,46204,61662,},
	[8526080] = {28987,79717,79712,},
	[134410] = {28987,46204,61662,46208,},
	[131072] = {28987,},
	[1114373] = {47203,61666,79133,79141,},
	[138752] = {28987,79860,},
	[132382] = {28987,79141,79860,},
	[132102] = {28987,46193,46199,},
	[137472] = {28987,79717,79712,},
	[135680] = {28987,47203,},
	[136985] = {28987,46210,64566,79717,79712,},
	[136727] = {28987,80003,46210,64566,},
	[133650] = {28987,46208,47203,},
	[8520448] = {28987,79137,},
	[136458] = {28987,46292,46208,},
	[131840] = {28987,79137,},
	[131858] = {28987,79137,47203,},
	[136448] = {28987,46292,},
	[134400] = {28987,46204,61662,},
	[136704] = {28987,80003,},
	[132608] = {28987,46199,},
	[1908480] = {79860,61549,61708,75095,},
	[8521216] = {28987,46199,},
	[1777183] = {79133,79860,61708,75095,},
	[167178] = {28987,46204,61662,46208,},
	[133120] = {28987,46206,},
	[133896] = {28987,46202,61685,46206,},
	[133632] = {28987,46208,},
	[134405] = {28987,46204,61662,79141,},
	[8519680] = {28987,},
	[133891] = {28987,46202,61685,79137,},
	[8522496] = {28987,46202,61685,},
	[132096] = {28987,46193,},
	[165376] = {28987,46199,},
	[72448] = {79133,79133,},
	[66825] = {79133,79141,46208,64564,},
	[67869] = {79133,46208,64564,79860,61549,},
	[99584] = {79133,79141,},
	[66843] = {79133,79141,79133,},
	[8454912] = {79133,79137,},
	[65536] = {79133,},
	[8454917] = {79133,79137,79141,},
	[99072] = {79133,79137,},
	[67328] = {79133,46206,64562,},
	[66304] = {79133,79137,},
	[66816] = {79133,79141,},
	[8454144] = {79133,},
	[72477] = {79133,79133,79860,61549,},
	[72960] = {79133,79860,61549,},
	[67840] = {79133,46208,64564,},
	[67337] = {79133,46206,64562,46208,64564,},
	[66311] = {79133,79137,46206,64562,},
	[66309] = {79133,79137,79141,},
	[8455424] = {79133,79141,},
	[1776159] = {79133,79717,61708,75095,},
	[1776158] = {79133,79717,79860,},
	[1775901] = {79133,79717,79712,79860,61549,},
	[1776157] = {79133,79717,79860,61549,},
	[1776128] = {79133,79717,},
	[1775872] = {79133,79717,79712,},
	[1809920] = {79133,79860,},
	[10165760] = {79133,79860,},
	[1769472] = {79133,},
	[1809664] = {79133,79860,61549,},
	[10158080] = {79133,},
	[531712] = {46206,79860,61549,},
	[1445633] = {80003,79895,61691,79133,},
	[1777152] = {79133,79860,},
	[1245443] = {47210,45239,79133,79137,},
	[9764864] = {46292,},
	[1245445] = {47210,45239,79133,79141,},
	[1777408] = {79133,61708,75095,},
	[786695] = {46202,79133,46206,64562,},
	[721672] = {46202,61685,79137,46206,},
	[917769] = {46204,79133,46208,64564,},
	[1377546] = {46292,79141,46208,},
	[136459] = {28987,46292,46202,61685,},
	[1776896] = {79133,79860,61549,},
	[136973] = {28987,46210,64566,46204,61662,},
	[1900544] = {79860,61549,},
	[10289152] = {79860,61549,},
	[10420224] = {61708,75095,},
	[2031616] = {61708,75095,},
	[1447698] = {80003,46210,64566,47203,},
	[1835008] = {28987,},
	[2097152] = {140699,},
	[461056] = {46206,64562,46208,64564,},
	[1444865] = {80003,46202,79133,},
	[268037] = {46193,46210,64566,79141,},
	[724739] = {46202,61685,79895,61691,79137,},
	[1508121] = {46210,64566,79137,79717,79712,},
	[1448730] = {80003,79133,79717,},
	[1508635] = {46210,64566,79141,79133,},
	[267527] = {46193,46292,46206,64562,},
	[1055517] = {79895,79133,79860,61549,},
	[465182] = {46206,64562,79717,79712,79860,},
	[1447711] = {80003,46210,64566,61708,75095,},
	[132384] = {28987,79141,140699,},
	[300288] = {46193,46292,},
	[9175303] = {46202,79133,46206,64562,},
	[724744] = {46202,61685,79895,61691,46206,},
	[9306377] = {46204,79133,46208,64564,},
	[853258] = {46204,61662,79141,46208,},
	[267525] = {46193,46292,79141,},
	[263451] = {46193,79141,79133,},
	[263962] = {46193,46206,64562,79717,},
	[263706] = {46193,46199,79717,},
	[8656128] = {46193,46292,},
	[268800] = {46193,79717,},
	[1377042] = {46292,79137,47203,},
	[267520] = {46193,46292,},
	[262400] = {46193,79133,},
	[269056] = {46193,79133,},
	[268059] = {46193,46210,64566,79133,},
	[8650752] = {46193,},
	[1447706] = {80003,46210,64566,79717,},
	[1442075] = {80003,79133,79133,},
	[262427] = {46193,79133,79133,},
	[530717] = {46206,79717,79712,79860,61549,},
	[596254] = {46208,64564,79717,79712,79860,},
	[1187103] = {47203,79860,61549,61708,75095,},
	[265216] = {46193,46202,},
	[263936] = {46193,46206,64562,},
	[263424] = {46193,79141,},
	[268032] = {46193,46210,64566,},
	[267802] = {46193,80003,79717,},
	[267803] = {46193,80003,79133,},
	[263680] = {46193,46199,},
	[264192] = {46193,46206,},
	[265223] = {46193,46202,46206,64562,},
	[8653824] = {46193,46202,},
	[262405] = {46193,79133,79141,},
	[267776] = {46193,80003,},
	[265217] = {46193,46202,79133,},
	[262144] = {46193,},
	[1974016] = {79860,61708,75095,},
	[1966080] = {79860,},
	[10354688] = {79860,},
	[399872] = {46199,79717,},
	[397853] = {46199,47203,79860,61549,},
	[395549] = {46199,46208,64564,79860,61549,},
	[400384] = {46199,28987,},
	[393501] = {46199,79133,79860,61549,},
	[399386] = {46199,46210,79717,},
	[395776] = {46199,46208,},
	[396800] = {46199,46204,},
	[395520] = {46199,46208,64564,},
	[8785408] = {46199,46204,},
	[399901] = {46199,79717,79860,61549,},
	[8781824] = {46199,},
	[400640] = {46199,79860,61549,},
	[393472] = {46199,79133,},
	[395805] = {46199,46208,79860,61549,},
	[399360] = {46199,46210,},
	[397824] = {46199,47203,},
	[396801] = {46199,46204,79133,},
	[393216] = {46199,},
	[1577216] = {46210,47203,61666,},
	[1579934] = {46210,79133,79860,},
	[919826] = {46204,46208,64564,47203,},
	[1613312] = {46210,79860,},
	[1573147] = {46210,79133,79133,},
	[1579520] = {46210,79717,},
	[1579806] = {46210,79133,79860,},
	[9969152] = {46210,79860,},
	[1574686] = {46210,46206,64562,79860,},
	[1580544] = {46210,79860,},
	[1578497] = {46210,80003,79133,},
	[1578496] = {46210,80003,},
	[1573127] = {46210,79133,46206,64562,},
	[9961472] = {46210,},
	[1577217] = {46210,47203,61666,79133,},
	[1577729] = {46210,47210,45239,79133,},
	[1577728] = {46210,47210,45239,},
	[1579776] = {46210,79133,},
	[1572864] = {46210,},
	[1573120] = {46210,79133,},
	[1574656] = {46210,46206,64562,},
	[1578247] = {46210,46292,46206,64562,},
	[1576449] = {46210,46204,79133,},
	[1578240] = {46210,46292,},
	[1514783] = {46210,64566,79860,61549,61708,75095,},
	[9895936] = {46210,64566,},
	[1547037] = {46210,64566,79133,79860,61549,},
	[1514271] = {46210,64566,79133,61708,75095,},
	[1514015] = {46210,64566,79717,61708,75095,},
	[1514240] = {46210,64566,79133,},
	[1508096] = {46210,64566,79137,},
	[1508101] = {46210,64566,79137,79141,},
	[1511936] = {46210,64566,47203,},
	[1515264] = {46210,64566,61708,75095,},
	[1513728] = {46210,64566,79717,79712,},
	[9902848] = {46210,64566,79133,},
	[1513984] = {46210,64566,79717,},
	[1514269] = {46210,64566,79133,79860,61549,},
	[1511965] = {46210,64566,47203,79860,61549,},
	[134019] = {28987,46202,61685,79137,},
	[1547008] = {46210,64566,79133,},
	[1507328] = {46210,64566,},
	[1513757] = {46210,64566,79717,79712,79860,61549,},
	[1508608] = {46210,64566,79141,},
	[1508639] = {46210,64566,79141,61708,75095,},
	[1510661] = {46210,64566,46204,61662,79141,},
	[1511171] = {46210,64566,79895,61691,79137,},
	[1511168] = {46210,64566,79895,61691,},
	[1448735] = {80003,79133,61708,75095,},
	[1448734] = {80003,79133,79860,},
	[1445917] = {80003,79895,79860,61549,},
	[1446400] = {80003,47203,},
	[1447709] = {80003,46210,64566,79860,61549,},
	[1444864] = {80003,46202,},
	[1447680] = {80003,46210,64566,},
	[1449728] = {80003,61708,75095,},
	[1448448] = {80003,79717,},
	[1448477] = {80003,79717,79860,61549,},
	[9830400] = {80003,},
	[1442048] = {80003,79133,},
	[1448704] = {80003,79133,},
	[1449472] = {80003,79860,},
	[1449216] = {80003,79860,61549,},
	[1445888] = {80003,79895,},
	[466432] = {46206,64562,79860,},
	[1776029] = {79133,79717,79712,79860,61549,},
	[1574814] = {46210,46206,64562,79860,},
	[983299] = {79895,61691,79133,79137,},
	[1441792] = {80003,},
	[856325] = {46204,61662,47203,61666,79141,},
	[1442077] = {80003,79133,79860,61549,},
	[856330] = {46204,61662,47203,61666,46208,},
	[1445632] = {80003,79895,61691,},
	[1380864] = {46292,47203,},
	[1377024] = {46292,79137,},
	[1379072] = {46292,46202,61685,},
	[1384448] = {46292,140699,},
	[1383680] = {46292,79860,61549,},
	[1377536] = {46292,79141,},
	[1378048] = {46292,46206,64562,},
	[1380608] = {46292,47203,61666,},
	[1380613] = {46292,47203,61666,79141,},
	[1379075] = {46292,46202,61685,79137,},
	[596253] = {46208,64564,79717,79712,79860,61549,},
	[461086] = {46206,64562,46208,64564,79860,},
	[1378816] = {46292,46208,},
	[1376256] = {46292,},
	[1315072] = {47210,47203,61666,},
	[1312256] = {47210,46199,},
	[1314560] = {47210,79895,61691,},
	[1310720] = {47210,},
	[1311744] = {47210,46193,},
	[1250565] = {47210,45239,46292,79141,},
	[1249541] = {47210,45239,47203,61666,79141,},
	[1250563] = {47210,45239,46292,79137,},
	[1245184] = {47210,45239,},
	[1250560] = {47210,45239,46292,},
	[1249027] = {47210,45239,79895,61691,79137,},
	[1251075] = {47210,45239,46210,64566,79137,},
	[1251077] = {47210,45239,46210,64566,79141,},
	[1251072] = {47210,45239,46210,64566,},
	[1250816] = {47210,45239,80003,},
	[1246464] = {47210,45239,79141,},
	[1245952] = {47210,45239,79137,},
	[1245440] = {47210,45239,79133,},
	[9633792] = {47210,45239,},
	[1249536] = {47210,45239,47203,61666,},
	[1249024] = {47210,45239,79895,61691,},
	[9568256] = {47203,},
	[1187584] = {47203,61708,75095,},
	[1187072] = {47203,79860,61549,},
	[1179648] = {47203,},
	[1114368] = {47203,61666,79133,},
	[9502720] = {47203,61666,},
	[1115392] = {47203,61666,79141,},
	[1114112] = {47203,61666,},
	[1055488] = {79895,79133,},
	[1053184] = {79895,47203,},
	[1056000] = {79895,79860,61549,},
	[1048576] = {79895,},
	[987392] = {79895,61691,47203,61666,},
	[8855040] = {46206,64562,79860,},
	[985088] = {79895,61691,46206,},
	[983040] = {79895,61691,},
	[9371648] = {79895,61691,},
	[983808] = {79895,61691,79137,},
	[983296] = {79895,61691,79133,},
	[952576] = {46204,46208,64564,},
	[917504] = {46204,},
	[922112] = {46204,47203,},
	[917760] = {46204,79133,},
	[950528] = {46204,79133,},
	[919808] = {46204,46208,64564,},
	[886016] = {46204,61662,79141,},
	[887296] = {46204,61662,46208,},
	[854528] = {46204,61662,46208,},
	[853248] = {46204,61662,79141,},
	[851968] = {46204,61662,},
	[788224] = {46202,46206,64562,},
	[820992] = {46202,46206,64562,},
	[786432] = {46202,},
	[819456] = {46202,79133,},
	[786688] = {46202,79133,},
	[754432] = {46202,61685,79137,},
	[458752] = {46206,64562,},
	[721664] = {46202,61685,79137,},
	[722944] = {46202,61685,46206,},
	[755712] = {46202,61685,46206,},
	[720896] = {46202,61685,},
	[655360] = {46208,},
	[659968] = {46208,47203,},
	[662784] = {46208,79860,61549,},
	[628992] = {46208,64564,79717,79712,},
	[597504] = {46208,64564,79860,},
	[596224] = {46208,64564,79717,79712,},
	[8984832] = {46208,64564,79717,79712,},
	[589824] = {46208,64564,},
	[465408] = {46206,64562,79717,},
	[597248] = {46208,64564,79860,61549,},
	[594432] = {46208,64564,47203,},
	[591872] = {46208,64564,46206,},
	[530688] = {46206,79717,79712,},
	[524288] = {46206,},
	[465152] = {46206,64562,79717,79712,},
}

local crownPoisons = {
	135123, 79691, 79692, 79694, 79690,
}

function CSPS.getAlternatePoisonName(secondId)
	local myEffects = poisonEffectAbilityIds[secondId] or false
	if not myEffects then return false end
	local effectNames = {}
	for i, v in pairs(myEffects) do
		effectNames[i] = zo_strformat("<<C:1>>", GetAbilityName(v))
	end
	return table.concat(effectNames, ", ")
end

function CSPS.getPoisonIds(firstId, crown)
	local returnTable = {}
	if crown then 
		for i, v in pairs(crownPoisons) do
			table.insert(returnTable, {v, 0})
		end
	elseif firstId then 
		if not allPoisonIds[firstId] then return false end
		for i, v in pairs(allPoisonIds[firstId]) do
			table.insert(returnTable, {firstId, v})
		end
	else
		for i, v in pairs(allPoisonIds) do
			table.insert(returnTable, i)
		end
	end
	return returnTable
end

