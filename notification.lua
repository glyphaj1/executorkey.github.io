local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "NotificationGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local notificationFrame = Instance.new("Frame")
notificationFrame.Name = "NotificationFrame"
notificationFrame.Size = UDim2.new(0, 300, 0, 80)
notificationFrame.Position = UDim2.new(1, -320, 1, -100)
notificationFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
notificationFrame.BorderSizePixel = 0
notificationFrame.BackgroundTransparency = 1
notificationFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = notificationFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "Title"
titleLabel.Size = UDim2.new(1, -20, 0, 30)
titleLabel.Position = UDim2.new(0, 10, 0, 10)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Sunrise"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 18
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.TextTransparency = 1
titleLabel.Parent = notificationFrame

local subtitleLabel = Instance.new("TextLabel")
subtitleLabel.Name = "Subtitle"
subtitleLabel.Size = UDim2.new(1, -20, 0, 30)
subtitleLabel.Position = UDim2.new(0, 10, 0, 40)
subtitleLabel.BackgroundTransparency = 1
subtitleLabel.Text = "Attached successfully"
subtitleLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
subtitleLabel.Font = Enum.Font.Gotham
subtitleLabel.TextSize = 14
subtitleLabel.TextXAlignment = Enum.TextXAlignment.Left
subtitleLabel.TextTransparency = 1
subtitleLabel.Parent = notificationFrame

local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://6026984224"
sound.Volume = 0.5
sound.Parent = screenGui
sound:Play()

local tweenInfoIn = TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
local tweenInfoOut = TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.In)

local fadeInFrame = TweenService:Create(notificationFrame, tweenInfoIn, {BackgroundTransparency = 0})
local fadeInTitle = TweenService:Create(titleLabel, tweenInfoIn, {TextTransparency = 0})
local fadeInSubtitle = TweenService:Create(subtitleLabel, tweenInfoIn, {TextTransparency = 0})

fadeInFrame:Play()
fadeInTitle:Play()
fadeInSubtitle:Play()

task.wait(3)

local fadeOutFrame = TweenService:Create(notificationFrame, tweenInfoOut, {BackgroundTransparency = 1})
local fadeOutTitle = TweenService:Create(titleLabel, tweenInfoOut, {TextTransparency = 1})
local fadeOutSubtitle = TweenService:Create(subtitleLabel, tweenInfoOut, {TextTransparency = 1})

fadeOutFrame:Play()
fadeOutTitle:Play()
fadeOutSubtitle:Play()

fadeOutFrame.Completed:Connect(function()
    screenGui:Destroy()
end)
