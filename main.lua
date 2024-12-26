local addonName, addonData = ...

OptionsPanel = addonData.OptionsPanel

ADDON_NAME = "wow-wishlist"

local frame = CreateFrame("Frame")

function frame:OnEvent(event, ...)
    if DEBUG then
        print("onEvent", event, ...)
    end
    self[event](self, event, ...)
end

function frame:ADDON_LOADED(event, addOnName)
    if addOnName == ADDON_NAME then
        OptionsPanel.init()
        hooksecurefunc("JumpOrAscendStart", function()
            if Database.reportJump then
                Database.jumps = (Database.jumps or 0) + 1
                print("Your character jumped " .. Database.jumps .. " times")
            end
        end)
    end
end

function frame:PLAYER_ENTERING_WORLD(event, isLogin, isReload)
    --print("new PLAYER_ENTERING_WORLD event", event, isLogin, isReload)
end

function frame:CHAT_MSG_CHANNEL(event, text, playerName, _, channelName)
    --print("new CHAT_MSG_CHANNEL event", event, text, playerName, channelName)
end

frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
--frame:RegisterEvent("CHAT_MSG_CHANNEL")
frame:SetScript("OnEvent", frame.OnEvent)

SLASH_WISHLIST1 = "/wlo"
SLASH_WISHLIST2 = "/wishlist-options"

SlashCmdList.WISHLIST = function(msg, editBox)
    OptionsPanel.show()
end
