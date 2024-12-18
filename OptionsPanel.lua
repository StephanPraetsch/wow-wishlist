local addonName, addonData = ...

addonData.OptionsPanel = {}

local state = {}

local function init()
    print("OptionsPanel initializing")
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
    print("OptionsPanel initialized", state.categoryID)
end
addonData.OptionsPanel.init = init

local function show()
    print("OptionsPanel show", state.categoryID)
    Settings.OpenToCategory(state.categoryID)
end
addonData.OptionsPanel.show = show

local function hide()
    print("OptionsPanel hide")
end
addonData.OptionsPanel.hide = hide

