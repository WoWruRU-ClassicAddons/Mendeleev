local realm = GetRealmName()
local player = UnitName('player')
ItemCache = {}

----------------------
-- API GetItemCount --
----------------------
local function ScanPlayerItems(ScanType)
	local bag_min, bag_max, ignore_bag_min, ignore_bag_max
	if ScanType == 'Bank' then
		bag_min, bag_max = -1, 10 --  -1 - generic bank frame
		ignore_bag_min, ignore_bag_max = 0, 4
	elseif ScanType == 'Inventory' then
		bag_min, bag_max = 0, 4
		ignore_bag_min, ignore_bag_max = -1, -1
	end
	
	ItemCache[realm][player][ScanType] = {} -- clear cache
	local size, slotLink, slotCount, slotID
	for bag = bag_max, bag_min, -1 do
		if (ignore_bag_min and bag < ignore_bag_min) or (ignore_bag_max and bag > ignore_bag_max) then
			size = GetContainerNumSlots(bag)
			if size then
				for slot = size, 1, -1 do
					slotLink = GetContainerItemLink(bag, slot)
					if slotLink then
						slotCount = select(2, GetContainerItemInfo(bag, slot))
						slotID = tonumber(string.match(slotLink, '^|%x+|Hitem:(%d+)'))
						if ItemCache[realm][player][ScanType][slotID] then
							slotCount = slotCount+ ItemCache[realm][player][ScanType][slotID]
						end
						ItemCache[realm][player][ScanType][slotID] = slotCount
					end
				end
			end
		end
	end
end

local f = CreateFrame('Frame')
f:RegisterEvent('BANKFRAME_OPENED')	
f:RegisterEvent('PLAYERBANKSLOTS_CHANGED')	
f:RegisterEvent('BAG_UPDATE')	
f:SetScript('OnEvent', function()
	local ScanType
	if (event == 'BANKFRAME_OPENED' and getn(ItemCache) == 0) or event == 'PLAYERBANKSLOTS_CHANGED' then
		ScanType = 'Bank'
	elseif event == 'BAG_UPDATE' then
		ScanType = 'Inventory'
	end

	if not ItemCache[realm] then
		ItemCache[realm] = {}
	end
	if not ItemCache[realm][player] then
		ItemCache[realm][player] = {}
	end
	if not ItemCache[realm][player][ScanType] then
		ItemCache[realm][player][ScanType] = {}
	end

	ScanPlayerItems(ScanType)
end)

function GetItemCount(obj, includeBank)
	local itemID
	local count = 0
	
	if type(obj) == 'number' then
		itemID = obj -- if obj is ID
	elseif type(obj) == 'string' then
		itemID = tonumber(string.match(obj, 'item:(%d+)')) -- if obj is link
		if not itemID then
			itemID = tonumber(obj) -- if obj is ID, but type 'string'
		end
	end
	if not itemID then return end
	
	count = ItemCache[realm][player]['Inventory'][itemID] or 0
	
	if includeBank then
		if not ItemCache[realm][player]['Bank'] then return end
		count = count + (ItemCache[realm][player]['Bank'][itemID] or 0)
	end
	return count
end

---------------------
-- API GetItemIcon --
---------------------
function GetItemIcon(obj)
	local itemID
	if type(obj) == 'number' then
		itemID = obj -- if obj is ID
	elseif type(obj) == 'string' then
		itemID = tonumber(string.match(obj, 'item:(%d+)')) -- if obj is link
		if not itemID then
			itemID = tonumber(obj) -- if obj is ID, but type 'string'
		end
	end
	if not itemID then return end

	local itemIcon = select(9, GetItemInfo(itemID))
	if not itemIcon then
		GameTooltip:SetHyperlink('item:' .. itemID) -- adding an item to the cache so that GetItemInfo does not return nil!
		itemIcon = select(9, GetItemInfo(itemID))
	end
	return itemIcon
end