local addonName, addonData = ...

Meta = {
    player = UnitName("player"),
    realm = GetRealmName(),
    id = UnitName("player") .. " - " .. GetRealmName(),
}

addonData.Data = {

    init = function()
        WOW_WISHLIST_Database_Global = WOW_WISHLIST_Database_Global or {}
        WOW_WISHLIST_Database_Chars = WOW_WISHLIST_Database_Chars or {}
        --DevTools_Dump(WOW_WISHLIST_Database)
    end,

}
