local L = AceLibrary("AceLocale-2.2"):new("Mendeleev")
local PT = LibStub("LibPeriodicTable-3.1")
local BTS = LibStub("LibBabble-Tradeskill-3.0"):GetLookupTable()
local waterfall = AceLibrary:HasInstance("Waterfall-1.0") and AceLibrary("Waterfall-1.0") or nil

local _G = getfenv(0)

-- We cache the results, so that we don't have to do a PT lookup for every item.
local cache = {}

Mendeleev = AceLibrary("AceAddon-2.0"):new("AceConsole-2.0", "AceDB-2.0", "AceHook-2.1", "AceEvent-2.0")
local realm = GetRealmName()
local playerName = UnitName('player')

local skillcolor = {
	[-1] = "|cffff0000",
	[0] = "|cff7f7f7f",
	[1] = "|cff3fbf3f",
	[2] = "|cffffff00",
	[3] = "|cffff7f3f",
}

local function GetItemLink(obj)
	local itemID = tonumber(string.match(obj, "item:(%d+):"))
	if not itemID then
		for iterateID = 1, 25818 do
			local itemName = GetItemInfo(iterateID)
			if itemName and itemName == name then
				itemID = iterateID
			end
		end
	end
	local itemName, hyperLink, itemQuality = GetItemInfo(itemID)
	local hex = select(4, GetItemQualityColor(tonumber(itemQuality)))
	return hex.. "|H"..hyperLink.."|h["..itemName.."]|h|r"
end

local function GetItemLevel(id)
	local quality,_,_,_,_,itemSlot = select(3, GetItemInfo(id))
	local itemLevel = Mendeleev.ItemLevelsDatabase[id] or 0
	local score = (quality * itemLevel) * (itemSlot == "INVTYPE_2HWEAPON" and 2 or 1)
	return score, GetItemQualityColor(quality)
end

local options = {
	type = "group",
	args = {
		hoverLink = {
			type = "toggle",
			name = L["Hoverlink"],
			desc = L["Enable display tooltip while hovering hyperlink in ChatFrame."],
			get = function() return Mendeleev.db.profile.hoverLink end,
			set = function(v)
				Mendeleev.db.profile.hoverLink = v
				Mendeleev:HoverHyperlink_Toggle()
			end,
			order = 1,
		},
		GameTooltip = {
			type = "group",
			name = L["GameTooltip"],
			desc = L["Standard tooltip."],
			order = 2,
			args = {
				showAccountItemCount = {
					type = "toggle",
					name = L["Show item count on your account"],
					desc = L["Toggle showing the item count on your account in the tooltip."],
					order = 5,
					get = function() return Mendeleev.db.profile.GameTooltip.showAccountItemCount end,
					set = function(v) Mendeleev.db.profile.GameTooltip.showAccountItemCount = v end,
				},
				showUsedInTree = {
					type = "toggle",
					name = L["Show 'used in' tree"],
					desc = L["Toggle showing the 'used in' tree in the tooltip."],
					get = function() return Mendeleev.db.profile.GameTooltip.showUsedInTree end,
					set = function(v) Mendeleev.db.profile.GameTooltip.showUsedInTree = v end,
					order = 6,
				},
				--[[
					UsedInTreeIcons = { --?
					type = "toggle",
					name = L["Show icons in 'used in' tree"],
					desc = L["Toggle showing of icons in the 'used in' tree."],
					get = function() return Mendeleev.db.profile.GameTooltip.UsedInTreeIcons end,
					set = function(v) Mendeleev.db.profile.GameTooltip.UsedInTreeIcons = v end,
					order = 7,
					},
				--]]
				showPriceValue = {
					type = "toggle",
					name = L["Show item price"],
					desc = L["Displays the price of the item in the tooltip."],
					get = function() return Mendeleev.db.profile.GameTooltip.showPriceValue end,
					set = function(v) Mendeleev.db.profile.GameTooltip.showPriceValue = v end,
					order = 8,
				},
				UsedInTreeMinSkill = {
					type = "text",
					name = L["Minimal skill for 'used in' tree"],
					desc = L["Minimal skill advance for an item to show up in the 'used in' tree."],
					validate = {['-1'] = skillcolor[-1]..L["TRADESKILL_UNKNOWN"].."|r", ['0'] = skillcolor[0]..L["TRADESKILL_TRIVIAL"].."|r", ['1'] = skillcolor[1]..L["TRADESKILL_EASY"].."|r", ['2'] = skillcolor[2]..L["TRADESKILL_MEDIUM"].."|r", ['3'] = skillcolor[3]..L["TRADESKILL_OPTIMAL"].."|r"},
					usage = "",
					get = function() return Mendeleev.db.profile.GameTooltip.UsedInTreeMinSkill end,
					set = function(v) Mendeleev.db.profile.GameTooltip.UsedInTreeMinSkill = v end,
					order = 9,
				},
				UsedInTreeMinSkillShift = {
					type = "text",
					name = L["Minimal skill for 'used in' tree (shift)"],
					desc = L["Minimal skill advance for an item to show up in the 'used in' tree if Shift is held."],
					validate = {['-1'] = skillcolor[-1]..L["TRADESKILL_UNKNOWN"].."|r", ['0'] = skillcolor[0]..L["TRADESKILL_TRIVIAL"].."|r", ['1'] = skillcolor[1]..L["TRADESKILL_EASY"].."|r", ['2'] = skillcolor[2]..L["TRADESKILL_MEDIUM"].."|r", ['3'] = skillcolor[3]..L["TRADESKILL_OPTIMAL"].."|r"},
					usage = "",
					get = function() return Mendeleev.db.profile.GameTooltip.UsedInTreeMinSkillShift end,
					set = function(v) Mendeleev.db.profile.GameTooltip.UsedInTreeMinSkillShift = v end,
					order = 10,
				},
			},
		},
		ItemRefTooltip = {
			type = "group",
			name = L["ItemRefTooltip"],
			desc = L["Tooltip when opening links from the chat."],
			order = 3,
			args = {},
		},
		ShoppingTooltip = {
			type = "group",
			name = L["ShoppingTooltip"],
			desc = L["Comparison tooltip."],
			order = 4,
			args = {},
		},
		sets = {
			name = L["Toggle sets."],
			desc = L["Toggle sets from showing information in the tooltip."],
			type = "group",
			order = 5,
			args = {},
		},
	},
}

function Mendeleev:OnInitialize()
	self:RegisterDB("MendeleevDB")
	self:RegisterDefaults("profile", {
		hoverLink = false,
		GameTooltip = {
			showItemLevel = false,
			showItemID = false,
			showAccountItemCount = false,
			showPlayerItemCount = false,
			showStackSize = true,
			showUsedInTree = true,
			--UsedInTreeIcons = true,
			UsedInTreeMinSkill = '0',
			UsedInTreeMinSkillShift = '-1',
			showPriceValue = false,
		},
		ItemRefTooltip = {
			showItemLevel = false,
			showItemID = false,
			showPlayerItemCount = false,
			showStackSize = true,
		},
		ShoppingTooltip = {
			showItemLevel = false,
			showItemID = false,
		},
		sets = {},
	})
	
	for _, v in pairs({"GameTooltip", "ItemRefTooltip", "ShoppingTooltip"}) do
		local tooltip = v
		options.args[tooltip].args.showItemLevel = {
			type = "toggle",
			name = L["Show item level"],
			desc = L["Toggle showing the item level in the tooltip."],
			get = function() return Mendeleev.db.profile[tooltip].showItemLevel end,
			set = function(v) Mendeleev.db.profile[tooltip].showItemLevel = v end,
			order = 1,
		}
		options.args[tooltip].args.showItemID = {
			type = "toggle",
			name = L["Show item identifier"],
			desc = L["Toggle showing the item identifier in the tooltip."],
			get = function() return Mendeleev.db.profile[tooltip].showItemID end,
			set = function(v) Mendeleev.db.profile[tooltip].showItemID = v end,
			order = 2,
		}
		if tooltip ~= "ShoppingTooltip" then
			options.args[tooltip].args.showStackSize = {
				type = "toggle",
				name = L["Show stack size"],
				desc = L["Toggle showing the stack size in the tooltip."],
				get = function() return Mendeleev.db.profile[tooltip].showStackSize end,
				set = function(v) Mendeleev.db.profile[tooltip].showStackSize = v end,
				order = 3,
			}
			options.args[tooltip].args.showPlayerItemCount = {
				type = "toggle",
				name = L["Show item count on your character"],
				desc = L["Toggle showing the item count on your character in the tooltip."],
				order = 4,
				get = function() return Mendeleev.db.profile[tooltip].showPlayerItemCount end,
				set = function(v) Mendeleev.db.profile[tooltip].showPlayerItemCount = v end,
			}
		end
	end
	
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
	self:HookLinkFunctions()
	self:HoverHyperlink_Toggle()
	self:Hook("SetItemRef")
	self:HookScript(GameTooltip, "OnShow", "Tooltip_OnShow")
	self:HookScript(GameTooltip, "OnHide", "Tooltip_OnHide")
	self:HookScript(ItemRefTooltip, "OnShow", "Tooltip_OnShow")
	self:HookScript(ItemRefTooltip, "OnHide", "Tooltip_OnHide")
	self:HookScript(ShoppingTooltip1, "OnShow", "ShoppingTooltip_OnShow")
	self:HookScript(ShoppingTooltip2, "OnShow", "ShoppingTooltip_OnShow")
	if IsAddOnLoaded("EquipCompare") then
		self:HookScript(ComparisonTooltip1, "OnShow", "ShoppingTooltip_OnShow")
		self:HookScript(ComparisonTooltip2, "OnShow", "ShoppingTooltip_OnShow")
	end
	
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

function Mendeleev:OnDisable()
	self:UnregisterAllEvents()
	self:Unhook("SetItemRef")
	self:Unhook(GameTooltip, "OnShow")
	self:Unhook(GameTooltip, "OnHide")
	self:Unhook(ItemRefTooltip, "OnShow")
	self:Unhook(ItemRefTooltip, "OnHide")
	self:Unhook(ShoppingTooltip1, "OnShow")
	self:Unhook(ShoppingTooltip2, "OnShow")
	if IsAddOnLoaded("EquipCompare") then
		self:Unhook(ComparisonTooltip1, "OnShow")
		self:Unhook(ComparisonTooltip2, "OnShow")
	end
end

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
	if not cacheUsedInFull[id] then
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
		for k in pairs(usedin) do
			if not GetItemInfo(k) then
				GameTooltip:SetHyperlink('item:'..k) -- adding an item to the cache!
			end
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
	local UsedInTreeIcons         = self.db.profile.GameTooltip.UsedInTreeIcons
	local UsedInTreeMinSkill      = IsShiftKeyDown() and self.db.profile.GameTooltip.UsedInTreeMinSkillShift or self.db.profile.GameTooltip.UsedInTreeMinSkill
	
	local list = {}
	local didpoints = false
	for i = 4, getn(tree) do
		local v = tree[i]
		if v[3] >= tonumber(UsedInTreeMinSkill) then
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
			local type = select(2, _G["Get"..frame.."Info"](i))
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

function Mendeleev:ShoppingTooltip_OnShow(tooltip)
	self.hooks[tooltip].OnShow()
	if not GameTooltip.itemLink then return end
	
	local db = self.db.profile
  local slotTable = {
		[INVTYPE_2HWEAPON] = {"MainHandSlot", "SecondaryHandSlot"},
    [INVTYPE_BODY] = "ShirtSlot",
    [INVTYPE_CHEST] = "ChestSlot",
    [INVTYPE_CLOAK] = "BackSlot",
    [INVTYPE_FEET] = "FeetSlot",
    [INVTYPE_FINGER] = {"Finger0Slot", "Finger1Slot"},
    [INVTYPE_HAND] = "HandsSlot",
    [INVTYPE_HEAD] = "HeadSlot",
    [INVTYPE_HOLDABLE] = "SecondaryHandSlot",
    [INVTYPE_LEGS] = "LegsSlot",
    [INVTYPE_NECK] = "NeckSlot",
    [INVTYPE_RANGED] = "RangedSlot",
    [INVTYPE_RELIC] = "RangedSlot",
    [INVTYPE_ROBE] = "ChestSlot",
    [INVTYPE_SHIELD] = "SecondaryHandSlot",
    [INVTYPE_SHOULDER] = "ShoulderSlot",
    [INVTYPE_TABARD] = "TabardSlot",
    [INVTYPE_TRINKET] = {"Trinket0Slot", "Trinket1Slot"},
    [INVTYPE_WAIST] = "WaistSlot",
    [INVTYPE_WEAPON] = {"MainHandSlot", "SecondaryHandSlot"},
    [INVTYPE_WEAPONMAINHAND] = "MainHandSlot",
    [INVTYPE_WEAPONOFFHAND] = "SecondaryHandSlot",
    [INVTYPE_WRIST] = "WristSlot",
    [INVTYPE_RANGEDRIGHT] = "RangedSlot",
	}
	
	local id = tonumber(string.match(GameTooltip.itemLink, "^|%x+|Hitem:(%d+):"))
	local itemType = select(8, GetItemInfo(id))
	local slotID, slotLink, itemID, slotID_other, slotLink_other, itemID_other
	if type(slotTable[_G[itemType]]) ~= "table" then
		-- ShoppingTooltip1
		slotID = GetInventorySlotInfo(slotTable[_G[itemType]])
		slotLink = GetInventoryItemLink("player", slotID)
		if slotLink then
			itemID = tonumber(string.match(slotLink, "^|%x+|Hitem:(%d+):"))
		end
	else
		-- ShoppingTooltip1
		slotID = GetInventorySlotInfo(slotTable[_G[itemType]][1])
		slotLink = GetInventoryItemLink("player", slotID)
		if slotLink then
			itemID = tonumber(string.match(slotLink, "^|%x+|Hitem:(%d+):"))
		end
		-- ShoppingTooltip2
		slotID_other = GetInventorySlotInfo(slotTable[_G[itemType]][2])
		slotLink_other = GetInventoryItemLink("player", slotID_other)
		if slotLink_other then
			itemID_other = tonumber(string.match(slotLink_other, "^|%x+|Hitem:(%d+):"))
		end
	end
	
	if (string.match(tooltip:GetName(), "(%d)") == '1' and itemID) or (string.match(tooltip:GetName(), "(%d)") == '2' and itemID_other) then
		if string.match(tooltip:GetName(), "(%d)") == '2' and itemID_other then itemID = itemID_other end
		
		if db.ShoppingTooltip.showItemID then
			tooltip:AddDoubleLine(L["Item ID"], itemID)
			tooltip:Show()
		end
		
		if db.ShoppingTooltip.showItemLevel then
			local iLevel, r, g, b = GetItemLevel(itemID)
			if iLevel and iLevel > 0 then
				tooltip:AddDoubleLine(L["iLevel"], iLevel, 1, .82, 0, r, g, b)
				tooltip:Show()
			end
		end
	end
end

function Mendeleev:Tooltip_OnShow(tooltip)
	self.hooks[tooltip].OnShow()
	local item = tooltip.itemLink
	if tooltip.Mendeleev_data_added or not item then return end
	self:AddTooltipData(tooltip, item)
	tooltip:Show()
end

function Mendeleev:AddTooltipData(tooltip, item)
	local id = tonumber(string.match(item, "^|%x+|Hitem:(%d+):"))
	local quality,_,_,_,stack,itemSlot = select(3, GetItemInfo(id))
	local db = self.db.profile
	
	if not cache[item] then
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
	
	if db[tooltip:GetName()].showPlayerItemCount then
		local count = GetItemCount(item, false)
		local countIncludeBank = GetItemCount(item, true)
		if not countIncludeBank then
			tooltip:AddDoubleLine(L["You have"], count.." (+"..L["N/A"]..")")
		else
			local bankcount = countIncludeBank - count
			if count + bankcount > 0 then
				tooltip:AddDoubleLine(L["You have"], count..(bankcount > 0 and (" (+"..bankcount..")") or ""))
			end
		end
	end
	
	if tooltip ~= ItemRefTooltip and db[tooltip:GetName()].showAccountItemCount then
		local header = L["You have on account"]
		local invCount, bankCount
		
		for acc_player in pairs(ItemCache[realm]) do
			if acc_player ~= playerName then
				invCount = ItemCache[realm][acc_player]['Inventory'][id]
				if invCount then
					if header then
						tooltip:AddLine(header)
						header = nil
					end
					if not IsAltKeyDown() then
						tooltip:AddLine("   - "..skillcolor[1].."...|r")
						break
					end
					if not ItemCache[realm][acc_player]['Bank'] then
						tooltip:AddDoubleLine("   - "..skillcolor[1]..acc_player.."|r", invCount.." (+"..L["N/A"]..")")
					else
						bankCount = ItemCache[realm][acc_player]['Bank'][id]
						if bankCount then
							tooltip:AddDoubleLine("   - "..skillcolor[1]..acc_player.."|r", invCount.." (+"..bankCount..")")
						else
							tooltip:AddDoubleLine("   - "..skillcolor[1]..acc_player.."|r", invCount)
						end
					end					
				end
			end
		end
	end
	
	if stack and stack > 1 and db[tooltip:GetName()].showStackSize then
		tooltip:AddDoubleLine(L["Stacksize"], stack)
	end
	
	if db[tooltip:GetName()].showItemID then
		tooltip:AddDoubleLine(L["Item ID"], id)
	end
	
	if db[tooltip:GetName()].showItemLevel then
		local iLevel, r, g, b = GetItemLevel(id)
		if iLevel and iLevel > 0 then
			tooltip:AddDoubleLine(L["iLevel"], iLevel, 1, .82, 0, r, g, b)
		end
	end
	
	if tooltip == GameTooltip and db.GameTooltip.showPriceValue then
		if self.ItemPricesDatabase[id] then
			local sell, buy = string.match(self.ItemPricesDatabase[id], "(%d+),(%d+)")
			sell = tonumber(sell)
			buy = tonumber(buy)
			local count = tooltip.itemCount or 1
			if MerchantFrame:IsShown() then
				GameTooltip_ClearMoney()
			end
			if sell > 0 then SetTooltipMoney(tooltip, sell*count) end
		else
			for i=1, tooltip:NumLines() do
				local line = _G[tooltip:GetName().."TextLeft"..i]:GetText()
				if string.match(line, ITEM_UNSELLABLE) then
					line = nil
					break
				end
			end	
			tooltip:AddLine(ITEM_UNSELLABLE, 1, 1, 1)
		end
	end
	
	if tooltip ~= ItemRefTooltip and (db[tooltip:GetName()].showUsedInTree and not UnitAffectingCombat("player")) then
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
	self.hooks[tooltip].OnHide()
	tooltip.Mendeleev_data_added = nil
	tooltip.itemLink = nil
	tooltip.itemCount = nil
end

function Mendeleev:HoverHyperlink_Toggle()
	if self.db.profile.hoverLink then
		for i=1, NUM_CHAT_WINDOWS do
			local frame = _G["ChatFrame"..i]
			if not self:IsHooked(frame, "OnHyperlinkEnter") then
				self:HookScript(frame, "OnHyperlinkEnter")
			end
			if not self:IsHooked(frame, "OnHyperlinkLeave") then
				self:HookScript(frame, "OnHyperlinkLeave")
			end
		end
	else
		for i=1, NUM_CHAT_WINDOWS do
			local frame = _G["ChatFrame"..i]
			if self:IsHooked(frame, "OnHyperlinkEnter") then
				self:Unhook(frame, "OnHyperlinkEnter")
			end
			if self:IsHooked(frame, "OnHyperlinkLeave") then
				self:Unhook(frame, "OnHyperlinkLeave")
			end
		end
	end
end

function Mendeleev:OnHyperlinkEnter(object)
	if not self.db.profile.hoverLink then
		return self.hooks[object].OnHyperlinkEnter()
	end
	
	local shortlink = arg1
	if string.find(shortlink, "^item") then
		GameTooltip:SetOwner(this, "ANCHOR_TOPRIGHT")
		GameTooltip:SetHyperlink(shortlink)
		self:AddTooltipData(GameTooltip, GetItemLink(shortlink))
		GameTooltip:Show()
		
		--Auctioneer/Enchantrix/EnhTooltip/Informant support
		if EnhTooltip and shortlink then
			local name, _, quality = GetItemInfo(shortlink)
			local item = EnhTooltip.FakeLink(shortlink, quality, name)
			EnhTooltip.TooltipCall(GameTooltip, name, item, quality, 1)
		end
	elseif string.find(shortlink, "^enchant") then
		GameTooltip:SetOwner(this, "ANCHOR_TOPRIGHT")
		GameTooltip:SetHyperlink(shortlink)
		GameTooltip:Show()
	end
	
	self.hooks[object].OnHyperlinkEnter()
end

function Mendeleev:OnHyperlinkLeave(object)
	if not self.db.profile.hoverLink then
		return self.hooks[object].OnHyperlinkLeave()
	end
	GameTooltip:Hide()
	self.hooks[object].OnHyperlinkLeave()
end

function Mendeleev:SetItemRef(link, text, button)
	ItemRefTooltip.itemLink = text
	self.hooks.SetItemRef(link, text, button)
end

function Mendeleev:HookLinkFunctions()	
	local MendeleevHookSetBagItem = GameTooltip.SetBagItem
	function GameTooltip.SetBagItem(self, container, slot)
		GameTooltip.itemLink = GetContainerItemLink(container, slot)
    _, GameTooltip.itemCount = GetContainerItemInfo(container, slot)
		return MendeleevHookSetBagItem(self, container, slot)
	end
	
	local MendeleevHookSetQuestLogItem = GameTooltip.SetQuestLogItem
	function GameTooltip.SetQuestLogItem(self, itemType, index)
		GameTooltip.itemLink = GetQuestLogItemLink(itemType, index)
		if not GameTooltip.itemLink then return end
		return MendeleevHookSetQuestLogItem(self, itemType, index)
	end
	
	local MendeleevHookSetQuestItem = GameTooltip.SetQuestItem
	function GameTooltip.SetQuestItem(self, itemType, index)
		GameTooltip.itemLink = GetQuestItemLink(itemType, index)
		return MendeleevHookSetQuestItem(self, itemType, index)
	end
	
	local MendeleevHookSetLootItem = GameTooltip.SetLootItem
	function GameTooltip.SetLootItem(self, slot)
		GameTooltip.itemLink = GetLootSlotLink(slot)
		MendeleevHookSetLootItem(self, slot)
	end
	
	local MendeleevHookSetInboxItem = GameTooltip.SetInboxItem
	function GameTooltip.SetInboxItem(self, mailID, attachmentIndex)
		local itemName = GetInboxItem(mailID)
		GameTooltip.itemLink = GetItemLink(itemName)
		return MendeleevHookSetInboxItem(self, mailID, attachmentIndex)
	end
	
	local MendeleevHookSetInventoryItem = GameTooltip.SetInventoryItem
	function GameTooltip.SetInventoryItem(self, unit, slot)
		GameTooltip.itemLink = GetInventoryItemLink(unit, slot)
		return MendeleevHookSetInventoryItem(self, unit, slot)
	end
	
	local MendeleevHookSetLootRollItem = GameTooltip.SetLootRollItem
	function GameTooltip.SetLootRollItem(self, id)
		GameTooltip.itemLink = GetLootRollItemLink(id)
		return MendeleevHookSetLootRollItem(self, id)
	end
	
	local MendeleevHookSetLootRollItem = GameTooltip.SetLootRollItem
	function GameTooltip.SetLootRollItem(self, id)
		GameTooltip.itemLink = GetLootRollItemLink(id)
		return MendeleevHookSetLootRollItem(self, id)
	end
	
	local MendeleevHookSetMerchantItem = GameTooltip.SetMerchantItem
	function GameTooltip.SetMerchantItem(self, merchantIndex)
		GameTooltip.itemLink = GetMerchantItemLink(merchantIndex)
		return MendeleevHookSetMerchantItem(self, merchantIndex)
	end
	
	local MendeleevHookSetCraftItem = GameTooltip.SetCraftItem
	function GameTooltip.SetCraftItem(self, skill, slot)
		GameTooltip.itemLink = GetCraftReagentItemLink(skill, slot)
		return MendeleevHookSetCraftItem(self, skill, slot)
	end
	
	local MendeleevHookSetCraftSpell = GameTooltip.SetCraftSpell
	function GameTooltip.SetCraftSpell(self, slot)
		GameTooltip.itemLink = GetCraftItemLink(slot)
		return MendeleevHookSetCraftSpell(self, slot)
	end
	
	local MendeleevHookSetTradeSkillItem = GameTooltip.SetTradeSkillItem
	function GameTooltip.SetTradeSkillItem(self, skillIndex, reagentIndex)
		if reagentIndex then
			GameTooltip.itemLink = GetTradeSkillReagentItemLink(skillIndex, reagentIndex)
		else
			GameTooltip.itemLink = GetTradeSkillItemLink(skillIndex)
		end
		return MendeleevHookSetTradeSkillItem(self, skillIndex, reagentIndex)
	end
	
	local MendeleevHookSetAuctionSellItem = GameTooltip.SetAuctionSellItem
	function GameTooltip.SetAuctionSellItem(self)
    local itemName, _, itemCount = GetAuctionSellItemInfo()
    GameTooltip.itemCount = itemCount
		GameTooltip.itemLink = GetItemLink(itemName)
		return MendeleevHookSetAuctionSellItem(self)
	end
	
	local MendeleevHookSetTradePlayerItem = GameTooltip.SetTradePlayerItem
	function GameTooltip.SetTradePlayerItem(self, index)
		GameTooltip.itemLink = GetTradePlayerItemLink(index)
		return MendeleevHookSetTradePlayerItem(self, index)
	end
	
	local MendeleevHookSetTradeTargetItem = GameTooltip.SetTradeTargetItem
	function GameTooltip.SetTradeTargetItem(self, index)
		GameTooltip.itemLink = GetTradeTargetItemLink(index)
		return MendeleevHookSetTradeTargetItem(self, index)
	end	
end
