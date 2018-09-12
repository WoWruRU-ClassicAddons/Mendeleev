--[[
Name: LibBabble-Tradeskill-3.0
Revision: $Rev: 100 $
Maintainers: Lichery
Website: 
Dependencies: None
License: MIT
]]

local MAJOR_VERSION = "LibBabble-Tradeskill-3.0"
local MINOR_VERSION = 90000 + tonumber(string.match("$Rev: 100 $", "%d+"))

if not LibStub then error(MAJOR_VERSION .. " requires LibStub.") end
local lib = LibStub("LibBabble-3.0"):New(MAJOR_VERSION, MINOR_VERSION)
if not lib then return end

local GAME_LOCALE = GetLocale()

lib:SetBaseTranslations {
	--Gathering skills
	["Disenchant"] = true,
	["Fishing"] = true,
	["Herbalism"] = true,
	["Mining"] = true,
	["Pick Pocket"] = true,
	["Prospecting"] = true,
	["Skinning"] = true,
	["Smelting"] = true,
	
	--Crafting skills
	["Alchemy"] = true,
	["Armorsmith"] = true,
	["Blacksmithing"] = true,
	["Cooking"] = true,
	["Dragonscale Leatherworking"] = true,
	["Elemental Leatherworking"] = true,
	["Enchanting"] = true,
	["Engineering"] = true,
	["First Aid"] = true,
	["Gnomish Engineering"] = true,
	["Goblin Engineering"] = true,
	["Jewelcrafting"] = true,
	["Leatherworking"] = true,
	["Master Axesmith"] = true,
	["Master Hammersmith"] = true,
	["Master Swordsmith"] = true,
	["Mooncloth Tailoring"] = true,
	["Shadoweave Tailoring"] = true,
	["Spellfire Tailoring"] = true,
	["Tailoring"] = true,
	["Tribal Leatherworking"] = true,
	["Weaponsmith"] = true,
}


if GAME_LOCALE == "enUS" then
	lib:SetCurrentTranslations(true)
elseif GAME_LOCALE == "deDE" then
	lib:SetCurrentTranslations {
	--Gathering skills
	["Disenchant"] = "Entzaubern",
	["Fishing"] = "Angeln",
	["Herbalism"] = "Kr\195\164uterkunde",
	["Mining"] = "Bergbau",
	["Pick Pocket"] = "Taschendiebstahl",
	["Prospecting"] = "Sondieren",
	["Skinning"] = "K\195\188rschnerei",
	["Smelting"] = "Verh\195\188ttung",
	
	--Crafting skills
	["Alchemy"] = "Alchimie",
	["Armorsmith"] = "R\195\188stungsschmied",
	["Blacksmithing"] = "Schmiedekunst",
	["Cooking"] = "Kochkunst",
	["Dragonscale Leatherworking"] = "Drachenschuppenlederverarbeitung",
	["Elemental Leatherworking"] = "Elementarlederverarbeitung",
	["Enchanting"] = "Verzauberkunst",
	["Engineering"] = "Ingenieurskunst",
	["First Aid"] = "Erste Hilfe",
	["Gnomish Engineering"] = "Gnomeningenieur",
	["Goblin Engineering"] = "Gobliningenieur",
	["Jewelcrafting"] = "Juwelenschleifen",
	["Leatherworking"] = "Lederverarbeitung",
	["Master Axesmith"] = "Axtschmied",
	["Master Hammersmith"] = "Hammerschmied",
	["Master Swordsmith"] = "Schwertschmied",
	["Mooncloth Tailoring"] = "Mondstoffschneiderei",
	["Shadoweave Tailoring"] = "Schattenzwirnschneiderei",
	["Spellfire Tailoring"] = "Zauberfeuerschneiderei",
	["Tailoring"] = "Schneiderei",
	["Tribal Leatherworking"] = "Stammeslederverarbeitung",
	["Weaponsmith"] = "Waffenschmied",
}
elseif GAME_LOCALE == "frFR" then
	lib:SetCurrentTranslations {
	--Gathering skills
	["Disenchant"] = "Désenchanter",
	["Fishing"] = "Pêche",
	["Herbalism"] = "Herboristerie",
	["Mining"] = "Minage",
	["Pick Pocket"] = "Vol à la tire",
	["Prospecting"] = "Prospection",
	["Skinning"] = "Dépecage",
	["Smelting"] = "Fondre",
	
	--Crafting skills
	["Alchemy"] = "Alchimie",
	["Armorsmith"] = "Fabricant d'armures",
	["Blacksmithing"] = "Forge",
	["Cooking"] = "Cuisine",
	["Dragonscale Leatherworking"] = "Travail du cuir d'écailles de dragon",
	["Elemental Leatherworking"] = "Travail du cuir élémentaire",
	["Enchanting"] = "Enchantement",
	["Engineering"] = "Ingénieur",
	["First Aid"] = "Premiers soins",
	["Gnomish Engineering"] = "Ingénieur gnome",
	["Goblin Engineering"] = "Ingénieur gobelin",
	["Jewelcrafting"] = "Joaillerie",
	["Leatherworking"] = "Travail du cuir",
	["Master Axesmith"] = "Fabricant de haches",
	["Master Hammersmith"] = "Fabricant de marteaux",
	["Master Swordsmith"] = "Fabricant d'épées",
	["Mooncloth Tailoring"] = "Couture d'étoffe lunaire",
	["Shadoweave Tailoring"] = "Couture de tisse-ombre",
	["Spellfire Tailoring"] = "Couture du feu-sorcier",
	["Tailoring"] = "Couture",
	["Tribal Leatherworking"] = "Travail du cuir tribal",
	["Weaponsmith"] = "Fabricant d'armes",
}
elseif GAME_LOCALE == "zhCN" then
	lib:SetCurrentTranslations {
	--Gathering skills
	["Disenchant"] = "附魔分解",
	["Fishing"] = "钓鱼",
	["Herbalism"] = "采药",
	["Mining"] = "采矿",
	["Pick Pocket"] = "偷窃",
	["Prospecting"] = "选矿",	--TBC check
	["Skinning"] = "剥皮",
	["Smelting"] = "熔炼",
	
	--Crafting skills
	["Alchemy"] = "炼金术",
	["Armorsmith"] = "护甲锻造师",
	["Blacksmithing"] = "锻造",
	["Cooking"] = "烹饪",
	["Dragonscale Leatherworking"] = "龙鳞制皮",
	["Elemental Leatherworking"] = "元素制皮",
	["Enchanting"] = "附魔",
	["Engineering"] = "工程学",
	["First Aid"] = "急救",
	["Gnomish Engineering"] = "侏儒工程师",
	["Goblin Engineering"] = "地精工程师",
	["Jewelcrafting"] = "珠宝加工",	--TBC check
	["Leatherworking"] = "制皮",
	["Master Axesmith"] = "铸斧大师",
	["Master Hammersmith"] = "铸锤大师",
	["Master Swordsmith"] = "铸剑大师",
	["Mooncloth Tailoring"] = "月布裁缝", -- need fix
	["Shadoweave Tailoring"] = "暗纹裁缝", -- need fix
	["Spellfire Tailoring"] = "魔焰裁缝", -- need fix
	["Tailoring"] = "裁缝",
	["Tribal Leatherworking"] = "部族制皮",
	["Weaponsmith"] = "武器锻造师",
}
elseif GAME_LOCALE == "zhTW" then
	lib:SetCurrentTranslations {
	--Gathering skills
	["Disenchant"] = "分解",
	["Fishing"] = "釣魚",
	["Herbalism"] = "草藥學",
	["Mining"] = "採礦",
	["Pick Pocket"] = "偷竊",
	["Prospecting"] = "勘探",
	["Skinning"] = "剝皮",
	["Smelting"] = "熔煉",
	
	--Crafting skills
	["Alchemy"] = "煉金術",
	["Armorsmith"] = "護甲鍛造師",
	["Blacksmithing"] = "鍛造",
	["Cooking"] = "烹飪",
	["Dragonscale Leatherworking"] = "龍鱗製皮",
	["Elemental Leatherworking"] = "元素製皮",
	["Enchanting"] = "附魔",
	["Engineering"] = "工程學",
	["First Aid"] = "急救",
	["Gnomish Engineering"] = "地精工程學",
	["Goblin Engineering"] = "哥布林工程學",
	["Jewelcrafting"] = "珠寶設計",
	["Leatherworking"] = "製皮",
	["Master Axesmith"] = "鑄斧大師",
	["Master Hammersmith"] = "鑄錘大師",
	["Master Swordsmith"] = "鑄劍大師",
	["Mooncloth Tailoring"] = "月布裁縫",
	["Shadoweave Tailoring"] = "暗紋裁縫",
	["Spellfire Tailoring"] = "魔焰裁縫",
	["Tailoring"] = "裁縫",
	["Tribal Leatherworking"] = "部族製皮",
	["Weaponsmith"] = "武器鑄造",
}
elseif GAME_LOCALE == "koKR" then
	lib:SetCurrentTranslations {
	--Gathering skills
	["Disenchant"] = "마력 추출",
	["Fishing"] = "낚시",
	["Herbalism"] = "약초 채집",
	["Mining"] = "채광",
	["Pick Pocket"] = "훔치기",
	["Prospecting"] = "보석 추출",
	["Skinning"] = "무두질",
	["Smelting"] = "제련술",
	
	--Crafting skills
	["Alchemy"] = "연금술",
	["Armorsmith"] = "방어구제작",
	["Blacksmithing"] = "대장기술",
	["Cooking"] = "요리",
	["Dragonscale Leatherworking"] = "용비늘 가죽세공",
	["Elemental Leatherworking"] = "원소 가죽세공",
	["Enchanting"] = "마법부여",
	["Engineering"] = "기계공학",
	["First Aid"] = "응급 치료",
	["Gnomish Engineering"] = "노움 기계공학",
	["Goblin Engineering"] = "고블린 기계공학",
	["Jewelcrafting"] = "보석세공",
	["Leatherworking"] = "가죽 세공",
	["Master Axesmith"] = "도끼 제작의 대가",
	["Master Hammersmith"] = "망치 제작의 대가",
	["Master Swordsmith"] = "검 제작의 대가",
	["Mooncloth Tailoring"] = "달빛매듭 재봉술",
	["Shadoweave Tailoring"] = "그림자매듭 재봉술",
	["Spellfire Tailoring"] = "마법불꽃 재봉술",
	["Tailoring"] = "재봉술",
	["Tribal Leatherworking"] = "전통 가죽세공",
	["Weaponsmith"] = "무기제작",
}
elseif GAME_LOCALE == "esES" then
	lib:SetCurrentTranslations {
	--Gathering skills
	["Disenchant"] = "Desencantar",
	["Fishing"] = "Pesca",
	["Herbalism"] = "Botánica",   -- Herborister\195\173a / Bot\195\161nica
	["Mining"] = "Minería",
	["Pick Pocket"] = "Robar",
	["Prospecting"] = "Prospectar",
	["Skinning"] = "Desuello",
	["Smelting"] = "Fundición",
	
	--Crafting skills
	["Alchemy"] = "Alquimia",
	["Armorsmith"] = "Forjador de armaduras",    -- check
	["Blacksmithing"] = "Herrería",
	["Cooking"] = "Cocina",
	["Dragonscale Leatherworking"] = "Peletería dragontina",   -- check
	["Elemental Leatherworking"] = "Peletería elemental",   -- check
	["Enchanting"] = "Encantamiento",
	["Engineering"] = "Ingeniería",
	["First Aid"] = "Primeros auxilios",
	["Gnomish Engineering"] = "Ingeniería gnómica",
	["Goblin Engineering"] = "Ingeniería goblin",
	["Jewelcrafting"] = "Joyería",
	["Leatherworking"] = "Peletería",
	["Master Axesmith"] = "Forjador de hachas",
	["Master Hammersmith"] = "Forjador de martillos", -- check
	["Master Swordsmith"] = "Forjador de espadas", -- check
	["Mooncloth Tailoring"] = "Sastrería con tela lunar",
	["Shadoweave Tailoring"] = "Sastrería con tejido de Sombras", 
	["Spellfire Tailoring"] = "Sastrería con fuego de hechizo",
	["Tailoring"] = "Sastrería",
	["Tribal Leatherworking"] = "Peletería tribal",      -- check
	["Weaponsmith"] = "Forjador de armas",        -- check
}
elseif GAME_LOCALE == "ruRU" then
	lib:SetCurrentTranslations {
	-- Gathering skills
	["Disenchant"] = "Распыление",
	["Fishing"] = "Рыбная ловля",
	["Herbalism"] = "Травничество",
	["Mining"] = "Горное дело",
	["Pick Pocket"] = "Обшаривание карманов",
	["Prospecting"] = "Просеивание",
	["Skinning"] = "Снятие шкур",
	["Smelting"] = "Выплавка металлов",
	
	-- Crafting skills
	["Alchemy"] = "Алхимия",
	["Armorsmith"] = "Бронник",
	["Blacksmithing"] = "Кузнечное дело",
	["Cooking"] = "Кулинария",
	["Dragonscale Leatherworking"] = "Кожевничество: чешуя драконов",
	["Elemental Leatherworking"] = "Кожевничество: сила стихий",
	["Enchanting"] = "Наложение чар",
	["Engineering"] = "Инженерное дело",
	["First Aid"] = "Первая помощь",
	["Gnomish Engineering"] = "Гномское инженерное дело",
	["Goblin Engineering"] = "Гоблинское инженерное дело",
	["Jewelcrafting"] = "Ювелирное дело",
	["Leatherworking"] = "Кожевничество",
	["Master Axesmith"] = "Мастер школы Топора",
	["Master Hammersmith"] = "Мастер школы Молота",
	["Master Swordsmith"] = "Мастер школы Меча",
	["Mooncloth Tailoring"] = "Шитье из луноткани",
	["Shadoweave Tailoring"] = "Шитье из тенеткани",
	["Spellfire Tailoring"] = "Шитье из огненной чароткани",
	["Tailoring"] = "Портняжное дело",
	["Tribal Leatherworking"] = "Кожевничество: традиции предков",
	["Weaponsmith"] = "Оружейник",
}
	
else
	error(("%s: Locale %q not supported"):format(MAJOR_VERSION, GAME_LOCALE))
end
