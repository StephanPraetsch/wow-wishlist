print("hello wishlist")

local frame = CreateFrame("Frame")

function frame:OnEvent(event, ...)
    self[event](self, event, ...)
end

function frame:ADDON_LOADED(event, addOnName)
    print("new event", event, addOnName)
end

function frame:PLAYER_ENTERING_WORLD(event, isLogin, isReload)
    print("new event", event, isLogin, isReload)
end

function frame:CHAT_MSG_CHANNEL(event, text, playerName, _, channelName)
    print("new event", event, text, playerName, channelName)
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
