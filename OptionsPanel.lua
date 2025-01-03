local addonName, addonData = ...

local state = {}

addonData.OptionsPanel = {

    init = function()
        local db = WOW_WISHLIST_Database_Global

        local panel = CreateFrame("Frame")
        panel.name = "Wishlist Options"

        local cb = CreateFrame("CheckButton", nil, panel, "InterfaceOptionsCheckButtonTemplate")
        cb:SetPoint("TOPLEFT", 20, -20)
        cb.Text:SetText("Print when you jump")
        cb:HookScript("OnClick", function(_, btn, down)
            db.reportJump = cb:GetChecked()
        end)
        cb:SetChecked(db.reportJump)

        local debugButton = CreateFrame("CheckButton", nil, panel, "InterfaceOptionsCheckButtonTemplate")
        debugButton:SetPoint("TOPLEFT", cb, 0, -30)
        debugButton.Text:SetText("debug")
        debugButton:HookScript("OnClick", function(_, btn, down)
            db.debug = debugButton:GetChecked()
        end)
        debugButton:SetChecked(db.debug)

        local btn = CreateFrame("Button", nil, panel, "UIPanelButtonTemplate")
        btn:SetPoint("TOPLEFT", cb, 0, -60)
        btn:SetText("Click me")
        btn:SetWidth(100)
        btn:SetScript("OnClick", function()
            print("You clicked me!")
        end)

        local category = Settings.RegisterCanvasLayoutCategory(panel, "wow-wishlist")
        Settings.RegisterAddOnCategory(category)
        state.categoryID = category:GetID()
    end,

    show = function()
        Settings.OpenToCategory(state.categoryID)
    end,

}
