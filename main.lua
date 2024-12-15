print("hello wishlist")

local frame = CreateFrame("Frame")
Database = Database or {}

function frame:OnEvent(event, ...)
    self[event](self, event, ...)
end

function frame:ADDON_LOADED(event, addOnName)
    print("new ADDON_LOADED event", event, addOnName)
    if addOnName == "wow-wishlist" then
        Database.sessions = (Database.sessions or 0) + 1
        print("You loaded this addon " .. Database.sessions .. " times")
    end
end

function frame:PLAYER_ENTERING_WORLD(event, isLogin, isReload)
    print("new PLAYER_ENTERING_WORLD event", event, isLogin, isReload)
end

function frame:CHAT_MSG_CHANNEL(event, text, playerName, _, channelName)
    print("new CHAT_MSG_CHANNEL event", event, text, playerName, channelName)
    Database.numberOfChatMessages = (Database.numberOfChatMessages or 0) + 1
    print("that was the", Database.numberOfChatMessages, "chat message")
end

frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("CHAT_MSG_CHANNEL")
frame:SetScript("OnEvent", frame.OnEvent)

-- increment the index for each slash command
SLASH_HELLOW1 = "/wl"
SLASH_HELLOW2 = "/wishlist"

SlashCmdList.HELLOW = function(msg, editBox)
    print("slash command was called", msg)
end
