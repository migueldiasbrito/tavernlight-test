function printSmallGuildNames(memberCount)
    -- this method is supposed to print names of all guilds that have less than memberCount max members

    -- Check if memberCount is less than 0
    if memberCount < 0 then
        print("Invalid member count")
        return
    end

    local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;"
    local resultId = db.storeQuery(string.format(selectGuildQuery, memberCount))

    -- Check if the query was successful
    if not resultId then
        print("Error executing query")
        return
    end

    -- Iterate through the result set
    local row = db.getResult(resultId)
    if row then
        repeat
            local guildName = row:getDataString("name")
            print(guildName)
        until not row:next()
        row:free()
    else
        print("No results found")
    end
end