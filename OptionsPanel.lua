local addonName, addonData = ...

addonData.OptionsPanel = {}

local state = {}

local function init()
    panel = CreateFrame("Frame")
    panel.name = "HelloWorld"

    local cb = CreateFrame("CheckButton", nil, panel, "InterfaceOptionsCheckButtonTemplate")
    cb:SetPoint("TOPLEFT", 20, -20)
    cb.Text:SetText("Print when you jump")
    cb:HookScript("OnClick", function(_, btn, down)
        Database.reportJump = cb:GetChecked()
    end)
    cb:SetChecked(Database.reportJump)

    local btn = CreateFrame("Button", nil, panel, "UIPanelButtonTemplate")
    btn:SetPoint("TOPLEFT", cb, 0, -40)
    btn:SetText("Click me")
    btn:SetWidth(100)
    btn:SetScript("OnClick", function()
        print("You clicked me!")
    end)

    local category = Settings.RegisterCanvasLayoutCategory(panel, ADDON_NAME)
    Settings.RegisterAddOnCategory(category)
    state.categoryID = category:GetID()
end
addonData.OptionsPanel.init = init

local function show()
    Settings.OpenToCategory(state.categoryID)
end
addonData.OptionsPanel.show = show
