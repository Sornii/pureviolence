function onUse(cid, item, fromPosition, itemEx, toPosition)
	local container = Container(item.uid)
	local player = Player(cid)

	if player:getStorageValue(item.uid) == -1 then

		local questReward = container:getItem(0)
		local questRewardName = questReward:getType():getName()

		local weight = 0;

		if questReward:isContainer() then
			weight = questReward:getWeight()
		else
			weight = questReward:getType():getWeight(questReward:getCount())
		end
		
		local freecap = player:getFreeCapacity()

		if freecap >= weight then
			local reward = questReward:clone()
			player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found a ' .. questRewardName .. '.')
			player:addItemEx(reward)
			player:setStorageValue(item.uid, 1)
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found a ' .. questRewardName .. ' weighing ' .. string.format("%.2f", weight) .. ' oz. It\'s too heavy.')
		end

	else

		player:sendTextMessage(MESSAGE_INFO_DESCR, "It is empty.")

	end

	return true
end
