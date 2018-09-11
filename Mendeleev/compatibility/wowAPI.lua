bankItemCache = {}

function GetItemCount(obj, includeBank)
	local itemID, size, slotLink, slotID, itemCount
	local count = 0

	if type(obj) == 'string' then
		itemID = string.match(obj, "item:(%d+):")
		if not itemID then
			itemID = GetItemInfo(obj)
		end
	elseif type(obj) == 'number' then
		itemID = obj
	end
	if not itemID then return end
	
	for bag = 4, 0, -1 do
		size = GetContainerNumSlots(bag)
		if size then
			for slot = size, 1, -1 do
				slotLink = GetContainerItemLink(bag, slot)
				if slotLink then
					slotID = string.match(slotLink, "item:(%d+):")
					if slotID == itemID then
						_, itemCount = GetContainerItemInfo(bag, slot)
						count = count + itemCount
					end
				end
			end
		end
	end
	
	if includeBank then
		count = count + (bankItemCache[itemID] or 0)
	end
	return count
end

local f = CreateFrame('Frame')
f:RegisterEvent("BANKFRAME_OPENED")	
f:RegisterEvent("PLAYERBANKSLOTS_CHANGED")	
f:SetScript('OnEvent', function()
	if event == 'BANKFRAME_OPENED' and table.getn(bankItemCache) then return end
	bankItemCache = {} -- clear cache
	local size, slotLink, slotID, itemCount	
	for bag = 10, -1, -1 do -- iterate bank bags; -1 - generic bank frame
		if bag < 0 or bag > 4 then -- ignore player container bags
			size = GetContainerNumSlots(bag)
			if size then
				for slot = size, 1, -1 do
					slotLink = GetContainerItemLink(bag, slot)
					if slotLink then
						_, itemCount = GetContainerItemInfo(bag, slot)
						slotID = string.match(slotLink, "^|%x+|Hitem:(%d+):")
						if bankItemCache[slotID] then
							itemCount = itemCount + bankItemCache[slotID]
						end
						bankItemCache[slotID] = itemCount
					end
				end
			end
		end
	end
end)
