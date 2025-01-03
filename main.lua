local addonName, addonData = ...

OptionsPanel = addonData.OptionsPanel
Data = addonData.Data
Hooks = addonData.Hooks

local frame = CreateFrame("Frame")

function frame:OnEvent(event, ...)
    if WOW_WISHLIST_Database_Global and WOW_WISHLIST_Database_Global.debug then
        print("onEvent", event, ...)
    end
    self[event](self, event, ...)
end

function frame:ADDON_LOADED(event, addOnName, ...)
    if addOnName == "wow-wishlist" then
        Data.init()
        OptionsPanel.init()
        Hooks.init()
    end
end

function frame:PLAYER_ENTERING_WORLD(event, isLogin, isReload)
    --print("new PLAYER_ENTERING_WORLD event", event, isLogin, isReload)
end

function frame:CHAT_MSG_CHANNEL(event, text, playerName, _, channelName)
    print("new CHAT_MSG_CHANNEL event", event, text, playerName, channelName)
end

frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
--frame:RegisterEvent("GET_ITEM_INFO_RECEIVED", function(event, itemid)
--    print("GET_ITEM_INFO_RECEIVED", event, itemid)
--end)
--frame:RegisterEvent("CHAT_MSG_CHANNEL")
frame:SetScript("OnEvent", frame.OnEvent)


SLASH_WISHLIST_OPTIONS1 = "/wlo"
SLASH_WISHLIST_OPTIONS2 = "/wishlist-options"
SlashCmdList.WISHLIST_OPTIONS = function(msg, editBox)
    OptionsPanel.show()
end

SLASH_WISHLIST1 = "/wl"
SLASH_WISHLIST2 = "/wishlist"
SlashCmdList.WISHLIST = function(msg, editBox)
    WishlistPanel:Show()
end
