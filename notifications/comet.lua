
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CometNotification"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

local particleCount = 35
local particles = {}

for i = 1, particleCount do
	local particle = Instance.new("Frame")
	particle.Size = UDim2.new(0, math.random(2, 5), 0, math.random(2, 5))
	particle.Position = UDim2.new(math.random(), 0, math.random(), 0)
	particle.BackgroundColor3 = Color3.fromRGB(
		math.random(200, 255),
		math.random(0, 80),
		math.random(120, 200)
	)
	particle.BackgroundTransparency = math.random(0, 5) / 10
	particle.BorderSizePixel = 0
	particle.ZIndex = 1
	particle.Parent = screenGui

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(1, 0)
	corner.Parent = particle

	particles[i] = particle
end

local function animateParticle(particle)
	local startX = math.random()
	local startY = math.random()
	local duration = math.random(3, 7)

	particle.Position = UDim2.new(startX, 0, startY, 0)

	local drift = TweenService:Create(particle,
		TweenInfo.new(duration, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
		{
			Position = UDim2.new(
				math.clamp(startX + math.random(-20, 20) / 100, 0, 1),
				0,
				math.clamp(startY - math.random(5, 20) / 100, 0, 1),
				0
			),
			BackgroundTransparency = math.random(3, 8) / 10
		}
	)
	drift:Play()
end

for _, particle in ipairs(particles) do
	task.delay(math.random() * 2, function()
		animateParticle(particle)
	end)
end

local frame = Instance.new("Frame")
frame.Name = "NotificationFrame"
frame.Size = UDim2.new(0, 300, 0, 90)
frame.Position = UDim2.new(1, 20, 1, -110)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BorderSizePixel = 0
frame.ClipsDescendants = true
frame.ZIndex = 2
frame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(220, 40, 140)
stroke.Thickness = 1
stroke.Transparency = 0.5
stroke.Parent = frame

local iconFrame = Instance.new("Frame")
iconFrame.Size = UDim2.new(0, 36, 0, 36)
iconFrame.Position = UDim2.new(0, 14, 0.5, -18)
iconFrame.BackgroundTransparency = 1
iconFrame.ZIndex = 3
iconFrame.Parent = frame

local icon = Instance.new("TextLabel")
icon.Size = UDim2.new(1, 0, 1, 0)
icon.Position = UDim2.new(0, 0, 0, 0)
icon.BackgroundTransparency = 1
icon.Text = "</>"
icon.TextSize = 20
icon.Font = Enum.Font.GothamBold
icon.TextXAlignment = Enum.TextXAlignment.Center
icon.TextYAlignment = Enum.TextYAlignment.Center
icon.TextColor3 = Color3.fromRGB(255, 255, 255)
icon.ZIndex = 3
icon.Parent = iconFrame

local iconGradient = Instance.new("UIGradient")
iconGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 100, 200)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(180, 0, 100))
})
iconGradient.Rotation = 90
iconGradient.Parent = icon

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -66, 0, 20)
titleLabel.Position = UDim2.new(0, 60, 0, 12)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Comet"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 14
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.ZIndex = 3
titleLabel.Parent = frame

local titleGradient = Instance.new("UIGradient")
titleGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 100, 200)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
})
titleGradient.Rotation = 0
titleGradient.Parent = titleLabel

local checkmark = Instance.new("TextLabel")
checkmark.Size = UDim2.new(0, 16, 0, 16)
checkmark.Position = UDim2.new(0, 60, 0, 36)
checkmark.BackgroundTransparency = 1
checkmark.Text = "✔"
checkmark.TextColor3 = Color3.fromRGB(220, 40, 140)
checkmark.Font = Enum.Font.Gotham
checkmark.TextSize = 11
checkmark.TextXAlignment = Enum.TextXAlignment.Left
checkmark.ZIndex = 3
checkmark.Parent = frame

local injectedLabel = Instance.new("TextLabel")
injectedLabel.Size = UDim2.new(1, -96, 0, 16)
injectedLabel.Position = UDim2.new(0, 76, 0, 36)
injectedLabel.BackgroundTransparency = 1
injectedLabel.Text = "Injected successfully"
injectedLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
injectedLabel.Font = Enum.Font.Gotham
injectedLabel.TextSize = 11
injectedLabel.TextXAlignment = Enum.TextXAlignment.Left
injectedLabel.ZIndex = 3
injectedLabel.Parent = frame

local checkmark2 = Instance.new("TextLabel")
checkmark2.Size = UDim2.new(0, 16, 0, 16)
checkmark2.Position = UDim2.new(0, 60, 0, 54)
checkmark2.BackgroundTransparency = 1
checkmark2.Text = "◆"
checkmark2.TextColor3 = Color3.fromRGB(220, 40, 140)
checkmark2.Font = Enum.Font.Gotham
checkmark2.TextSize = 11
checkmark2.TextXAlignment = Enum.TextXAlignment.Left
checkmark2.ZIndex = 3
checkmark2.Parent = frame

local creditLabel = Instance.new("TextLabel")
creditLabel.Size = UDim2.new(1, -96, 0, 16)
creditLabel.Position = UDim2.new(0, 76, 0, 54)
creditLabel.BackgroundTransparency = 1
creditLabel.Text = "Made by @glyphaj on discord"
creditLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
creditLabel.Font = Enum.Font.Gotham
creditLabel.TextSize = 11
creditLabel.TextXAlignment = Enum.TextXAlignment.Left
creditLabel.ZIndex = 3
creditLabel.Parent = frame

local progressBg = Instance.new("Frame")
progressBg.Size = UDim2.new(1, 0, 0, 3)
progressBg.Position = UDim2.new(0, 0, 1, -3)
progressBg.BackgroundColor3 = Color3.fromRGB(30, 10, 20)
progressBg.BorderSizePixel = 0
progressBg.ZIndex = 3
progressBg.Parent = frame

local progressBgCorner = Instance.new("UICorner")
progressBgCorner.CornerRadius = UDim.new(0, 12)
progressBgCorner.Parent = progressBg

local progressFill = Instance.new("Frame")
progressFill.Size = UDim2.new(1, 0, 1, 0)
progressFill.BackgroundColor3 = Color3.fromRGB(255, 60, 160)
progressFill.BorderSizePixel = 0
progressFill.ZIndex = 4
progressFill.Parent = progressBg

local progressFillCorner = Instance.new("UICorner")
progressFillCorner.CornerRadius = UDim.new(0, 12)
progressFillCorner.Parent = progressFill

local progressGradient = Instance.new("UIGradient")
progressGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 100, 200)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(180, 0, 100))
})
progressGradient.Rotation = 0
progressGradient.Parent = progressFill

local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://9125402735"
sound.Volume = 0.5
sound.Parent = screenGui
sound:Play()

TweenService:Create(frame,
	TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
	{ Position = UDim2.new(1, -314, 1, -110) }
):Play()

task.wait(0.3)
TweenService:Create(progressFill,
	TweenInfo.new(3, Enum.EasingStyle.Linear),
	{ Size = UDim2.new(0, 0, 1, 0) }
):Play()

task.wait(3)

local slideOut = TweenService:Create(frame,
	TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.In),
	{ Position = UDim2.new(1, 20, 1, -110) }
)
slideOut:Play()
slideOut.Completed:Connect(function()
	for _, p in ipairs(particles) do
		p:Destroy()
	end
	screenGui:Destroy()
end)
