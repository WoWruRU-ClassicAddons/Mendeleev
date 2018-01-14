local L = AceLibrary("AceLocale-2.2"):new("Mendeleev")

L:RegisterTranslations("ruRU", function() return {
	-- Russian localizatuon by Lichery
	
	["KCI Integration"] = "Интегрирование KCI",
	["Integrate into the KCI tooltip"] = "Интегрировать в KCI подсказку",
	["Toggle Sets"] = "Переключение комплектов",
	
	["Crafted by"] = "Создается",
	["Crafted by: "] = "Создано: ",
	
	["Recipe source"] = "Источник рецепта",
	["Recipe source: "] = "Источник рецепта: ",
	["Seasonal recipe"] = "Сезонный рецепт",
	["Recipe faction"] = "Рецепт фракции",
	["Vendor faction"] = "Рецепт торговца",
	
	["Gathering skills"] = "Собирательное умение",
	["Mine Gems"] = "Камни горного дела",
	["Trade Skills"] = "Навык ремесла",
	["Class Reagents"] = "Классовые реагенты",
	["Zul'Gurub Enchants"] = "Наложение чар Зул'Гуруба",
	["Zul'Gurub Classes"] = "Классы Зул'Гуруба",
	["Zul'Gurub Coins"] = "Монеты Зул'Гуруба",
	["Ahn'Qiraj CC Classes"] = "Ан'Кираж CC классы", --?
	["Ahn'Qiraj BoN Classes"] = "Ан'Кираж BoN классы", --?
	["Food type"] = "Тип еды",
	["Booze"] = "Выпивка",
	["Lockpick value"] = "Значение взлома замков",
	["World Drops"] = "Мировая добыча",
	["World Boss Drops"] = "Добыча мировых боссов",
	["Raid Zones"] = "Рейдовые зоны",
	["Raid Bosses"] = "Рейдовые боссы",
	["Instance zones"] = "Зоны подземелий",
	["Instance bosses"] = "Боссы подземелий",
	["Elemental bosses"] = "Элементальные боссы",
	["Outdoor bosses"] = "Внешние боссы",
	["Four Dragons"] = "Четыре дракона",
	
	["Gathered by"] = "Собирается с",
	["Zul'Gurub Enchant"] = "Наложение чар Зул'Гуруба",
	["Used by"] = "Используется в",
	["Classes"] = "Классы",
	["Darkmoon Faire"] = "Ярмарка Новолуния",
	["Darkmoon Faire Card"] = "Карта Ярмарки Новолуния",
	["World Drop"] = "Мировая добыча",
	["World Boss Drop"] = "Добыча мировых боссов",
	["Found in"] = "Находится в",
	["Dropped by"] = "Добывается с",
	["Used in"] = "Реагент для",
	["Reputaton item"] = "Предмет за репутацию",
	
	["Copper"]        = "Медная жила",
	["Tin"]           = "Оловянная жила",
	["Silver"]        = "Серебрянная жила",
	["Iron"]          = "Залежи железа",
	["Gold"]          = "Золотая жила",
	["Mithril"]       = "Мифриловые залежи",
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
	["Blue Dragon Card"] = "Карта Синий Дракон",
	["Heroism Card"]  = "Карта Героизм",
	["Twisting Nether Card"] = "Карта Круговерть Пустоты",
	["Maelstrom Card"] = "Карта Водоворот",
	
	["Lockpicking"]   = "Вскрытие замков",
	[" (Enchant)"]    = " (Чары)",
	["Trash Mobs"]    = "Существа",
	["Item ID"]        = "ID предмета",
	["Stacksize"]     = "Размер связки",
	["NoClue"]        = "Я не знаю ",
	
	-- Factions
	["Alliance"] = "Альянс",
	["Horde"] = "Орда",
	["Neutral"] = "Оспариваемая",
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
	["Axesmithing"] = "Школа Топора",
	["Hammersmithing"] = "Школа Молота",
	["Swordsmithing"] = "Ковка клинков",
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
	["Crafted"] = "Создаваемое",
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