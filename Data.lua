local addonName, addonData = ...

Meta = {
    player = UnitName("player"),
    realm = GetRealmName(),
    id = UnitName("player") .. " - " .. GetRealmName(),
}

addonData.Data = {

    init = function()
        WOW_WISHLIST_Database = WOW_WISHLIST_Database or {}
        WOW_WISHLIST_Database[Meta.id] = WOW_WISHLIST_Database[Meta.id] or {}
        --DevTools_Dump(WOW_WISHLIST_Database)
    end,

}
