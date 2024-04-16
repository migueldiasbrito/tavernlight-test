function removeMemberFromPlayerParty(playerId, membername)
    -- Use a local variable instead of using and changing the value to a global one
    local player = Player(playerId)
    local party = player:getParty()

    -- Get the player to remove once instead of once or twice per iteration
    local targetPlayer = Player(membername)

    -- Change variable names for clarity, v to _ because we don't use it
    for _, member in pairs(party:getMembers()) do
        if member == targetPlayer then
            --[[
                I'm assuming that the removeMember only removes one instance of the target player and/or it's not safe
                to call it if that player is not in the party. Otherwise, we could just call the method once without
                the cycle
            ]]
            party:removeMember(targetPlayer)
        end
    end
end