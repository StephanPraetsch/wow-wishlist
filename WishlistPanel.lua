-- Define the WishlistPanel class
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
    self.frame:SetSize(300, 200)
    self.frame:SetPoint("CENTER", UIParent, "CENTER")
    self.frame:EnableMouse(true)
    self.frame:SetMovable(true)
    self.frame:RegisterForDrag("LeftButton")
    self.frame:SetScript("OnDragStart", self.frame.StartMoving)
    self.frame:SetScript("OnDragStop", self.frame.StopMovingOrSizing)

    -- Add a title
    local Title = self.frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
    Title:SetPoint("CENTER", self.frame.TitleBg, "CENTER", 0, 0)
    Title:SetText("Wishlist Panel")

    -- Hide the frame initially
    self.frame:Hide()

    -- Add an item slot field
    self:AddItemSlot()
end

-- Method to add an item slot field
function Panel:AddItemSlot()
    -- Create the item slot button
    self.itemSlot = CreateFrame("Button", nil, self.frame, "BackdropTemplate")
    self.itemSlot:SetSize(40, 40)
    self.itemSlot:SetPoint("TOP", self.frame, "TOP", 0, -40)

    -- Add a texture to display the item icon
    self.itemSlot.icon = self.itemSlot:CreateTexture(nil, "BACKGROUND")
    self.itemSlot.icon:SetAllPoints()
    self.itemSlot.icon:SetTexture(nil) -- Start with no texture

    -- Add a backdrop for better visibility
    self.itemSlot:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true,
        tileSize = 16,
        edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 }
    })

    -- Set up scripts for drag-and-drop functionality
    self.itemSlot:SetScript("OnClick", function(self, button)
        if button == "RightButton" then
            ClearCursor() -- Clear any held item on right-click
            self.icon:SetTexture(nil) -- Remove the icon
        end
    end)

    self.itemSlot:SetScript("OnReceiveDrag", function(self)
        local type, itemID, link = GetCursorInfo()
        if type == "item" then
            local texture = select(10, GetItemInfo(itemID)) -- Get item icon texture
            self.icon:SetTexture(texture) -- Set the icon to the button
            ClearCursor() -- Clear the cursor after setting the item
        end
    end)

    self.itemSlot:SetScript("OnEnter", function(self)
        local type, itemID, link = GetCursorInfo()
        if type == "item" then
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetHyperlink(link) -- Show tooltip for the item
            GameTooltip:Show()
        end
    end)

    self.itemSlot:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)
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

-- Create and export the global WishlistPanel instance
WishlistPanel = Panel:New()
