local L = AceLibrary("AceLocale-2.2"):new("Mendeleev")

L:RegisterTranslations("ruRU", function() return {
	-- Russian localization by Lichery
	
	["KCI Integration"] = "Интеграция KCI",
	["Integrate into the KCI tooltip"] = "Интегрирование информации в KCI подсказку",
	--["integrate"] = true,
	--["sets"] = true,
	--["toggle"] = true,
	["Toggle Sets"] = "Переключить наборы",
	
	["Crafted by"] = "Создается",
	["Crafted by: "] = "Создано: ",
	
	["Recipe source"] = "Источник рецепта",
	["Recipe source: "] = "Источник рецепта: ",
	["Seasonal recipe"] = "Сезонные рецепты",
	["Recipe faction"] = "Рецепт фракции",
	["Vendor faction"] = "Торговец фракции",
	
	["Gathering skills"] = "Собирательное умение",
	["Mine Gems"] = "Камни горного дела",
	["Trade Skills"] = "Навык ремесла",
	["Class Reagents"] = "Классовые реагенты",
	["Zul'Gurub Enchants"] = "Наложение чар Зул'Гуруба",
	["Zul'Gurub Classes"] = "Классы Зул'Гуруба",
	["Zul'Gurub Coins"] = "Монеты Зул'Гуруба",
	["Ahn'Qiraj CC Classes"] = "Ан'Кираж CC классы",
	["Ahn'Qiraj BoN Classes"] = "Ан'Кираж BoN классы",
	["Food type"] = "Тип еды",
	["Booze"] = "Выпивка",
	["Lockpick value"] = "Значение взлома замков",
	["World Drops"] = "Мировая добыча",
	["World Boss Drops"] = "Мировая добыча с боссов",
	["Raid Zones"] = "Рейдовые зоны",
	["Raid Bosses"] = "Рейдовые боссы",
	["Instance zones"] = "Зоны подземелий",
	["Instance bosses"] = "Боссы подземелий",
	["Elemental bosses"] = "Боссы элементали",
	["Outdoor bosses"] = "Внешние боссы",
	["Four Dragons"] = "Четыре дракона",
	
	["Gathered by"] = "Собирается с",
	["Zul'Gurub Enchant"] = "Наложения чар Зул'Гуруба",
	["Used by"] = "Используется в",
	["Classes"] = "Классы",
	["Darkmoon Faire"] = "Ярмарка Новолуния",
	["Darkmoon Faire Card"] = "Карты Ярмарки Новолуния",
	["World Drop"] = "Мировая добыча",
	["World Boss Drop"] = "Мировая добыча с боссов",
	["Found in"] = "Содержится в",
	["Dropped by"] = "Добывается с",
	["Used in"] = "Используется в",
	["Reputaton item"] = "Предмет за репутацию",
	
	["Copper"]        = "Медная жила",
	["Tin"]           = "Оловянная жила",
	["Silver"]        = "Залежи серебра",
	["Iron"]          = "Залежи железа",
	["Gold"]          = "Золотая жила",
	["Mithril"]       = "Залежи мифрила",
	["Truesilver"]    = "Залежи истинного серебра",
	["Small Thorium"] = "Малая ториевая жила",
	["Hakkari Thorium"] = "Ториевая жила Хаккари",
	["Rich Thorium"]  = "Богатая ториевая жила",
	["Dark Iron"]     = "Залежи черного железа",
	
	["Fishing"]       = "Рыбная ловля",
	["Disenchant"]    = "Распыление",
	["Herbalism"]     = "Травничество",
	["Mining"]        = "Горное дело",
	["Skinning"]      = "Снятие шкур",
	["Alchemy"]       = "Алхимия",
	["Blacksmithing"] = "Кузнечное дело",
	["Cooking"]       = "Кулинария",
	["Enchanting"]    = "Наложение чар",
	["Engineering"]   = "Инженерное дело",
	["Firstaid"]      = "Первая помощь",
	["Leatherworking"]= "Кожевничество",
	["Tailoring"]     = "Портняжное дело",
	
	["Fish"]          = "Рыба",
	["Meat"]          = "Мясо",
	["Bread"]         = "Хлеб",
	["Conjured"]      = "Сотворяемое",
	["Cheese"]        = "Сыр",
	["Fruit"]         = "Фрукт",
	["Misc"]          = "Разное",
	["Fungus"]        = "Грибы",
	
	["Junk Items"]    = "Барахло",
	["Leather"]       = "Кожа",
	["Blue Dragon Card"] = "Карта Новолуния: Синий Дракон",
	["Heroism Card"]  = "Карта Новолуния: Героизм",
	["Twisting Nether Card"] = "Карта Новолуния: Круговерть Пустоты",
	["Maelstrom Card"]= "Карта Новолуния: Водоворот",
	
	["Lockpicking"]   = "Вскрытие замков",
	[" (Enchant)"]    = " (Чары)",
	["Trash Mobs"]    = "Существа",
	["Item ID"]        = "ID предмета",
	["Stacksize"]     = "Размер связки",
	["NoClue"]        = "Я не знаю ",
	
	-- Factions
	["Alliance"] = "Альянс",
	["Horde"] = "Орда",
	["Neutral"] = "Нейтральный",
	["Argent Dawn"] = "Серебряный Рассвет",
	["Cenarion Circle"] = "Круг Кенария",
	["Thorium Brotherhood"] = "Братство Тория",
	["Timbermaw Hold"] = "Древобрюхи",
	["Zandalar Tribe"] = "Племя Зандалар",
	["Ravenholdt"] = "Черный Ворон",
	
	-- Crafted by
	["Alchemy"] = "Алхимия",
	["Blacksmithing"] = "Кузнечное дело",
	["Armorsmithing"] = "Бронник",
	["Axesmithing"] = "Мастер школы топора",
	["Hammersmithing"] = "Мастер школы Молота",
	["Swordsmithing"] = "Мастер ковки клинков",
	["Weaponsmithing"] = "Оружейник",
	["Cooking"] = "Кулинария",
	["Engineering"] = "Инженерное дело",
	["Gnomish Engineering"] = "Гномское инженерное дело",
	["Goblin Engineering"] = "Гоблинское инженерное дело",
	["First Aid"] = "Первая помощь",
	["Leatherworking"] = "Кожевничество",
	["Dragonscale Leatherworking"] = "Кожевничество: чешуя драконов",
	["Elemental Leatherworking"] = "Кожевничество: сила стихий",
	["Tribal Leatherworking"] = "Кожевничество: традиции предков",
	["Tailoring"] = "Портняжное дело",
	
	-- Sources
	["Drop"] = "Добыча",
	["Vendor"] = "Торговец",
	["Quest"] = "Задание",
	["Crafted"] = "Изготовление",
	
	["UBRS"] = "UBRS",
	["LBRS"] = "LBRS",
}end)

if GetLocale() == "ruRU" then
	--Localized strings
	--This has a slightly different structure because of the way the closure in the cats works
	
	MendeleevLocals.Rep = {}
	MendeleevLocals.Rep[1] = " (Ненависть)"
	MendeleevLocals.Rep[2] = " (Враждебность)"
	MendeleevLocals.Rep[3] = " (Неприязнь)"
	MendeleevLocals.Rep[4] = " (Равнодушие)"
	MendeleevLocals.Rep[5] = " (Дружелюбие)"
	MendeleevLocals.Rep[6] = " (Уважение)"
	MendeleevLocals.Rep[7] = " (Почтение)"
	MendeleevLocals.Rep[8] = " (Превознесение)"
	
	MendeleevLocals.Dif = {}
	MendeleevLocals.Dif[0] = "(Очень легко)"
	MendeleevLocals.Dif[1] = "(Легко)"
	MendeleevLocals.Dif[2] = "(Средне)"
	MendeleevLocals.Dif[3] = "(Оптимально)"
	MendeleevLocals.Dif[4] = "(Трудно)"
end