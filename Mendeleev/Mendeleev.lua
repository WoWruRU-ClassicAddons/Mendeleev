local L = AceLibrary("AceLocale-2.2"):new("Mendeleev")
local PT = LibStub("LibPeriodicTable-3.1")
local BTS = LibStub("LibBabble-Tradeskill-3.0"):GetLookupTable()
local waterfall = AceLibrary:HasInstance("Waterfall-1.0") and AceLibrary("Waterfall-1.0") or nil

local _G = getfenv(0)

-- We cache the results, so that we don't have to do a PT lookup for every item.
local cache = {}

Mendeleev = AceLibrary("AceAddon-2.0"):new("AceConsole-2.0", "AceDB-2.0", "AceHook-2.1", "AceEvent-2.0")
local Mendeleev     = Mendeleev
local GetItemCount  = GetItemCount
local GetItemIcon   = GetItemIcon
local GetItemInfo   = GetItemInfo
local GetSpellInfo  = GetSpellInfo

local skillcolor = {
	[-1] = "|cffff0000", -- unknown
	[0] = "|cff7f7f7f", -- trival
	[1] = "|cff3fbf3f",
	[2] = "|cffffff00",
	[3] = "|cffff7f3f",
}

local options = {
	type = "group",
	args = {
		showItemLevel = {
			type = "toggle",
			name = L["Show item level"],
			desc = L["Toggle showing the item level in the tooltip."],
			get = function() return Mendeleev.db.profile.showItemLevel end,
			set = function(v) Mendeleev.db.profile.showItemLevel = v end,
			order = 1,
		},
		showItemID = {
			type = "toggle",
			name = L["Show item identifier"],
			desc = L["Toggle showing the item identifier in the tooltip."],
			get = function() return Mendeleev.db.profile.showItemID end,
			set = function(v) Mendeleev.db.profile.showItemID = v end,
			order = 2,
		},
		showItemCount = {
			type = "toggle",
			name = L["Show item count"],
			desc = L["Toggle showing the item count in the tooltip."],
			get = function() return Mendeleev.db.profile.showItemCount end,
			set = function(v) Mendeleev.db.profile.showItemCount = v end,
			order = 3,
		},
		showStackSize = {
			type = "toggle",
			name = L["Show stack size"],
			desc = L["Toggle showing the stack size in the tooltip."],
			get = function() return Mendeleev.db.profile.showStackSize end,
			set = function(v) Mendeleev.db.profile.showStackSize = v end,
			order = 4,
		},
		showUsedInTree = {
			type = "toggle",
			name = L["Show 'used in' tree"],
			desc = L["Toggle showing the 'used in' tree in the tooltip."],
			get = function() return Mendeleev.db.profile.showUsedInTree end,
			set = function(v) Mendeleev.db.profile.showUsedInTree = v end,
			order = 5,
		},
		--[[
		UsedInTreeIcons = { --?
			type = "toggle",
			name = L["Show icons in 'used in' tree"],
			desc = L["Toggle showing of icons in the 'used in' tree."],
			get = function() return Mendeleev.db.profile.UsedInTreeIcons end,
			set = function(v) Mendeleev.db.profile.UsedInTreeIcons = v end,
			order = 6,
		},
		--]]
		UsedInTreeMinSkill = {
			type = "text",
			name = L["Minimal skill for 'used in' tree"],
			desc = L["Minimal skill advance for an item to show up in the 'used in' tree."].."\n\n'-1' - "..skillcolor[-1]..L["TRADESKILL_UNKNOWN"].."|r\n'0' - "..skillcolor[0]..L["TRADESKILL_TRIVIAL"].."|r\n'1' - "..skillcolor[1]..L["TRADESKILL_EASY"].."|r\n'2' - "..skillcolor[2]..L["TRADESKILL_MEDIUM"].."|r\n'3' - "..skillcolor[3]..L["TRADESKILL_OPTIMAL"],
			values = {[-1] = skillcolor[-1]..L["TRADESKILL_UNKNOWN"].."|r", [0] = skillcolor[0]..L["TRADESKILL_TRIVIAL"].."|r", [1] = skillcolor[1]..L["TRADESKILL_EASY"].."|r", [2] = skillcolor[2]..L["TRADESKILL_MEDIUM"].."|r", [3] = skillcolor[3]..L["TRADESKILL_OPTIMAL"].."|r"},
			usage = "'-1' - "..skillcolor[-1]..L["TRADESKILL_UNKNOWN"].."|r\n'0' - "..skillcolor[0]..L["TRADESKILL_TRIVIAL"].."|r\n'1' - "..skillcolor[1]..L["TRADESKILL_EASY"].."|r\n'2' - "..skillcolor[2]..L["TRADESKILL_MEDIUM"].."|r\n'3' - "..skillcolor[3]..L["TRADESKILL_OPTIMAL"],
			get = function() return Mendeleev.db.profile.UsedInTreeMinSkill end,
			set = function(v) Mendeleev.db.profile.UsedInTreeMinSkill = v end,
			order = 7,
		},
		UsedInTreeMinSkillShift = {
			type = "text",
			name = L["Minimal skill for 'used in' tree (shift)"],
			desc = L["Minimal skill advance for an item to show up in the 'used in' tree if Shift is held."].."\n\n'-1' - "..skillcolor[-1]..L["TRADESKILL_UNKNOWN"].."|r\n'0' - "..skillcolor[0]..L["TRADESKILL_TRIVIAL"].."|r\n'1' - "..skillcolor[1]..L["TRADESKILL_EASY"].."|r\n'2' - "..skillcolor[2]..L["TRADESKILL_MEDIUM"].."|r\n'3' - "..skillcolor[3]..L["TRADESKILL_OPTIMAL"],
			values = {[-1] = skillcolor[-1]..L["TRADESKILL_UNKNOWN"].."|r", [0] = skillcolor[0]..L["TRADESKILL_TRIVIAL"].."|r", [1] = skillcolor[1]..L["TRADESKILL_EASY"].."|r", [2] = skillcolor[2]..L["TRADESKILL_MEDIUM"].."|r", [3] = skillcolor[3]..L["TRADESKILL_OPTIMAL"].."|r"},
			usage = "'-1' - "..skillcolor[-1]..L["TRADESKILL_UNKNOWN"].."|r\n'0' - "..skillcolor[0]..L["TRADESKILL_TRIVIAL"].."|r\n'1' - "..skillcolor[1]..L["TRADESKILL_EASY"].."|r\n'2' - "..skillcolor[2]..L["TRADESKILL_MEDIUM"].."|r\n'3' - "..skillcolor[3]..L["TRADESKILL_OPTIMAL"],
			get = function() return Mendeleev.db.profile.UsedInTreeMinSkillShift end,
			set = function(v) Mendeleev.db.profile.UsedInTreeMinSkillShift = v end,
			order = 8,
		},
		populateWDB = {
			type = "execute",
			name = L["Populate WDB"],
			desc = L["Populating all items in WDB."],
			func = "PopulateWDB",
			order = 9,
		},
	},
}

function Mendeleev:OnInitialize()
	self:RegisterDB("MendeleevDB")
	self:RegisterDefaults("profile", {
		showItemLevel = false,
		showItemID = false,
		showItemCount = false,
		showStackSize = true,
		showUsedInTree = true,
		--UsedInTreeIcons = true,
		UsedInTreeMinSkill = 0,
		UsedInTreeMinSkillShift = -1,
		sets = {},
	})

	options.args.sets = {
		name = L["Toggle sets."],
		desc = L["Toggle sets from showing information in the tooltip."],
		type = "group",
		order = 10,
		args = {},
	}

	for _, v in ipairs(MENDELEEV_SETS) do
		local key = v.setindex
		local parent = string.match(key, "^([^%.]*)")
		key = string.gsub(key, " ", "_")
		if not options.args.sets.args[parent] then
			options.args.sets.args[parent] = {
				name = L[parent],
				desc = string.format(L["Toggle sets in the %s category."], L[parent]),
				type = "group",
				args = {},
			}
		end
		options.args.sets.args[parent].args[key] = {
			name = v.name,
			desc = string.format(L["Toggle %s."], v.name),
			type = "toggle",
			get  = function() return not self.db.profile.sets[key] end,
			set  = function(v) self.db.profile.sets[key] = not v cache = {} end,
		}
	end
	
	waterfall:Register('Mendeleev', 'aceOptions', options, 'title', 'Mendeleev '..GetAddOnMetadata("Mendeleev", "Version")..'.'..GetAddOnMetadata("Mendeleev", "X-Revision"),'colorR', .85, 'colorG', .44, 'colorB', .84) 
	self:RegisterChatCommand({"/mendeleev", "/mend"}, function() waterfall:Open('Mendeleev') end)
	self:RegisterChatCommand({"/mendeleevcl"}, options)
end

local firstLoad = true
function Mendeleev:OnEnable()
	self:HookLinkFunckions()
	self:HookScript(GameTooltip, "OnShow", "Tooltip_OnShow")
	self:HookScript(GameTooltip, "OnHide", "Tooltip_OnHide")
	self:HookScript(ItemRefTooltip, "OnShow", "Tooltip_OnShow")
	self:HookScript(ItemRefTooltip, "OnHide", "Tooltip_OnHide")
	self:HookScript(ShoppingTooltip1, "OnShow", "Tooltip_OnShow")
	self:HookScript(ShoppingTooltip1, "OnHide", "Tooltip_OnHide")
	self:HookScript(ShoppingTooltip2, "OnShow", "Tooltip_OnShow")
	self:HookScript(ShoppingTooltip2, "OnHide", "Tooltip_OnHide")
	
	if firstLoad then
		-- load our sets into the cache
		for _,v in ipairs(MENDELEEV_SETS) do
			PT:GetSetTable(v.setindex)
		end
		collectgarbage()
		firstLoad = nil
	end

	self:RegisterEvent("TRADE_SKILL_SHOW", "ScanTradeSkill")
	self:RegisterEvent("CRAFT_SHOW", "ScanTradeSkill")
end

-- function Mendeleev:OnDisable()
-- end

function Mendeleev:GetUsedInTable(skill, reagentid)
	local ret
	local ptrmr = PT:GetSetTable("TradeskillResultMats.Reverse." .. skill)
	if PT:IsSetMulti("TradeskillResultMats.Reverse." .. skill) then
		for k, v in ipairs(ptrmr) do
			if type(v) == "table" then
				local subskill = string.match(v.set, "TradeskillResultMats%.Reverse%.(.+)")
				if subskill then
					local guit = self:GetUsedInTable(subskill, reagentid)
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
		end
	else
		local usedin = ptrmr and ptrmr[tonumber(reagentid)]
		if usedin then
			for item, num in string.gmatch(usedin, "(%-?%d+)x(%d+)") do
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
	--["Inscription"] = GetSpellInfo(45357),
	["Jewelcrafting"] = BTS["Jewelcrafting"],
	["Leatherworking.Basic"] = BTS["Leatherworking"],
	["Leatherworking.Dragonscale"] = BTS["Dragonscale Leatherworking"],
	["Leatherworking.Elemental"] = BTS["Elemental Leatherworking"],
	["Leatherworking.Tribal"] = BTS["Tribal Leatherworking"],
	--["Poisons"] = L["Poisons"],
	["Smelting"] = BTS["Smelting"],
	["Tailoring.Basic"] = BTS["Tailoring"],
	["Tailoring.Mooncloth"] = BTS["Mooncloth Tailoring"],
	["Tailoring.Shadoweave"] = BTS["Shadoweave Tailoring"],
	["Tailoring.Spellfire"] = BTS["Spellfire Tailoring"],
}

function Mendeleev:GetLinesForTradeskillReagent(skill, reagent)
	if type(skill) ~= "string" or type(reagent) ~= "string" then return end
	local id = string.match(reagent, "^|c%x+|Hitem:(%d+):")
	local count = 0
	for item, num in pairs(self:GetUsedInTable(skill, id) or {}) do
		count = count + 1
	end
	if count > 0 then
		return string.format("%s (%d)", tradeskillNames[skill], count)
	end
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
	--"Enchanting",
	"Engineering.Basic",
	"Engineering.Gnomish",
	"Engineering.Goblin",
	"First Aid",
	--"Inscription",
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
-- 3 -> skill
	if (a[3] > b[3]) then
		return true
	end
	if (a[3] < b[3]) then
		return false
	end
-- 2 -> name
	if (a[2] and (not b[2] or a[2] < b[2])) then
		return true
	end
	if b[2] then -- not a[2] or a[2] > b[2]
		return false
	end
-- 1 -> id
	return a[1] < b[1]
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
			if string.find(history, ">"..k.."<") then
				if k < 0 then
					data[getn(data)+1] = {k, GetSpellInfo(-k) or false, id2skill[k], "..."}
				else
					data[getn(data)+1] = {k, GetItemInfo(k) or false, id2skill[k], "..."}
				end
			else
				local tdata, tskill = self:GetUsedInTree(k, history..">"..k.."<")
				if tskill > skill then
					skill = tskill
				end
				data[getn(data)+1] = tdata
			end
		end
	end
	table.sort(data, SortUsedInTree)
	table.insert(data, 1, id)
	if id < 0 then
		table.insert(data, 2, GetSpellInfo(-id) or false)
	else
		table.insert(data, 2, GetItemInfo(id) or false)
	end
	table.insert(data, 3, skill)
	return data, skill
end

function Mendeleev:GetUsedInList(tree, level, counttable, countmult)
	local UsedInTreeIcons         = self.db.profile.UsedInTreeIcons
	local UsedInTreeMinSkill      = IsShiftKeyDown() and self.db.profile.UsedInTreeMinSkillShift or self.db.profile.UsedInTreeMinSkill

	local list = {}
	local didpoints = false
	for i = 4, getn(tree) do
		local v = tree[i]
		if v[3] >= UsedInTreeMinSkill then
			if UsedInTreeIcons then
				local icontag = (v[1] < 0) and select(3, GetSpellInfo(-v[1])) or GetItemIcon(v[1])
				icontag = icontag and "|T"..icontag..":18|t " or ""
				--icontag = icontag and '<HTML><BODY><IMG src="'..icontag..'"/></BODY></HTML>' or ""
				list[getn(list)+1] = string.rep("    ", level).."- "..skillcolor[id2skill[v[1]] or -1]..icontag..(v[2] or ((v[1] < 0) and ("spell:"..(-v[1])) or ("item:"..v[1]))).."|r"
			else
				list[getn(list)+1] = string.rep("    ", level).."- "..skillcolor[id2skill[v[1]] or -1]..(v[2] or ((v[1] < 0) and ("spell:"..(-v[1])) or ("item:"..v[1]))).."|r"
			end
			list[getn(list)+1] = countmult * counttable[v[1]]
			if type(v[4]) == "table" then
				local slist = self:GetUsedInList(v, level+1, cacheUsedInFull[v[1]], countmult * counttable[v[1]])
				if getn(slist) > 0 then
					for _, line in pairs(slist) do
						list[getn(list)+1] = line
					end
				end
			elseif v[4] == "..." then
				list[getn(list)+1] = string.rep("    ", level+1).."..."
				list[getn(list)+1] = ""
			end
		elseif not didpoints then
			list[getn(list)+1] = string.rep("    ", level).."- "..skillcolor[v[3]].."...|r"
			list[getn(list)+1] = ""
			didpoints = true
		end
	end
	return list
end

local skillquals = {trivial = 0, easy = 1, medium = 2, optimal = 3}

function Mendeleev:ScanTradeSkill()
	local frame = "TradeSkill"
	if event == "CRAFT_SHOW" then
		frame = "Craft"
	end
	if _G[frame.."Frame"] and _G[frame.."Frame"]:IsShown() then
		for i=1, _G["GetNum"..frame.."s"]() do
			local _, type, _, _ = _G["Get"..frame.."Info"](i)
			if type ~= "header" then
				local item = _G["Get"..frame.."ItemLink"](i)
				if item then
				local id = tonumber(string.match(item, "item:(%d+)")) or -tonumber(string.match(item, "enchant:(%d+)"))
					if id then
						id2skill[id] = skillquals[type]
					end
				end
			end
		end
	end
end

function Mendeleev:Tooltip_OnShow(tooltip)
	local item = tooltip.itemLink
	if tooltip.Mendeleev_data_added or not item then return end
	self:AddTooltipData(tooltip, item)
	tooltip:Show()
end

function Mendeleev:AddTooltipData(tooltip, item)
	local id = string.match(item, "^|%x+|Hitem:(%d+):")
	local _,_,quality,_,_,_,stack = GetItemInfo(id)
	local db = self.db.profile

	if cache[item] == nil then
		local cachetable
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
									lines[getn(lines)+1] = c .. ret[i] .. "|r"
								end
							elseif type(ret) == "string" then
								lines[getn(lines)+1] = c .. ret .. "|r"
							end
						else
							lines[getn(lines)+1] = c .. desc .. (type(val) ~= "boolean" and v.useval and v.useval(val) or "") .. "|r"
						end
					end
				end
				if lines then
					table.sort(lines)
					if not cachetable then cachetable = {} end
					cachetable[v.setindex] = {c .. v.header .. "|r", lines}
				end
			end
		end
		if cachetable then
			local indextable = {}
			for k in pairs(cachetable) do
				indextable[getn(indextable)+1] = k
			end
			table.sort(indextable)
			cachetable["_index"] = indextable
			cache[item] = cachetable
		else
			cache[item] = false
		end
	end

	if cache[item] then
		for _, k in ipairs(cache[item]["_index"]) do
			local v = cache[item][k]
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

	if db.showItemID then
		local id = string.match(item, "^|%x+|Hitem:(%d+):")
		if id then
			tooltip:AddDoubleLine(L["Item ID"], id)
		end
	end

	if db.showItemLevel then
		local _,_, itemRarity,_,_,_,_,itemSlot = GetItemInfo(id)
		local r,g,b = GetItemQualityColor(itemRarity)
		local itemLevel = self.ItemLevelsDatabase[tonumber(id)] or 0
		local score = (itemRarity * itemLevel) * (itemSlot == "INVTYPE_2HWEAPON" and 2 or 1)
    if score and score > 0 then
			tooltip:AddDoubleLine(L["iLevel"], score, 1, .82, 0, r, g, b)
		end
	end

	if db.showUsedInTree and not UnitAffectingCombat("player") then
		local id = tonumber(string.match(item, "^|%x+|Hitem:(%d+):"))
		local t = Mendeleev:GetUsedInTree(id, ">"..id.."<")
		local l = Mendeleev:GetUsedInList(t, 1, cacheUsedInFull[id], 1)
		local header = L["Used in"]
		for i = 1, getn(l), 2 do
			if header then
				tooltip:AddLine(header)
				header = nil
			end
			tooltip:AddDoubleLine(l[i], l[i+1])
		end
	end

	tooltip.Mendeleev_data_added = true
end

function Mendeleev:Tooltip_OnHide(tooltip)
	tooltip.Mendeleev_data_added = nil
end

function Mendeleev:PopulateWDB()
	for item_id = 1, 25818 do
		local info = GetItemInfo('item:' .. item_id)
		if not info then
			GameTooltip:SetHyperlink('item:' .. item_id) -- adding an item to the cache!
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