local L = AceLibrary("AceLocale-2.2"):new("Mendeleev")

L:RegisterTranslations("deDE", function() return {
	--["Hoverlink"] = true,
	--["Enable display tooltip while hovering hyperlink in ChatFrame."] = true,
	--["GameTooltip"] = true,
	--["Standard tooltip."] = true,
	--["ItemRefTooltip"] = true,
	--["Tooltip when opening links from the chat."] = true,
	--["ShoppingTooltip"] = true,
	--["Comparison tooltip."] = true,
	["Toggle sets."] = "Sets ein-/ausschalten.",
	["Toggle sets from showing information in the tooltip."] = "Sets zur Anzeige der Informationen im Tooltip ein-/ausschalten.",
	["Toggle sets in the %s category."] = "Sets in der Kategorie %s ein-/ausschalten.",
	["Toggle %s."] = "%s ein/aus.",
	["Show item level"] = "Item Level anzeigen",
	["Toggle showing the item level in the tooltip."] = "Die Anzeige des Item Levels im Tooltip ein-/ausschalten.",
	["Show item identifier"] = "Item ID anzeigen",
	["Toggle showing the item identifier in the tooltip."] = "Die Anzeige der Item ID ein-/ausschalten.",
	--["Show item count on your character"] = true,
	--["Toggle showing the item count on your character in the tooltip."] = true,
	--["Show item count on your account"] = true,
	--["Toggle showing the item count on your account in the tooltip."] = true,
	["Show stack size"] = "Stapelgröße anzeigen",
	["Toggle showing the stack size in the tooltip."] = "Die Anzeige der Stapelgröße ein-/ausschalten.",
	["Show 'used in' tree"] = "'Verwendet in'-Baum anzeigen",
	["Toggle showing the 'used in' tree in the tooltip."] = "Die Anzeige des 'Verwendet in'-Baumes ein-/ausschalten.",
	["Show icons in 'used in' tree"] = "Symbole im 'Verwendet in'-Baum anzeigen",
	["Toggle showing of icons in the 'used in' tree."] = "Symbolanzeige im 'Verwendet in'-Baum ein-/ausschalten.",
	["Minimal skill for 'used in' tree"] = "Mindest-Skill für 'Verwendet in'-Baum",
	["Minimal skill advance for an item to show up in the 'used in' tree."] = "Mindest-Skill eines Gegenstandes, damit dieser im 'Verwendet in'-Baum angezeigt wird.",
	["Minimal skill for 'used in' tree (shift)"] = "Mindest-Skill für 'Verwendet in'-Baum (Shift)",
	["Minimal skill advance for an item to show up in the 'used in' tree if Shift is held."] = "Mindest-Skill eines Gegenstandes (während Shift gedrückt wird), damit dieser im 'Verwendet in'-Baum angezeigt wird.",
	--["Show item price"] = true,
	--["Displays the price of the item in the tooltip."] = true,
	["TRADESKILL_UNKNOWN"] = "unbekannt",
	["TRADESKILL_TRIVIAL"] = "trivial",
	["TRADESKILL_EASY"] = "leicht",
	["TRADESKILL_MEDIUM"] = "mittel",
	["TRADESKILL_OPTIMAL"] = "optimal",
	["Item ID"] = "Item ID",
	["iLevel"] = "Item Level",
	["You have"] = "Du hast",
	--["You have on account"] = true,
	["Stacksize"] = "Stapelgröße",
	--["N/A"] = true,
	
	["Bought for"] = "Gekauft für",
	["Crafted by"] = "Hergestellt von",
	["Component in"] = "Bestandteil von",
	
	["Recipe source"] = "Rezept-Herkunft",
	["Lockpicking"] = "Schlossknacken",
	["Gathering skills"] = "Sammelfertigkeiten",
	["Mine Gems"] = "Edelsteine abbauen",
	["Trade skills"] = "Handelsfertigkeiten",
	["Class Reagents"] = "Klassenreagenzien",
	["Food type"] = "Nahrungsmittelart",
	["Booze"] = "Alkohol",
	["Elemental bosses"] = "Elementar Bosse",
	["Outdoor bosses"] = "Outdoor Bosse",
	["Four Dragons"] = "Vier Drachen",
	
	["Gathered by"] = "Gesammelt von",
	["Used by"] = "Verwendet von",
	["Classes"] = "Klassen",
	["Darkmoon Faire"] = "Dunkelmond-Jahrmarkt",
	["Darkmoon Faire Card"] = "Dunkelmond-Jahrmarkt Karte",
	["Found in"] = "Gefunden in",
	["Dropped by"] = "Gedroppt von",
	["Used in"] = "Verwendet in",
	["Fits special bag"] = "Spezialtasche",
	["SPECIALBAG_HERB"] = "Kräuterkunde",
	["SPECIALBAG_ENCHANTING"] = "Verzauberkunst",
	["SPECIALBAG_SOULSHARD"] = "Seelensplitter",
	
	["Fish"] = "Fisch",
	["Meat"] = "Fleisch",
	["Bread"] = "Brot",
	["Conjured"] = "Herbeigezaubert",
	["Cheese"] = "Käse",
	["Fruit"] = "Frucht",
	["Misc"] = "Sonstiges",
	["Fungus"] = "Pilz",
	
	-- Darkmoon Faire
	["Junk Items"] = "Ramsch Gegenstände",
	["Leather"] = "Leder",
	["Blue Dragon Card"] = "Blauer Drache",
	["Heroism Card"] = "Heldentum",
	["Twisting Nether Card"] = "Wirbelnder Nether",
	["Maelstrom Card"] = "Maelstrom",
	
	-- Sources
	["Drop"] = "Drop",
	["Vendor"] = "Händler",
	["Quest"] = "Quest",
	["Crafted"] = "Hergestellt",
	
	["UBRS"] = "UBRS",
	["LBRS"] = "LBRS",
	
	-- Tier Sets
	["Tier 1 Set"] = "T1 Set",
	["Tier 2 Set"] = "T2 Set",
	["Tier 2.5 Set"] = "T2.5 Set",
	["Tier 3 Set"] = "T3 Set",
	
	["%d%% alc/vol (%d proof)"] = " %d%% Vol.",
	[" (%d tickets)"] = " (%d Tickets)",
	
	-- Ore Nodes
	["Copper Vein"] = "Kupfervorkommen",
	["Tin Vein"] = "Zinnvorkommen",
	["Silver Vein"] = "Silbervorkommen",
	["Iron Deposit"] = "Eisenvorkommen",
	["Gold Vein"] = "Goldvorkommen",
	["Mithril Deposit"] = "Mithrilablagerung",
	["Truesilver Deposit"] = "Echtsilberablagerung",
	["Small Thorium Vein"] = "Kleines Thoriumvorkommen",
	["Hakkari Thorium Vein"] = "Hakkari Thoriumvorkommen",
	["Rich Thorium Vein"] = "Reiches Thoriumvorkommen",
	["Ooze Covered Rich Thorium Vein"] = "Schlammbedecktes reiches Thoriumvorkommen",
	["Dark Iron Deposit"] = "Dunkeleisenablagerung",
	
	-- Categories
	["Consumable"] = "Verbrauchbar",
	["Gear"] = "Ausrüstung",
	["GearSet"] = "Ausrüstungs-Set",
	["InstanceLoot"] = "Instanz-Loot",
	["Misc"] = "Sonstiges",
	["QuestMats"] = "Quest-Mats",
	["Reagent"] = "Reagenz",
	["Tradeskill"] = "Tradeskill",
	
	["Trash Mobs"] = "Trash Mobs",
}end)