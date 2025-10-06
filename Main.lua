-- AnnouncementLocalScript.lua
-- Small floating announcement GUI with a polished "Click Here" button
-- Safe for Roblox Studio. Place in StarterPlayer -> StarterPlayerScripts (or StarterGui).
-- By: Gonzales Official (example)
-- Edit DISCORD_INVITE below to change the invite.

local Players = game:GetService("Players")
local GuiService = game:GetService("GuiService")
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")

local DISCORD_INVITE = "https://discord.gg/N3Zmrm3e2n" -- change to your invite

local player = Players.LocalPlayer
if not player then return end

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TinyDiscordAnnouncement"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Main Frame (small)
local frame = Instance.new("Frame")
frame.Name = "Main"
frame.Size = UDim2.new(0, 320, 0, 86) -- compact size
frame.Position = UDim2.new(0.5, -160, 0.12, 0)
frame.AnchorPoint = Vector2.new(0.5, 0)
frame.BackgroundColor3 = Color3.fromRGB(22, 24, 28)
frame.BorderSizePixel = 0
frame.Active = true -- allow input for dragging
frame.Parent = screenGui

local uic = Instance.new("UICorner")
uic.CornerRadius = UDim.new(0, 10)
uic.Parent = frame

-- Left accent bar
local accent = Instance.new("Frame")
accent.Size = UDim2.new(0, 6, 1, 0)
accent.Position = UDim2.new(0, 0, 0, 0)
accent.BackgroundColor3 = Color3.fromRGB(0, 160, 255)
accent.BorderSizePixel = 0
accent.Parent = frame

-- Title label (compact)
local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(1, -140, 0, 40)
title.Position = UDim2.new(0, 14, 0, 8)
title.BackgroundTransparency = 1
title.Text = "🎉 Join My Discord For Giveaway Script For Free"
title.TextColor3 = Color3.fromRGB(240, 240, 240)
title.Font = Enum.Font.GothamBold
title.TextSize = 14
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextTruncate = Enum.TextTruncate.AtEnd
title.Parent = frame

-- Subtitle small
local subtitle = Instance.new("TextLabel")
subtitle.Name = "Subtitle"
subtitle.Size = UDim2.new(1, -140, 0, 16)
subtitle.Position = UDim2.new(0, 14, 0, 44)
subtitle.BackgroundTransparency = 1
subtitle.Text = "Click below to join — free giveaways!"
subtitle.TextColor3 = Color3.fromRGB(180, 180, 180)
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 12
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.Parent = frame

-- Stylish button container (right side)
local btnContainer = Instance.new("Frame")
btnContainer.Size = UDim2.new(0, 104, 0, 40)
btnContainer.Position = UDim2.new(1, -118, 0, 23)
btnContainer.BackgroundTransparency = 1
btnContainer.Parent = frame

-- Button (rounded)
local button = Instance.new("TextButton")
button.Size = UDim2.new(1, 0, 1, 0)
button.Position = UDim2.new(0, 0, 0, 0)
button.BackgroundColor3 = Color3.fromRGB(0, 142, 255)
button.BorderSizePixel = 0
button.Font = Enum.Font.GothamBold
button.Text = "Click Here"
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.TextSize = 14
button.AutoButtonColor = false -- we implement our own hover
button.Parent = btnContainer

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 8)
btnCorner.Parent = button

-- Button hover effects
button.MouseEnter:Connect(function()
    button:TweenSizeAndPosition(UDim2.new(1, 0, 1, 0), button.Position, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.12, true)
    button.BackgroundColor3 = Color3.fromRGB(0, 172, 255)
end)
button.MouseLeave:Connect(function()
    button:TweenSizeAndPosition(UDim2.new(1, 0, 1, 0), button.Position, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.12, true)
    button.BackgroundColor3 = Color3.fromRGB(0, 142, 255)
end)

-- Minimize and Close (tiny)
local minBtn = Instance.new("TextButton")
minBtn.Name = "Minimize"
minBtn.Size = UDim2.new(0, 26, 0, 22)
minBtn.Position = UDim2.new(1, -86, 0, 8)
minBtn.AnchorPoint = Vector2.new(0, 0)
minBtn.BackgroundTransparency = 0.2
minBtn.BackgroundColor3 = Color3.fromRGB(40, 44, 50)
minBtn.BorderSizePixel = 0
minBtn.Text = "–"
minBtn.Font = Enum.Font.GothamBold
minBtn.TextSize = 18
minBtn.TextColor3 = Color3.fromRGB(220, 220, 220)
minBtn.Parent = frame

local minCorner = Instance.new("UICorner")
minCorner.CornerRadius = UDim.new(0, 6)
minCorner.Parent = minBtn

local closeBtn = Instance.new("TextButton")
closeBtn.Name = "Close"
closeBtn.Size = UDim2.new(0, 26, 0, 22)
closeBtn.Position = UDim2.new(1, -56, 0, 8)
closeBtn.AnchorPoint = Vector2.new(0, 0)
closeBtn.BackgroundTransparency = 0.15
closeBtn.BackgroundColor3 = Color3.fromRGB(40, 44, 50)
closeBtn.BorderSizePixel = 0
closeBtn.Text = "✕"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 14
closeBtn.TextColor3 = Color3.fromRGB(220, 220, 220)
closeBtn.Parent = frame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeBtn

-- Minimize behavior: toggle compact mode
local minimized = false
minBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        -- shrink to tiny bar
        frame:TweenSizeAndPosition(UDim2.new(0, 180, 0, 40), UDim2.new(0.5, -90, 0.12, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.18, true)
        title.Visible = false
        subtitle.Visible = false
        btnContainer.Visible = false
    else
        frame:TweenSizeAndPosition(UDim2.new(0, 320, 0, 86), UDim2.new(0.5, -160, 0.12, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.18, true)
        title.Visible = true
        subtitle.Visible = true
        btnContainer.Visible = true
    end
end)

-- Close behavior
closeBtn.MouseButton1Click:Connect(function()
    frame:Destroy()
end)

-- Dragging support (mouse and touch)
local dragging = false
local dragInput, dragStart, startPos
local function update(input)
    local delta = input.Position - dragStart
    frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        update(input)
    end
end)

-- Button click: attempt to open browser with invite
button.MouseButton1Click:Connect(function()
    -- show a short notification (non-blocking)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "Discord Invite";
            Text = "Opening invite in browser (if allowed)...";
            Duration = 3;
        })
    end)
    local ok, err = pcall(function()
        GuiService:OpenBrowserWindow(DISCORD_INVITE)
    end)
    if not ok then
        -- fallback: notify with the invite (so player can copy)
        pcall(function()
            StarterGui:SetCore("SendNotification", {
                Title = "Open Manually";
                Text = "Couldn't open automatically. Copy: "..DISCORD_INVITE;
                Duration = 6;
            })
        end)
        warn("OpenBrowserWindow failed or not supported. Invite:", DISCORD_INVITE)
    end
end)
