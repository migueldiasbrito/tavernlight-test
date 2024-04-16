void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId)
{
    // start by trying to create the item to avoid creating a new player unnecessarily
    Item* item = Item::CreateItem(itemId);
    if (!item) {
        return;
    }

    Player* player = g_game.getPlayerByName(recipient);
    if (!player) {
        player = new Player(nullptr);
        if (!IOLoginData::loadPlayerByName(player, recipient)) {
            // free allocated data in this method that won't be used, assuming CreateItem does not store the created
            // item somewhere else
            delete item;
            delete player;
            
            return;
        }
    }

    g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

    if (player->isOffline()) {
        IOLoginData::savePlayer(player);
    }
}