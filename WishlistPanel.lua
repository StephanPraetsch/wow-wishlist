-- Define the Panel class
local Panel = {}
Panel.__index = Panel

-- Constructor: Create a new Panel instance
function Panel:New()
    local instance = setmetatable({}, self)
    instance:Init() -- Initialize the panel
    return instance
end

-- Method to initialize the panel
function Panel:Init()
    -- Create the frame
    self.frame = CreateFrame("Frame", "MyCustomFrame", UIParent, "BasicFrameTemplateWithInset")

    -- Set the size of the frame
    self.frame:SetSize(300, 200) -- Width, Height

    -- Set the position of the frame (centered on the screen)
    self.frame:SetPoint("CENTER", UIParent, "CENTER")

    -- Enable mouse interaction and dragging
    self.frame:EnableMouse(true)
    self.frame:SetMovable(true)
    self.frame:RegisterForDrag("LeftButton")
    self.frame:SetScript("OnDragStart", self.frame.StartMoving)
    self.frame:SetScript("OnDragStop", self.frame.StopMovingOrSizing)

    -- Add a title
    local Title = self.frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
    Title:SetPoint("CENTER", self.frame.TitleBg, "CENTER", 0, 0)
    Title:SetText("My Custom Panel")

    -- Hide the frame initially
    self.frame:Hide()
end

-- Method to show the panel
function Panel:Show()
    if self.frame then
        self.frame:Show()
    end
end

-- Method to hide the panel
function Panel:Hide()
    if self.frame then
        self.frame:Hide()
    end
end

-- Create an instance of the Panel
WishlistPanel = Panel:New()

-- Example usage: Show the panel
--WishlistPanel:Show()
