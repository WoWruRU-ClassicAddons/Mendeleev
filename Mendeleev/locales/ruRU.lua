local L = AceLibrary("AceLocale-2.2"):new("Mendeleev")

L:RegisterTranslations("ruRU", function() return {
	-- Russian localization by Lichery
	["Toggle sets."] = "Переключение наборов.",
	["Toggle sets from showing information in the tooltip."] = "Переключает наборы с отображением информации во всплывающей подсказке.",
	["Toggle sets in the %s category."] = "Переключает наборы в категории %s.",
	["Toggle %s."] = "Переключить %s.",
	["Show item level"] = "Показать уровень предмета",
	["Toggle showing the item level in the tooltip."] = "Переключает отображение уровня предмета во всплывающей подсказке.",
	["Show item identifier"] = "Показать ID предмета",
	["Toggle showing the item identifier in the tooltip."] = "Переключает отображение ID предмета во всплывающей подсказке.",
	["Show item count"] = "Показать подсчет предметов",
	["Toggle showing the item count in the tooltip."] = "Переключает отображение подсчета предметов во всплывающей подсказке.",
	["Show stack size"] = "Показать размер связки",
	["Toggle showing the stack size in the tooltip."] = "Переключает отображение размера связки во всплывающей подсказке.",
	["Show 'used in' tree"] = "Показать дерево 'Используется в'",
	["Toggle showing the 'used in' tree in the tooltip."] = "Переключает отображение дерева 'Используется в' в подсказке.",
	["Limit 'used in' tree to craftable"] = "Предел дерева 'Используется в' в таблице ремесел",
	["Toggle limiting the 'used in' tree to items the char can craft."] = "Переключает предел дерева 'Используется в' для предметов, которые персонаж может создать.",
	["Show icons in 'used in' tree"] = "Показать иконки в дереве 'Используется в'",
	["Toggle showing of icons in the 'used in' tree."] = "Переключает отображение иконок в дереве 'Используется в'.",
	["Populate WDB"] = "Заполнение кэша",
	["Populating all items in WDB."] = "Заполняет все предметы в кэш.",
	["Item ID"] = "ID предмета",
	["iLevel"] = "Уровень предмета",
	["You have"] = "У вас есть",
	["Stacksize"] = "Размер связки",
	
	["Crafted by"] = "Создается",
	["Component in"] = "Компонент в",
	
	["Recipe source"] = "Источник рецепта",
	["Lockpicking"] = "Вскрытие замков",
	["Gathering skills"] = "Собирательное умение",
	["Mine Gems"] = "Камни горного дела",
	["Trade skills"] = "Навык ремесла",
	["Class Reagents"] = "Классовые реагенты",
	["Food type"] = "Тип еды",
	["Booze"] = "Выпивка",
	["Elemental bosses"] = "Боссы элементали",
	["Outdoor bosses"] = "Внешние боссы",
	--["Outdoor bosses - Outland"] = true,
	["Four Dragons"] = "Четыре дракона",
	
	["Gathered by"] = "Собирается с",
	["Used by"] = "Используется в",
	["Classes"] = "Классы",
	["Darkmoon Faire"] = "Ярмарка Новолуния",
	["Darkmoon Faire Card"] = "Карты Ярмарки Новолуния",
	["Found in"] = "Содержится в",
	["Dropped by"] = "Добывается с",
	["Used in"] = "Используется в",
	
	["Fish"]          = "Рыба",
	["Meat"]          = "Мясо",
	["Bread"]         = "Хлеб",
	["Conjured"]      = "Сотворяемое",
	["Cheese"]        = "Сыр",
	["Fruit"]         = "Фрукт",
	["Misc"]          = "Разное",
	["Fungus"]        = "Грибы",
	
	-- Darkmoon Faire
	["Junk Items"]    = "Барахло",
	["Leather"]       = "Кожа",
	["Blue Dragon Card"] = "Карта Новолуния: Синий Дракон",
	["Heroism Card"]  = "Карта Новолуния: Героизм",
	["Twisting Nether Card"] = "Карта Новолуния: Круговерть Пустоты",
	["Maelstrom Card"]= "Карта Новолуния: Водоворот",
	--["Crusade Card"] = true,
	--["Vengeance Card"] = true,
	--["Madness Card"] = true,
	--["Wrath Card"] = true,
	
	-- Sources
	["Drop"] = "Добыча",
	["Vendor"] = "Торговец",
	["Quest"] = "Задание",
	["Crafted"] = "Изготовление",
	
	["UBRS"] = "UBRS",
	["LBRS"] = "LBRS",
	
	--["Heroic"] = true,
	
	-- Tier Sets
	["Tier 1 Set"] = "Комплект Тир 1",
	["Tier 2 Set"] = "Комплект Тир 2",
	["Tier 2.5 Set"] = "Комплект Тир 2.5",
	["Tier 3 Set"] = "Комплект Тир 3",
	--["Tier 4 Set"] = true,
	--["Tier 5 Set"] = true,
	--["Tier 6 Set"] = true,
	
	-- Arena Sets
	--["Arena - Season 1 Set"] = true,
	--["Arena - Season 2 Set"] = true,
	--["Arena - Season 3 Set"] = true,
	--["Arena - Season 4 Set"] = true,
	
	["%d%% alc/vol (%d proof)"] = "%d%% алк./об. (пруф %d)",
	[" (%d tickets)"] = " (%d билетов)",

	-- Categories
	["Consumable"] = "Расходуемое",
	["Gear"] = "Экипировка",
	["GearSet"] = "Комплект экипировки",
	["InstanceLoot"] = "Добыча подземелья",
	--["InstanceLootHeroic"] = true,
	["Misc"] = "Разное",
	["QuestMats"] = "Предмет для задания",
	["Reagent"] = "Реагент",
	["Tradeskill"] = "Профессии",
	
	--["Badge of Justice"] = true,
	--["G'eras"] = true,
	--["Smith Hauthaa"] = true,
	["Trash Mobs"] = "Существа",

	-- Timed Reward Chest
	--["Timed Reward Chest1"] = true,
	--["Timed Reward Chest2"] = true,
	--["Timed Reward Chest3"] = true,
	--["Timed Reward Chest4"] = true,
	
	["Poisons"] = "Яды",
}end)
