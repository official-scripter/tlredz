--[[ 
    📢 UNIVERSAL ANNOUNCEMENT UI | Roblox Script Executor Compatible
    Created by: Gonzales Official
    Features:
      - Small movable UI
      - "-" to hide / show
      - "x" to destroy tab
      - Works in all Roblox games
      - Permanent script (never expires)
      - Join Discord button
]]

-- Services
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")
local plr = Players.LocalPlayer

-- Remove old UI if exists
if CoreGui:FindFirstChild("AnnouncementUI") then
    CoreGui:FindFirstChild("AnnouncementUI"):Destroy()
end

-- ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "AnnouncementUI"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = CoreGui

-- Main Frame
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 260, 0, 130)
main.Position = UDim2.new(0.35, 0, 0.35, 0)
main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
main.Active = true
main.Draggable = true
main.BorderSizePixel = 0
main.Parent = gui

-- Rounded Corners
local corner = Instance.new("UICorner", main)
corner.CornerRadius = UDim.new(0, 10)

-- Top Bar
local topbar = Instance.new("Frame")
topbar.Size = UDim2.new(1, 0, 0, 30)
topbar.BackgroundColor3 = Color3.fromRGB(30, 144, 255)
topbar.BorderSizePixel = 0
topbar.Parent = main

local topCorner = Instance.new("UICorner", topbar)
topCorner.CornerRadius = UDim.new(0, 10)

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -60, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "📢 ANNOUNCEMENT"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.Parent = topbar

-- Minimize Button (-)
local minimize = Instance.new("TextButton")
minimize.Size = UDim2.new(0, 25, 0, 25)
minimize.Position = UDim2.new(1, -50, 0, 2)
minimize.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
minimize.Text = "-"
minimize.TextColor3 = Color3.fromRGB(255, 255, 255)
minimize.Font = Enum.Font.GothamBold
minimize.TextScaled = true
minimize.Parent = topbar

local miniCorner = Instance.new("UICorner", minimize)
miniCorner.CornerRadius = UDim.new(1, 0)

-- Close Button (x)
local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 25, 0, 25)
close.Position = UDim2.new(1, -25, 0, 2)
close.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
close.Text = "x"
close.TextColor3 = Color3.fromRGB(255, 255, 255)
close.Font = Enum.Font.GothamBold
close.TextScaled = true
close.Parent = topbar

local closeCorner = Instance.new("UICorner", close)
closeCorner.CornerRadius = UDim.new(1, 0)

-- Announcement Message
local msg = Instance.new("TextLabel")
msg.Size = UDim2.new(1, -20, 0, 50)
msg.Position = UDim2.new(0, 10, 0, 40)
msg.BackgroundTransparency = 1
msg.Text = "Join My Discord Get Executor & Script For Free"
msg.TextColor3 = Color3.fromRGB(255, 255, 255)
msg.Font = Enum.Font.Gotham
msg.TextWrapped = true
msg.TextScaled = true
msg.Parent = main

-- Join Discord Button
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 180, 0, 30)
button.Position = UDim2.new(0.5, -90, 1, -40)
button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
button.Text = "Join Discord"
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Font = Enum.Font.GothamBold
button.TextScaled = true
button.Parent = main

local buttonCorner = Instance.new("UICorner", button)
buttonCorner.CornerRadius = UDim.new(0, 8)

-- Functions
button.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/N3Zmrm3e2n")
    StarterGui:SetCore("SendNotification", {
        Title = "Copied!";
        Text = "Discord link copied! Paste in Chrome to join.";
        Duration = 5;
    })
end)

close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

local hidden = false
minimize.MouseButton1Click:Connect(function()
    hidden = not hidden
    for _, obj in ipairs(main:GetChildren()) do
        if obj ~= topbar then
            obj.Visible = not hidden
        end
    end
end)
