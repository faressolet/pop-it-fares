-- SECURE Survival GUI with Whitelist, Close Button, Anti-Sit, and Xray Toggle
local Player = game:GetService("Players").LocalPlayer

-- Whitelist
local whitelist = {
    7969496808, -- your ID
    1972124365
}

if not table.find(whitelist, Player.UserId) then return end

-- GUI Setup
local gui = Instance.new("ScreenGui", game:GetService("CoreGui"))
gui.Name = "StyledSurvivalGUI"

local function makeFrame(parent, size, pos, color)
    local f = Instance.new("Frame", parent)
    f.Size = size
    f.Position = pos or UDim2.new(0, 0, 0, 0)
    f.BackgroundColor3 = color or Color3.fromRGB(35, 35, 40)
    f.BorderSizePixel = 0
    f.BackgroundTransparency = 0
    f.ClipsDescendants = true

    local corner = Instance.new("UICorner", f)
    corner.CornerRadius = UDim.new(0, 12)

    local shadow = Instance.new("UIStroke", f)
    shadow.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    shadow.Thickness = 1
    shadow.Color = Color3.fromRGB(60, 60, 65)

    return f
end

-- Main Container
local main = makeFrame(gui, UDim2.new(0, 440, 0, 400), UDim2.new(0.5, -220, 0.5, -200), Color3.fromRGB(28, 28, 32))
main.Active = true
main.Draggable = true

-- Tab Bar
local tabBar = makeFrame(main, UDim2.new(1, 0, 0, 40))
tabBar.BackgroundColor3 = Color3.fromRGB(45, 45, 50)

-- Close Button
local function makeSmallBtn(parent, text, pos, color)
    local b = Instance.new("TextButton", parent)
    b.Size = UDim2.new(0, 30, 0, 30)
    b.Position = pos
    b.Text = text
    b.Font = Enum.Font.GothamBold
    b.TextSize = 16
    b.BackgroundColor3 = color
    b.TextColor3 = Color3.new(1, 1, 1)
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
    return b
end

local closeBtn = makeSmallBtn(main, "X", UDim2.new(1, -35, 0, 5), Color3.fromRGB(200, 60, 60))

closeBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- Tab Content
local tabContent = Instance.new("Frame", main)
tabContent.Position = UDim2.new(0, 0, 0, 40)
tabContent.Size = UDim2.new(1, 0, 1, -40)
tabContent.BackgroundTransparency = 1

-- Tabs
local tabs = {
    Main = Instance.new("Frame", tabContent),
    Add = Instance.new("Frame", tabContent),
    Edit = Instance.new("Frame", tabContent),
}
for _, tab in pairs(tabs) do
    tab.Size = UDim2.new(1, 0, 1, 0)
    tab.BackgroundTransparency = 1
    tab.Visible = false
end

local currentTab = tabs.Main
currentTab.Visible = true

-- Tab Buttons
local tabButtons = {}
local function createTabButton(text, order, tabToShow)
    local b = Instance.new("TextButton", tabBar)
    b.Size = UDim2.new(0, 120, 1, 0)
    b.Position = UDim2.new(0, 120 * (order - 1), 0, 0)
    b.Text = text
    b.TextColor3 = Color3.new(1, 1, 1)
    b.BackgroundColor3 = Color3.fromRGB(70, 70, 75)
    b.Font = Enum.Font.Gotham
    b.TextSize = 14
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)

    b.MouseButton1Click:Connect(function()
        currentTab.Visible = false
        for _, btn in pairs(tabButtons) do
            btn.BackgroundColor3 = Color3.fromRGB(70, 70, 75)
        end
        tabToShow.Visible = true
        currentTab = tabToShow
        b.BackgroundColor3 = Color3.fromRGB(0, 180, 120)
    end)

    tabButtons[#tabButtons+1] = b
    if tabToShow == currentTab then
        b.BackgroundColor3 = Color3.fromRGB(0, 180, 120)
    end
end

createTabButton("Main", 1, tabs.Main)
createTabButton("Add", 2, tabs.Add)
createTabButton("Edit", 3, tabs.Edit)

-- Xray Toggle
local xrayBtn = Instance.new("TextButton", tabs.Main)
xrayBtn.Size = UDim2.new(0, 220, 0, 50)
xrayBtn.Position = UDim2.new(0.5, -110, 0, 30)
xrayBtn.Text = "ENABLE XRAY"
xrayBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
xrayBtn.TextColor3 = Color3.new(1, 1, 1)
xrayBtn.Font = Enum.Font.GothamSemibold
xrayBtn.TextSize = 16
Instance.new("UICorner", xrayBtn).CornerRadius = UDim.new(0, 10)

local xrayState = false
xrayBtn.MouseButton1Click:Connect(function()
    if not Player:FindFirstChild("XRay") then
        local xrayVal = Instance.new("BoolValue")
        xrayVal.Name = "XRay"
        xrayVal.Parent = Player
    end
    xrayState = not xrayState
    Player.XRay.Value = xrayState
    xrayBtn.Text = xrayState and "DISABLE XRAY" or "ENABLE XRAY"
    xrayBtn.BackgroundColor3 = xrayState and Color3.fromRGB(0, 180, 120) or Color3.fromRGB(60, 60, 70)
end)

-- Anti-Sit Toggle
local antiSitBtn = Instance.new("TextButton", tabs.Main)
antiSitBtn.Size = UDim2.new(0, 220, 0, 50)
antiSitBtn.Position = UDim2.new(0.5, -110, 0, 100)
antiSitBtn.Text = "ENABLE ANTI-SIT"
antiSitBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
antiSitBtn.TextColor3 = Color3.new(1, 1, 1)
antiSitBtn.Font = Enum.Font.GothamSemibold
antiSitBtn.TextSize = 16
Instance.new("UICorner", antiSitBtn).CornerRadius = UDim.new(0, 10)

local antiSitEnabled = false

local function toggleAntiSit()
    antiSitEnabled = not antiSitEnabled
    local hum = Player.Character and Player.Character:FindFirstChildOfClass("Humanoid")
    if hum then
        hum:SetStateEnabled(Enum.HumanoidStateType.Seated, not antiSitEnabled)
    end
    antiSitBtn.Text = antiSitEnabled and "DISABLE ANTI-SIT" or "ENABLE ANTI-SIT"
    antiSitBtn.BackgroundColor3 = antiSitEnabled and Color3.fromRGB(0, 180, 120) or Color3.fromRGB(60, 60, 70)
end

antiSitBtn.MouseButton1Click:Connect(toggleAntiSit)

-- Respawn Handler to Reapply Anti-Sit
Player.CharacterAdded:Connect(function(char)
    if antiSitEnabled then
        local hum = char:WaitForChild("Humanoid")
        hum:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
    end
end)

-- Add Tab Content
local newItemBox = Instance.new("TextBox", tabs.Add)
newItemBox.Size = UDim2.new(0, 200, 0, 40)
newItemBox.Position = UDim2.new(0.5, -100, 0, 40)
newItemBox.Text = ""
newItemBox.PlaceholderText = "Item Name"
newItemBox.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
newItemBox.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", newItemBox).CornerRadius = UDim.new(0, 10)

local initialQtyBox = Instance.new("TextBox", tabs.Add)
initialQtyBox.Size = UDim2.new(0, 200, 0, 40)
initialQtyBox.Position = UDim2.new(0.5, -100, 0, 90)
initialQtyBox.Text = ""
initialQtyBox.PlaceholderText = "Quantity"
initialQtyBox.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
initialQtyBox.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", initialQtyBox).CornerRadius = UDim.new(0, 10)

local addButton = Instance.new("TextButton", tabs.Add)
addButton.Size = UDim2.new(0, 200, 0, 40)
addButton.Position = UDim2.new(0.5, -100, 0, 140)
addButton.Text = "Add Item"
addButton.BackgroundColor3 = Color3.fromRGB(0, 180, 120)
addButton.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", addButton).CornerRadius = UDim.new(0, 10)

addButton.MouseButton1Click:Connect(function()
    local name = newItemBox.Text
    local quantity = tonumber(initialQtyBox.Text)
    if name ~= "" and quantity then
        local folder = Player:FindFirstChild("Items") or Instance.new("Folder", Player)
        folder.Name = "Items"
        if not folder:FindFirstChild(name) then
            local intVal = Instance.new("IntValue")
            intVal.Name = name
            intVal.Value = quantity
            intVal.Parent = folder
        end
    end
end)

-- Edit Tab Content
local itemNameBox = Instance.new("TextBox", tabs.Edit)
itemNameBox.Size = UDim2.new(0, 200, 0, 40)
itemNameBox.Position = UDim2.new(0.5, -100, 0, 40)
itemNameBox.Text = ""
itemNameBox.PlaceholderText = "Item Name"
itemNameBox.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
itemNameBox.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", itemNameBox).CornerRadius = UDim.new(0, 10)

local quantityBox = Instance.new("TextBox", tabs.Edit)
quantityBox.Size = UDim2.new(0, 200, 0, 40)
quantityBox.Position = UDim2.new(0.5, -100, 0, 90)
quantityBox.Text = ""
quantityBox.PlaceholderText = "New Quantity"
quantityBox.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
quantityBox.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", quantityBox).CornerRadius = UDim.new(0, 10)

local editButton = Instance.new("TextButton", tabs.Edit)
editButton.Size = UDim2.new(0, 200, 0, 40)
editButton.Position = UDim2.new(0.5, -100, 0, 140)
editButton.Text = "Edit Item"
editButton.BackgroundColor3 = Color3.fromRGB(0, 180, 120)
editButton.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", editButton).CornerRadius = UDim.new(0, 10)

editButton.MouseButton1Click:Connect(function()
    local name = itemNameBox.Text
    local quantity = tonumber(quantityBox.Text)
    if name ~= "" and quantity then
        local folder = Player:FindFirstChild("Items")
        if folder then
            local item = folder:FindFirstChild(name)
            if item and item:IsA("IntValue") then
                item.Value = quantity
            end
        end
    end
end)
