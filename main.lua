local addonName, addonData = ...

print("hello wishlist", addonName, addonData)

OptionsPanel = addonData.OptionsPanel

ADDON_NAME = "wow-wishlist"

local frame = CreateFrame("Frame")
Database = Database or {} -- /dump Database

function frame:OnEvent(event, addOnName)
    if addOnName == ADDON_NAME then
        print("special event", event, addOnName)
        self.db = Database
        self:InitializeOptions()
        hooksecurefunc("JumpOrAscendStart", function()
            if self.db.reportJump then
                print("Your character jumped.")
            end
        end)
    end
end

function frame:ADDON_LOADED(event, addOnName)
    print("new ADDON_LOADED event", event, addOnName)
    if addOnName == ADDON_NAME then
        Database.sessions = (Database.sessions or 0) + 1
        print("You loaded this addon " .. Database.sessions .. " times")
    end
end

function frame:PLAYER_ENTERING_WORLD(event, isLogin, isReload)
    print("new PLAYER_ENTERING_WORLD event", event, isLogin, isReload)
end

frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent", frame.OnEvent)

function frame:InitializeOptions()
    print("frame:InitializeOptions")
    OptionsPanel.init()

    self.panel = CreateFrame("Frame")
    self.panel.name = "HelloWorld"

    local cb = CreateFrame("CheckButton", nil, self.panel, "InterfaceOptionsCheckButtonTemplate")
    cb:SetPoint("TOPLEFT", 20, -20)
    cb.Text:SetText("Print when you jump")
    cb:HookScript("OnClick", function(_, btn, down)
        self.db.reportJump = cb:GetChecked()
    end)
    cb:SetChecked(self.db.reportJump)

    local btn = CreateFrame("Button", nil, self.panel, "UIPanelButtonTemplate")
    btn:SetPoint("TOPLEFT", cb, 0, -40)
    btn:SetText("Click me")
    btn:SetWidth(100)
    btn:SetScript("OnClick", function()
        print("You clicked me!")
    end)

    print("add category")
    local category = Settings.RegisterCanvasLayoutCategory(self.panel, ADDON_NAME)
    Settings.RegisterAddOnCategory(category)
    print("added category", category:GetID())
    frame.panel.categoryID = category:GetID()
end

SLASH_HELLOW1 = "/wl"
SLASH_HELLOW2 = "/wishlist"

SlashCmdList.HELLOW = function(msg, editBox)
    print("slash command was called", msg)
    local settingsCategoryID = frame.panel.categoryID
    print("open category", settingsCategoryID)
    Settings.OpenToCategory(settingsCategoryID)
    OptionsPanel.show()
end
