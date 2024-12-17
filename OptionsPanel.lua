local addonName, addonData = ...

local options = {
    reportJump = false,
    categoryID = nil,
    panel = nil,
}
addonData.OptionsPanel = options


local function init()
    print("OptionsPanel initializing")
    panel = CreateFrame("Frame")
    options.panel = panel
    panel.name = "HelloWorld"

    local cb = CreateFrame("CheckButton", nil, panel, "InterfaceOptionsCheckButtonTemplate")
    cb:SetPoint("TOPLEFT", 20, -20)
    cb.Text:SetText("Print when you jump")
    cb:HookScript("OnClick", function(_, btn, down)
        options.reportJump = cb:GetChecked()
    end)
    cb:SetChecked(options.reportJump)

    local btn = CreateFrame("Button", nil, panel, "UIPanelButtonTemplate")
    btn:SetPoint("TOPLEFT", cb, 0, -40)
    btn:SetText("Click me")
    btn:SetWidth(100)
    btn:SetScript("OnClick", function()
        print("You clicked me!")
    end)

    local category = Settings.RegisterCanvasLayoutCategory(panel, ADDON_NAME)
    Settings.RegisterAddOnCategory(category)
    options.categoryID = category:GetID()
    print("OptionsPanel initialized")
end
addonData.OptionsPanel.init = init

local function show()
    print("OptionsPanel show", options.categoryID)
    Settings.OpenToCategory(options.categoryID)
end
addonData.OptionsPanel.show = show

local function hide()
    print("OptionsPanel hide")
end
addonData.OptionsPanel.hide = hide

