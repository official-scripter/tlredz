-- AnnouncementLocalScript.lua
-- Full visible text + small clean UI
-- Opens Discord link in default browser (Chrome if default)
-- By: Gonzales Official

local Players = game:GetService("Players")
local GuiService = game:GetService("GuiService")
local StarterGui = game:GetService("StarterGui")

local DISCORD_INVITE = "https://discord.gg/N3Zmrm3e2n"

local player = Players.LocalPlayer
if not player then return end

-- Screen GUI
local gui = Instance.new("ScreenGui")
gui.Name = "DiscordAnnouncement"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Main Frame (slightly taller to fit full text)
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 360, 0, 170)
frame.Position = UDim2.new(0.5, -180, 0.75, -85)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
frame.BorderSizePixel = 0
frame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

-- Title / Announcement text (fits fully visible)
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -20, 0, 100)
title.Position = UDim2.new(0, 10, 0, 12)
title.BackgroundTransparency = 1
title.Text = "📢 Announcement\nJoin my Discord Giveaway Executor & Script"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.TextWrapped = true
title.TextYAlignment = Enum.TextYAlignment.Center
title.Parent = frame

-- "Click Here" button (centered below text)
local button = Instance.new("TextButton")
button.Size = UDim2.new(0.6, 0, 0, 40)
button.Position = UDim2.new(0.2, 0, 0.75, 0)
button.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
button.Text = "Click Here"
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Font = Enum.Font.GothamBold
button.TextScaled = true
button.AutoButtonColor = false
button.Parent = frame

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 8)
btnCorner.Parent = button

-- Hover effect
button.MouseEnter:Connect(function()
	button.BackgroundColor3 = Color3.fromRGB(0, 180, 255)
end)
button.MouseLeave:Connect(function()
	button.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
end)

-- "X" close button
local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 28, 0, 28)
close.Position = UDim2.new(1, -34, 0, 6)
close.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
close.Text = "✕"
close.Font = Enum.Font.GothamBold
close.TextSize = 18
close.TextColor3 = Color3.fromRGB(220, 220, 220)
close.Parent = frame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = close

close.MouseButton1Click:Connect(function()
	frame:Destroy()
end)

-- Click opens Discord link in browser
button.MouseButton1Click:Connect(function()
	local success, err = pcall(function()
		GuiService:OpenBrowserWindow(DISCORD_INVITE)
	end)

	if success then
		StarterGui:SetCore("SendNotification", {
			Title = "Opening Chrome...",
			Text = "Joining Discord Giveaway Executor & Script...",
			Duration = 4
		})
	else
		StarterGui:SetCore("SendNotification", {
			Title = "Join Manually",
			Text = "Copy this link: " .. DISCORD_INVITE,
			Duration = 6
		})
	end
end)
