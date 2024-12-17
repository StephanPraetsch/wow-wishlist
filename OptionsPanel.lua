local addonName, addonData = ...

addonData.OptionsPanel = {}

local function init()
    print("OptionsPanel init")
end
addonData.OptionsPanel.init = init

local function show()
    print("OptionsPanel show")
end
addonData.OptionsPanel.show = show

local function hide()
    print("OptionsPanel hide")
end
addonData.OptionsPanel.hide = hide

