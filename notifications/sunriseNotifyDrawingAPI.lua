local DURATION = 3
local SLIDE_TIME = 0.5
local W, H = 300, 80
local START_X = workspace.CurrentCamera.ViewportSize.X + 20
local TARGET_X = workspace.CurrentCamera.ViewportSize.X - 314
local Y = workspace.CurrentCamera.ViewportSize.Y - 100

local drawings = {}

local function make(class, props)
    local obj = Drawing.new(class)
    for k, v in pairs(props) do obj[k] = v end
    table.insert(drawings, obj)
    return obj
end

local bg = make("Square", {
    Size = Vector2.new(W, H),
    Position = Vector2.new(START_X, Y),
    Color = Color3.fromRGB(22, 22, 22),
    Filled = true,
    Thickness = 1,
    Visible = true,
    ZIndex = 1,
})

local title = make("Text", {
    Text = "Sunrise.cc",
    Size = 15,
    Position = Vector2.new(START_X + 14, Y + 18),
    Color = Color3.fromRGB(255, 255, 255),
    Outline = false,
    Visible = true,
    ZIndex = 2,
})

local subtitle = make("Text", {
    Text = "Injected successfully",
    Size = 12,
    Position = Vector2.new(START_X + 14, Y + 38),
    Color = Color3.fromRGB(150, 150, 150),
    Outline = false,
    Visible = true,
    ZIndex = 2,
})

local progBg = make("Square", {
    Size = Vector2.new(W, 5),
    Position = Vector2.new(START_X, Y + H - 5),
    Color = Color3.fromRGB(40, 40, 40),
    Filled = true,
    Thickness = 1,
    Visible = true,
    ZIndex = 4,
})

local progFill = make("Square", {
    Size = Vector2.new(W, 5),
    Position = Vector2.new(START_X, Y + H - 5),
    Color = Color3.fromRGB(255, 160, 30),
    Filled = true,
    Thickness = 1,
    Visible = true,
    ZIndex = 5,
})

local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://6026984224"
sound.Volume = 0.4
sound.Parent = workspace
sound:Play()
game:GetService("Debris"):AddItem(sound, 5)

local function setX(x)
    bg.Position       = Vector2.new(x,      Y)
    title.Position    = Vector2.new(x + 14, Y + 18)
    subtitle.Position = Vector2.new(x + 14, Y + 38)
    progBg.Position   = Vector2.new(x,      Y + H - 5)
    progFill.Position = Vector2.new(x,      Y + H - 5)
end

local slideInStart = tick()
task.spawn(function()
    while true do
        local t = math.min((tick() - slideInStart) / SLIDE_TIME, 1)
        local e = 1 - (1 - t)^5
        local x = START_X + (TARGET_X - START_X) * e
        setX(x)
        if t >= 1 then break end
        task.wait()
    end
end)

task.wait(SLIDE_TIME + 0.3)

local progStart = tick()
task.spawn(function()
    while true do
        local t = math.min((tick() - progStart) / DURATION, 1)
        local fillW = math.max(W * (1 - t), 0)
        progFill.Color = Color3.fromRGB(255, math.floor(160 + 60 * t), math.floor(30 + 20 * t))
        progFill.Size = Vector2.new(fillW, 5)
        if t >= 1 then break end
        task.wait()
    end
end)

task.wait(DURATION)

local slideOutStart = tick()
while true do
    local t = math.min((tick() - slideOutStart) / 0.4, 1)
    local e = t^5
    local x = TARGET_X + (START_X + 20 - TARGET_X) * e
    setX(x)
    if t >= 1 then break end
    task.wait()
end

for _, d in ipairs(drawings) do
    d:Remove()
end
