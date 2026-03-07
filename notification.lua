local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SunriseNotification"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Name = "NotificationFrame"
frame.Size = UDim2.new(0, 300, 0, 70)
frame.Position = UDim2.new(1, 20, 1, -90)
frame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
frame.BorderSizePixel = 0
frame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

local icon = Instance.new("TextLabel")
icon.Size = UDim2.new(0, 36, 0, 36)
icon.Position = UDim2.new(0, 12, 0.5, -18)
icon.BackgroundTransparency = 1
icon.Text = "☀️"
icon.TextSize = 22
icon.Font = Enum.Font.GothamBold
icon.TextXAlignment = Enum.TextXAlignment.Center
icon.TextYAlignment = Enum.TextYAlignment.Center
icon.ZIndex = 2
icon.Parent = frame

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -65, 0, 22)
titleLabel.Position = UDim2.new(0, 56, 0, 12)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Sunrise.cc"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 15
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.ZIndex = 2
titleLabel.Parent = frame

local subtitleLabel = Instance.new("TextLabel")
subtitleLabel.Size = UDim2.new(1, -65, 0, 18)
subtitleLabel.Position = UDim2.new(0, 56, 0, 36)
subtitleLabel.BackgroundTransparency = 1
subtitleLabel.Text = "✔  Injected successfully"
subtitleLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
subtitleLabel.Font = Enum.Font.Gotham
subtitleLabel.TextSize = 12
subtitleLabel.TextXAlignment = Enum.TextXAlignment.Left
subtitleLabel.ZIndex = 2
subtitleLabel.Parent = frame

local progressBg = Instance.new("Frame")
progressBg.Size = UDim2.new(1, 0, 0, 3)
progressBg.Position = UDim2.new(0, 0, 1, -3)
progressBg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
progressBg.BorderSizePixel = 0
progressBg.ZIndex = 2
progressBg.Parent = frame

local progressBgCorner = Instance.new("UICorner")
progressBgCorner.CornerRadius = UDim.new(0, 12)
progressBgCorner.Parent = progressBg

local progressFill = Instance.new("Frame")
progressFill.Size = UDim2.new(1, 0, 1, 0)
progressFill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
progressFill.BorderSizePixel = 0
progressFill.ZIndex = 3
progressFill.Parent = progressBg

local progressFillCorner = Instance.new("UICorner")
progressFillCorner.CornerRadius = UDim.new(0, 12)
progressFillCorner.Parent = progressFill

local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 160, 30)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 220, 50))
})
gradient.Rotation = 90
gradient.Parent = progressFill

local progressFillCorner = Instance.new("UICorner")
progressFillCorner.CornerRadius = UDim.new(0, 12)
progressFillCorner.Parent = progressFill

local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://6026984224"
sound.Volume = 0.4
sound.Parent = screenGui
sound:Play()

TweenService:Create(frame,
    TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
    { Position = UDim2.new(1, -314, 1, -90) }
):Play()

task.wait(0.3)
TweenService:Create(progressFill,
    TweenInfo.new(3, Enum.EasingStyle.Linear),
    { Size = UDim2.new(0, 0, 1, 0) }
):Play()

task.wait(3)

local slideOut = TweenService:Create(frame,
    TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.In),
    { Position = UDim2.new(1, 20, 1, -90) }
)
slideOut:Play()
slideOut.Completed:Connect(function()
    screenGui:Destroy()
end)
