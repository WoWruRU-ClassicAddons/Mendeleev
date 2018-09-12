	local BC = LibStub("LibBabble-Class-3.0"):GetLookupTable()
	local L  = AceLibrary("AceLocale-2.2"):new("Mendeleev")

	table.insert(MENDELEEV_SETS, {
		name = L["Tier 3 Set"],
		setindex = "GearSet.Tier 3",
		colour = "|cffB0C4DE",
		header = L["Tier 3 Set"],
		quality = 3,
		sets = {
			["GearSet.Tier 3.Druid.Dreamwalker Raiment"]=BC["Druid"],
			["GearSet.Tier 3.Hunter.Cryptstalker Armor"]=BC["Hunter"],
			["GearSet.Tier 3.Mage.Frostfire Regalia"]=BC["Mage"],
			["GearSet.Tier 3.Paladin.Redemption Armor"]=BC["Paladin"],
			["GearSet.Tier 3.Priest.Vestments of Faith"]=BC["Priest"],
			["GearSet.Tier 3.Rogue.Bonescythe Armor"]=BC["Rogue"],
			["GearSet.Tier 3.Shaman.The Earthshatterer"]=BC["Shaman"],
			["GearSet.Tier 3.Warlock.Plagueheart Raiment"]=BC["Warlock"],
			["GearSet.Tier 3.Warrior.Dreadnaught's Battlegear"]=BC["Warrior"],
		},
	})
	
	table.insert(MENDELEEV_SETS, {
		name = L["Tier 2.5 Set"],
		setindex = "GearSet.Ahn'Qiraj.40",
		colour = "|cffB0C4DE",
		header = L["Tier 2.5 Set"],
		quality = 3,
		sets = {
			["GearSet.Ahn'Qiraj.40.Druid.Genesis Raiment"]=BC["Druid"],
			["GearSet.Ahn'Qiraj.40.Hunter.Striker's Garb"]=BC["Hunter"],
			["GearSet.Ahn'Qiraj.40.Mage.Enigma Vestments"]=BC["Mage"],
			["GearSet.Ahn'Qiraj.40.Paladin.Avenger's Battlegear"]=BC["Paladin"],
			["GearSet.Ahn'Qiraj.40.Priest.Garments of the Oracle"]=BC["Priest"],
			["GearSet.Ahn'Qiraj.40.Rogue.Deathdealer's Embrace"]=BC["Rogue"],
			["GearSet.Ahn'Qiraj.40.Shaman.Stormcaller's Garb"]=BC["Shaman"],
			["GearSet.Ahn'Qiraj.40.Warlock.Doomcaller's Attire"]=BC["Warlock"],
			["GearSet.Ahn'Qiraj.40.Warrior.Conqueror's Battlegear"]=BC["Warrior"],
		},
	})
	
	table.insert(MENDELEEV_SETS, {
		name = L["Tier 2 Set"],
		setindex = "GearSet.Tier 2",
		colour = "|cffB0C4DE",
		header = L["Tier 2 Set"],
		quality = 3,
		sets = {
			["GearSet.Tier 2.Druid.Stormrage Raiment"]=BC["Druid"],
			["GearSet.Tier 2.Hunter.Dragonstalker Armor"]=BC["Hunter"],
			["GearSet.Tier 2.Mage.Netherwind Regalia"]=BC["Mage"],
			["GearSet.Tier 2.Paladin.Judgement Armor"]=BC["Paladin"],
			["GearSet.Tier 2.Priest.Vestments of Transcendence"]=BC["Priest"],
			["GearSet.Tier 2.Rogue.Bloodfang Armor"]=BC["Rogue"],
			["GearSet.Tier 2.Shaman.The Ten Storms"]=BC["Shaman"],
			["GearSet.Tier 2.Warlock.Nemesis Raiment"]=BC["Warlock"],
			["GearSet.Tier 2.Warrior.Battlegear of Wrath"]=BC["Warrior"],
		},
	})
	
	table.insert(MENDELEEV_SETS, {
		name = L["Tier 1 Set"],
		setindex = "GearSet.Tier 1",
		colour = "|cffB0C4DE",
		header = L["Tier 1 Set"],
		quality = 3,
		sets = {
			["GearSet.Tier 1.Druid.Cenarion Raiment"]=BC["Druid"],
			["GearSet.Tier 1.Hunter.Giantstalker Armor"]=BC["Hunter"],
			["GearSet.Tier 1.Mage.Arcanist Regalia"]=BC["Mage"],
			["GearSet.Tier 1.Paladin.Lawbringer Armor"]=BC["Paladin"],
			["GearSet.Tier 1.Priest.Vestments of Prophecy"]=BC["Priest"],
			["GearSet.Tier 1.Rogue.Nightslayer Armor"]=BC["Rogue"],
			["GearSet.Tier 1.Shaman.The Earthfury"]=BC["Shaman"],
			["GearSet.Tier 1.Warlock.Felheart Raiment"]=BC["Warlock"],
			["GearSet.Tier 1.Warrior.Battlegear of Might"]=BC["Warrior"],
		},
	})