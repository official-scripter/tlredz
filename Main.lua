--[[ 
    📢 ANNOUNCEMENT UI | Roblox Script Executor Compatible
    Made by: Gonzales Official
    Features:
      - Small movable tab
      - Full visible announcement
      - Discord button (opens via Chrome by copying link)
      - Works in all games
]]

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local plr = Players.LocalPlayer

-- Remove existing UI
if CoreGui:FindFirstChild("AnnouncementUI") then
    CoreGui:FindFirstChild("AnnouncementUI"):Destroy()
end

-- ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "AnnouncementUI"
gui.ResetOnSpawn = false
gui.Parent = CoreGui

-- Main Frame
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 280, 0, 140)
main.Position = UDim2.new(0.35, 0, 0.35, 0)
main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Parent = gui

-- Rounded Corners
local corner = Instance.new("UICorner", main)
corner.CornerRadius = UDim.new(0, 10)

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundColor3 = Color3.fromRGB(30, 144, 255)
title.Text = "📢 ANNOUNCEMENT"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.Parent = main

local titleCorner = Instance.new("UICorner", title)
titleCorner.CornerRadius = UDim.new(0, 10)

-- Message
local msg = Instance.new("TextLabel")
msg.Size = UDim2.new(1, -20, 0, 60)
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
button.Size = UDim2.new(0, 200, 0, 30)
button.Position = UDim2.new(0.5, -100, 1, -40)
button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
button.Text = "Join Discord"
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Font = Enum.Font.GothamBold
button.TextScaled = true
button.Parent = main

local buttonCorner = Instance.new("UICorner", button)
buttonCorner.CornerRadius = UDim.new(0, 8)

-- Button Function
button.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/N3Zmrm3e2n")
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Copied!";
        Text = "Discord link copied! Paste in Chrome to join.";
        Duration = 5;
    })
end)
