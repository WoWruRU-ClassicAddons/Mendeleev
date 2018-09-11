local L = AceLibrary("AceLocale-2.2"):new("Mendeleev")
--local PT = LibStub("LibPeriodicTable-3.1")
local PT = AceLibrary("PeriodicTable-3.0")
local BTS = AceLibrary("Babble-Tradeskill-2.2")

local _G = getfenv()

-- We cache the results, so that we don't have to do a PT lookup for every item.
local cache = {}
local scanned = {}

Mendeleev = AceLibrary("AceAddon-2.0"):new("AceConsole-2.0", "AceDB-2.0", "AceHook-2.1", "AceEvent-2.0")

local options = {
	type = "group",
	args = {
		sets = {
			name = L["Toggle sets."],
			desc = L["Toggle sets from showing information in the tooltip."],
			type = "group",
			args = {},
		},
		itemLevel = {
			type = "toggle",
			name = L["Show item level"],
			desc = L["Toggle showing the item level in the tooltip."],
			get = function() return Mendeleev.db.profile.showItemLevel end,
			set = function(v) Mendeleev.db.profile.showItemLevel = v end,
		},
		itemId = {
			type = "toggle",
			name = L["Show item identifier"],
			desc = L["Toggle showing the item identifier in the tooltip."],
			get = function() return Mendeleev.db.profile.showItemID end,
			set = function(v) Mendeleev.db.profile.showItemID = v end,
		},
		itemCount = {
			type = "toggle",
			name = L["Show item count"],
			desc = L["Toggle showing the item count in the tooltip."],
			get = function() return Mendeleev.db.profile.showItemCount end,
			set = function(v) Mendeleev.db.profile.showItemCount = v end,
		},
		stackSize = {
			type = "toggle",
			name = L["Show stack size"],
			desc = L["Toggle showing the stack size in the tooltip."],
			get = function() return Mendeleev.db.profile.showStackSize end,
			set = function(v) Mendeleev.db.profile.showStackSize = v end,
		},
		usedInTree = {
			type = "toggle",
			name = L["Show 'used in' tree"],
			desc = L["Toggle showing the 'used in' tree in the tooltip."],
			get = function() return Mendeleev.db.profile.showUsedInTree end,
			set = function(v) Mendeleev.db.profile.showUsedInTree = v end,
		},
		usedInTreeSelf = {
			type = "toggle",
			name = L["Limit 'used in' tree to craftable"],
			desc = L["Toggle limiting the 'used in' tree to items the char can craft."],
			get = function() return Mendeleev.db.profile.limitUsedInTree end,
			set = function(v) Mendeleev.db.profile.limitUsedInTree = v end,
		},
		--[[
		usedInTreeIcons = { --?
			type = "toggle",
			name = L["Show icons in 'used in' tree"],
			desc = L["Toggle showing of icons in the 'used in' tree."],
			get = function() return Mendeleev.db.profile.UsedInTreeIcons end,
			set = function(v) Mendeleev.db.profile.UsedInTreeIcons = v end,
		},--]]
		populateWDB = {
			type = "execute",
			name = L["Populate WDB"],
			desc = L["Populating all items in WDB."],
			func = "PopulateWDB",
		}
	}
}

function Mendeleev:OnInitialize()	
	self:RegisterDB("MendeleevDB")
	self:RegisterDefaults("profile", {
		showItemLevel = true,
		showItemID = true,
		showItemCount = true,
		showStackSize = true,
		showUsedInTree = true,
		limitUsedInTree = false,
		UsedInTreeIcons = false,
		sets = {},
	})

	local t = options.args.sets.args

	for _, v in ipairs(MENDELEEV_SETS) do
		local key = v.setindex
		local period = select(2, string.find(key, "%.")) or 0
		local parent = string.sub(key, 1, period - 1)
		if not t[parent] then
			t[parent] = {
				name = L[parent],
				desc = string.format(L["Toggle sets in the %s category."], L[parent]),
				type = "group",
				args = {},
			}
		end
		t[parent].args[key] = {
			name = v.name,
			desc = string.format(L["Toggle %s."], v.name),
			type = "toggle",
			get  = function() return not self.db.profile.sets[key] end,
			set  = function(val) self.db.profile.sets[key] = not val cache = {} scanned = {} end,
		}
	end

	self:RegisterChatCommand({"/mendeleev"}, options)
end

function Mendeleev:OnEnable(first)
	self:HookLinkFunckions()
	self:HookScript(GameTooltip, "OnShow", function() self:Tooltip_OnShow(GameTooltip) end)
	self:HookScript(GameTooltip, "OnHide", function() self:Tooltip_OnHide(GameTooltip) end)
	
	if AtlasLootTooltip then
		self:HookScript(AtlasLootTooltip, "OnShow", function() self:Tooltip_OnShow(AtlasLootTooltip) end)
		self:HookScript(AtlasLootTooltip, "OnHide", function() GameTooltip.itemLink = nil end)
	end

	if first then
		-- load our sets into the cache
		for _,v in ipairs(MENDELEEV_SETS) do
			PT:GetSetTable(v.setindex)
		end
		collectgarbage()
	end

	self:RegisterEvent("TRADE_SKILL_SHOW", "ScanTradeSkill")
	self:RegisterEvent("CRAFT_SHOW", "ScanCraft")
end

function Mendeleev:OnDisable()
	self:UnregisterAllEvents()
end

function Mendeleev:GetUsedInTable(skill, reagentid)
	local ret
	local ptrmr = PT:GetSetTable("TradeskillResultMats.Reverse." .. skill)
	if PT:IsSetMulti("TradeskillResultMats.Reverse." .. skill) then
		for k, v in ipairs(ptrmr) do
			if type(v) == "table" then
				local guit = self:GetUsedInTable(v.set, reagentid)
				if guit then
					if not ret then 
						ret = {}
					end
					for k, v in pairs(guit) do
						ret[k] = v
					end
				end
			end
		end
	else
		local usedin = ptrmr and ptrmr[tonumber(reagentid)]
		if usedin then
			for item, num in string.gmatch(usedin, "(%d+)x(%d+)") do
				item = tonumber(item)
				num = tonumber(num)
				if not ret then 
					ret = {}
				end
				ret[item] = num
			end
		end
	end
	return ret
end

local tradeskillNames = {
	["Alchemy"] = BTS["Alchemy"],
	["Blacksmithing.Armorsmith"] = BTS["Armorsmith"],
	["Blacksmithing.Basic"] = BTS["Blacksmithing"],
	["Blacksmithing.Weaponsmith.Axesmith"] = BTS["Master Axesmith"],
	["Blacksmithing.Weaponsmith.Basic"] = BTS["Weaponsmith"],
	["Blacksmithing.Weaponsmith.Hammersmith"] = BTS["Master Hammersmith"],
	["Blacksmithing.Weaponsmith.Swordsmith"] = BTS["Master Swordsmith"],
	["Cooking"] = BTS["Cooking"],
	["Enchanting"] = BTS["Enchanting"],
	["Engineering.Basic"] = BTS["Engineering"],
	["Engineering.Gnomish"] = BTS["Gnomish Engineering"],
	["Engineering.Goblin"] = BTS["Goblin Engineering"],
	["First Aid"] = BTS["First Aid"],
	["Jewelcrafting"] = BTS["Jewelcrafting"],
	["Leatherworking.Basic"] = BTS["Leatherworking"],
	["Leatherworking.Dragonscale"] = BTS["Dragonscale Leatherworking"],
	["Leatherworking.Elemental"] = BTS["Elemental Leatherworking"],
	["Leatherworking.Tribal"] = BTS["Tribal Leatherworking"],
	["Poisons"] = L["Poisons"],
	["Smelting"] = BTS["Smelting"],
	["Tailoring.Basic"] = BTS["Tailoring"],
	["Tailoring.Mooncloth"] = BTS["Mooncloth Tailoring"],
	["Tailoring.Shadoweave"] = BTS["Shadoweave Tailoring"],
	["Tailoring.Spellfire"] = BTS["Spellfire Tailoring"],
}

function Mendeleev:GetLinesForTradeskillReagent(skill, reagent)
	if type(skill) ~= "string" or type(reagent) ~= "string" then return end
	local id = string.match(reagent, "^|%x+|Hitem:(%d+):")
	local ret = {}
	local count = 0
	local db = self.db.profile
	for item, num in pairs(self:GetUsedInTable(skill, id) or {}) do
		count = count + 1
		local name = GetItemInfo(item) or item
		if name then
			table.insert(ret, string.format("%s (%s)", name, num))
		end
	end
	if count > 0 then
		return string.format("%s (%d)", tradeskillNames[skill], count)
	end
	return ret
end

local cacheUsedInFull = {}

local id2skill = setmetatable({}, {__index = function(self, key) local value = -1; self[key] = value; return value end})
--local id2skill = {}

local tradeskills = {
	"Alchemy",
	"Blacksmithing.Armorsmith",
	"Blacksmithing.Basic",
	"Blacksmithing.Weaponsmith.Axesmith",
	"Blacksmithing.Weaponsmith.Basic",
	"Blacksmithing.Weaponsmith.Hammersmith",
	"Blacksmithing.Weaponsmith.Swordsmith",
	"Cooking",
	"Engineering.Basic",
	"Engineering.Gnomish",
	"Engineering.Goblin",
	"First Aid",
	"Jewelcrafting",
	"Leatherworking.Basic",
	"Leatherworking.Dragonscale",
	"Leatherworking.Elemental",
	"Leatherworking.Tribal",
	"Poisons",
	"Smelting",
	"Tailoring.Basic",
	"Tailoring.Mooncloth",
	"Tailoring.Shadoweave",
	"Tailoring.Spellfire",
}

local function SortUsedInTree(a,b)
	if (not a or not b) then
		return true
	end
	if (a[3] > b[3]) then
		return true
	end
	if (a[3] < b[3]) then
		return false
	end
	return (a[2] and b[2] and (a[2] < b[2]))
end

function Mendeleev:GetUsedInFullTable(id)
	if cacheUsedInFull[id] == nil then
		for _, skill in ipairs(tradeskills) do
			local usedin = self:GetUsedInTable(skill, id)
			if usedin then
				for item, num in pairs(usedin) do
					 if not cacheUsedInFull[id] then 
						cacheUsedInFull[id] = {}
					end
					cacheUsedInFull[id][item] = num
				end
			end
		end
		if not cacheUsedInFull[id] then
			cacheUsedInFull[id] = false
		end
	end
	return cacheUsedInFull[id]
end

function Mendeleev:GetUsedInTree(id, history)
	local data = {}
	local skill = id2skill[id] or 0
	local usedin = self:GetUsedInFullTable(id)
	if usedin then
		for k, v in pairs(usedin) do
			if id2skill[k] and ((IsShiftKeyDown() or not self.db.profile.limitUsedInTree) or id2skill[k] >= 0) then
				if string.find(history, ">"..k.."<") then
					table.insert(data, {k, GetItemInfo(k) or false, id2skill[k], "..."})
				else
					local tdata, tskill = self:GetUsedInTree(k, history..">"..k.."<")
					if tskill > skill then
						skill = tskill
					end
					table.insert(data, tdata)
				end
			end
		end
	end
	table.sort(data, SortUsedInTree)
	table.insert(data, 1, id)
	table.insert(data, 2, GetItemInfo(id) or false)
	table.insert(data, 3, skill)
	return data, skill
end

function Mendeleev:GetUsedInList(tree, level, counttable, countmult)
	local colour = {
		[-1] = "|cffff0000",
		[0] = "|cffbbbbbb",
		[1] = "|cff00cc00",
		[2] = "|cffffff00",
		[3] = "|cffff6600",
		[4] = "|cffff0000",
	}

	local UsedInTreeIcons = self.db.profile.UsedInTreeIcons

	local list = {}
	local didpoints = false
	for i = 4, getn(tree) do
		local v = tree[i]
		if level < 2 or v[3] > 0 then
			if UsedInTreeIcons then
				local _,_,_,_,_,_,_,_, icontag = GetItemInfo(v[1])
				icontag = icontag and "|T"..icontag..":10|t " or ""
				table.insert(list, string.rep("    ", level).."- "..colour[id2skill[v[1]] or -1]..icontag..(v[2] or v[1]).."|r")
			else
				table.insert(list, string.rep("    ", level).."- "..colour[id2skill[v[1]] or -1]..(v[2] or v[1]).."|r")
			end
			table.insert(list, countmult * counttable[v[1]])
			if type(v[4]) == "table" then
				local slist = self:GetUsedInList(v, level+1, cacheUsedInFull[v[1]], countmult * counttable[v[1]])
				if getn(slist) > 0 then
					if v[3] > 0 then
						for _, line in pairs(slist) do
							table.insert(list, line)
						end
					else
						table.insert(list, string.rep("    ", level+1).."- "..colour[0].."...|r")
						table.insert(list, "")
					end
				end
			elseif v[4] == "..." then
				table.insert(list, string.rep("    ", level+1).."...")
				table.insert(list, "")
			end
		elseif v[3] == 0 and not didpoints then
			table.insert(list, string.rep("    ", level).."- "..colour[0].."...|r")
			table.insert(list, "")
			didpoints = true
		end
	end
	return list
end

local skillquals = {trivial = 0, easy = 1, medium = 2, optimal = 3, difficult = 4}

function Mendeleev:ScanTradeSkill()
	if TradeSkillFrame ~= nil and TradeSkillFrame:IsVisible() then
		for i=1, GetNumTradeSkills() do
			local _, type, _, _ = GetTradeSkillInfo(i)
			if type ~= "header" then
				local item = GetTradeSkillItemLink(i)
				if item then
					local id = string.match(item, "item:(%d+):")
					if id then
						id2skill[tonumber(id)] = skillquals[type]
					end
				end
			end
		end
	end
end

function Mendeleev:ScanCraft()
	if CraftFrame ~= nil and CraftFrame:IsVisible() then
		for i=1, GetNumCrafts() do
			local _, type, _, _ = GetCraftInfo(i)
			if type ~= "header" then
				local item = GetCraftItemLink(i)
				if item then
					local id = string.match(item, "item:(%d+):")
					if id then
						id2skill[tonumber(id)] = skillquals[type]
					end
				end
			end
		end
	end
end

function Mendeleev:Tooltip_OnShow(tooltip)
	local item = tooltip.itemLink
	if not item then return end
	
	local id = string.match(item, "^|%x+|Hitem:(%d+):")
	local _,_,quality,_,_,_,stack = GetItemInfo(id)
	local db = self.db.profile

	if not scanned[item] then
		for _,v in ipairs(MENDELEEV_SETS) do
			if not db.sets[v.setindex] and quality >= v.quality then
				local lines = nil
				local c = v.colour or "|cffffffff"
				for set,desc in pairs(v.sets) do
					local val = PT:ItemInSet(item,set)
					if val then
						if not lines then lines = {} end
						if type(v.descfunc) == "function" then
							local ret = v.descfunc(desc, item, val)
							if type(ret) == "table" then
								for i, v in ipairs(ret) do
									table.insert(lines, c .. ret[i] .. "|r")
								end
							elseif type(ret) == "string" then
								table.insert(lines, c .. ret .. "|r")
							end
						else
							table.insert(lines, c .. desc .. (type(val) ~= "boolean" and v.useval and v.useval(val, item) or "") .. "|r")
						end
					end
				end
				if lines then
					table.sort(lines)
					if not cache[item] then cache[item] = {} end
					cache[item][v.setindex] = {c .. v.header .. "|r", lines}
				end
			end
		end
		scanned[item] = true
	end

	if cache[item] then
		for k, v in pairs(cache[item]) do
			local first = 1
			for i, line in ipairs(v[2]) do
				if first == 1 then
					tooltip:AddDoubleLine(v[1], line)
					first = 0
				else
					tooltip:AddDoubleLine(" ", line)
				end
			end
		end
	end

	if db.showItemCount then
		local count = GetItemCount(item, false)
		local bankcount = GetItemCount(item, true) - count
		if count + bankcount > 0 then
			tooltip:AddDoubleLine(L["You have"], count..(bankcount > 0 and (" (+"..bankcount..")") or ""))
		end
	end

	if stack and stack > 1 and db.showStackSize then
		tooltip:AddDoubleLine(L["Stacksize"], stack)
	end

	if id and db.showItemID then
		tooltip:AddDoubleLine(L["Item ID"], id)
	end

	if db.showItemLevel then
		local _,_, itemRarity,_,_,_,_,itemSlot = GetItemInfo(id)
		local r,g,b = GetItemQualityColor(itemRarity)
		local itemLevel = self.ItemLevelsDatabase[tonumber(itemID)] or 0
		local score = (itemRarity * itemLevel) * (itemSlot == "INVTYPE_2HWEAPON" and 2 or 1)
    if score and score > 0 then
			tooltip:AddDoubleLine(L["iLevel"], score, 1, .82, 0, r, g, b)
		end
	end

	if db.showUsedInTree then
		local t = self:GetUsedInTree(id, ">"..id.."<")
		local l = self:GetUsedInList(t, 1, cacheUsedInFull[id], 1)
		local header = L["Used in"]
		for i = 1, getn(l), 2 do
			if header then
				tooltip:AddLine(header)
				header = nil
			end
			tooltip:AddDoubleLine(l[i], l[i+1])
		end
	end

	tooltip:Show()
end

function Mendeleev:Tooltip_OnHide(tooltip)
	tooltip.itemLink = nil
end

function Mendeleev:PopulateWDB()
	for item_id = 1, 25818 do
		local info = GetItemInfo('item:' .. item_id)
		if not info then
			GameTooltip:SetHyperlink('item:' .. item_id) -- add item in cache!
		end
	end
end

function Mendeleev:HookLinkFunckions()
	local function GetItemLinkByName(name)
		for itemID = 1, 25818 do
			local itemName, hyperLink, itemQuality = GetItemInfo(itemID)
			if itemName and itemName == name then
				local _, _, _, hex = GetItemQualityColor(tonumber(itemQuality))
				return hex.. "|H"..hyperLink.."|h["..itemName.."]|h|r"
			end
		end
	end
	
	local MendeleevHookSetBagItem = GameTooltip.SetBagItem
	function GameTooltip.SetBagItem(Mendeleev, container, slot)
    GameTooltip.itemLink = GetContainerItemLink(container, slot)
    _, GameTooltip.itemCount = GetContainerItemInfo(container, slot)
    return MendeleevHookSetBagItem(Mendeleev, container, slot)
	end
	
	local MendeleevHookSetQuestLogItem = GameTooltip.SetQuestLogItem
	function GameTooltip.SetQuestLogItem(Mendeleev, itemType, index)
    GameTooltip.itemLink = GetQuestLogItemLink(itemType, index)
    if not GameTooltip.itemLink then return end
    return MendeleevHookSetQuestLogItem(Mendeleev, itemType, index)
	end
	
	local MendeleevHookSetQuestItem = GameTooltip.SetQuestItem
	function GameTooltip.SetQuestItem(Mendeleev, itemType, index)
    GameTooltip.itemLink = GetQuestItemLink(itemType, index)
    return MendeleevHookSetQuestItem(Mendeleev, itemType, index)
	end
	
	local MendeleevHookSetLootItem = GameTooltip.SetLootItem
	function GameTooltip.SetLootItem(Mendeleev, slot)
    GameTooltip.itemLink = GetLootSlotLink(slot)
    MendeleevHookSetLootItem(Mendeleev, slot)
	end
	
	local MendeleevHookSetInboxItem = GameTooltip.SetInboxItem
	function GameTooltip.SetInboxItem(Mendeleev, mailID, attachmentIndex)
    local itemName, itemTexture, inboxItemCount, inboxItemQuality = GetInboxItem(mailID)
    GameTooltip.itemLink = GetItemLinkByName(itemName)
    return MendeleevHookSetInboxItem(Mendeleev, mailID, attachmentIndex)
	end
	
	local MendeleevHookSetInventoryItem = GameTooltip.SetInventoryItem
	function GameTooltip.SetInventoryItem(Mendeleev, unit, slot)
    GameTooltip.itemLink = GetInventoryItemLink(unit, slot)
    return MendeleevHookSetInventoryItem(Mendeleev, unit, slot)
	end
	
	local MendeleevHookSetLootRollItem = GameTooltip.SetLootRollItem
	function GameTooltip.SetLootRollItem(Mendeleev, id)
    GameTooltip.itemLink = GetLootRollItemLink(id)
    return MendeleevHookSetLootRollItem(Mendeleev, id)
	end
	
	local MendeleevHookSetLootRollItem = GameTooltip.SetLootRollItem
	function GameTooltip.SetLootRollItem(Mendeleev, id)
    GameTooltip.itemLink = GetLootRollItemLink(id)
    return MendeleevHookSetLootRollItem(Mendeleev, id)
	end
	
	local MendeleevHookSetMerchantItem = GameTooltip.SetMerchantItem
	function GameTooltip.SetMerchantItem(Mendeleev, merchantIndex)
    GameTooltip.itemLink = GetMerchantItemLink(merchantIndex)
    return MendeleevHookSetMerchantItem(Mendeleev, merchantIndex)
	end
	
	local MendeleevHookSetCraftItem = GameTooltip.SetCraftItem
	function GameTooltip.SetCraftItem(Mendeleev, skill, slot)
    GameTooltip.itemLink = GetCraftReagentItemLink(skill, slot)
    return MendeleevHookSetCraftItem(Mendeleev, skill, slot)
	end
	
	local MendeleevHookSetCraftSpell = GameTooltip.SetCraftSpell
	function GameTooltip.SetCraftSpell(Mendeleev, slot)
    GameTooltip.itemLink = GetCraftItemLink(slot)
    return MendeleevHookSetCraftSpell(Mendeleev, slot)
	end
	
	local MendeleevHookSetTradeSkillItem = GameTooltip.SetTradeSkillItem
	function GameTooltip.SetTradeSkillItem(Mendeleev, skillIndex, reagentIndex)
    if reagentIndex then
			GameTooltip.itemLink = GetTradeSkillReagentItemLink(skillIndex, reagentIndex)
			else
			GameTooltip.itemLink = GetTradeSkillItemLink(skillIndex)
		end
    return MendeleevHookSetTradeSkillItem(Mendeleev, skillIndex, reagentIndex)
	end
	
	local MendeleevHookSetAuctionSellItem = GameTooltip.SetAuctionSellItem
	function GameTooltip.SetAuctionSellItem(Mendeleev)
    local itemName, _, itemCount = GetAuctionSellItemInfo()
    GameTooltip.itemCount = itemCount
    GameTooltip.itemLink = GetItemLinkByName(itemName)
    return MendeleevHookSetAuctionSellItem(Mendeleev)
	end
	
	local MendeleevHookSetTradePlayerItem = GameTooltip.SetTradePlayerItem
	function GameTooltip.SetTradePlayerItem(Mendeleev, index)
    GameTooltip.itemLink = GetTradePlayerItemLink(index)
    return MendeleevHookSetTradePlayerItem(Mendeleev, index)
	end
	
	local MendeleevHookSetTradeTargetItem = GameTooltip.SetTradeTargetItem
	function GameTooltip.SetTradeTargetItem(Mendeleev, index)
    GameTooltip.itemLink = GetTradeTargetItemLink(index)
    return MendeleevHookSetTradeTargetItem(Mendeleev, index)
	end
end