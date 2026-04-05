local T=game:GetService("TweenService")
local P=game:GetService("Players")
local S=game:GetService("SoundService")
local G=P.LocalPlayer:WaitForChild("PlayerGui")

local X=G:FindFirstChild("VoltToastGui")
if X then X:Destroy() end

local g=Instance.new("ScreenGui")
g.Name="VoltToastGui"
g.ResetOnSpawn=false
g.IgnoreGuiInset=true
g.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
g.Parent=G

local h=Instance.new("Frame")
h.AnchorPoint=Vector2.new(1,1)
h.Position=UDim2.new(1,32,1,-24)
h.Size=UDim2.new(0,360,0,84)
h.BackgroundTransparency=1
h.BorderSizePixel=0
h.Parent=g

local c=Instance.new("Frame")
c.Size=UDim2.new(1,0,1,0)
c.BackgroundColor3=Color3.fromRGB(7,9,15)
c.BackgroundTransparency=1
c.BorderSizePixel=0
c.Parent=h

Instance.new("UICorner",c).CornerRadius=UDim.new(0,18)

local cs=Instance.new("UIStroke",c)
cs.Color=Color3.fromRGB(35,40,70)
cs.Thickness=1
cs.Transparency=1

local l=Instance.new("Frame")
l.Size=UDim2.new(1,0,0,1)
l.BackgroundColor3=Color3.fromRGB(40,52,110)
l.BackgroundTransparency=1
l.BorderSizePixel=0
l.Parent=c

local i=Instance.new("Frame")
i.Size=UDim2.new(0,54,0,54)
i.Position=UDim2.new(0,14,0.5,0)
i.AnchorPoint=Vector2.new(0,0.5)
i.BackgroundColor3=Color3.fromRGB(18,22,44)
i.BackgroundTransparency=1
i.BorderSizePixel=0
i.Parent=c

Instance.new("UICorner",i).CornerRadius=UDim.new(1,0)

local is=Instance.new("UIStroke",i)
is.Color=Color3.fromRGB(42,50,92)
is.Thickness=1
is.Transparency=1

local img=Instance.new("ImageLabel")
img.BackgroundTransparency=1
img.Size=UDim2.new(0,36,0,36)
img.Position=UDim2.new(0.5,0,0.5,0)
img.AnchorPoint=Vector2.new(0.5,0.5)
img.Image="rbxassetid://70546369337154"
img.ImageTransparency=1
img.Parent=i

local t1=Instance.new("TextLabel")
t1.BackgroundTransparency=1
t1.Position=UDim2.new(0,78,0,15)
t1.Size=UDim2.new(1,-110,0,24)
t1.Font=Enum.Font.GothamBold
t1.Text="Volt"
t1.TextColor3=Color3.fromRGB(255,255,255)
t1.TextSize=16
t1.TextXAlignment=Enum.TextXAlignment.Left
t1.TextTransparency=1
t1.Parent=c

local t2=Instance.new("TextLabel")
t2.BackgroundTransparency=1
t2.Position=UDim2.new(0,78,0,39)
t2.Size=UDim2.new(1,-110,0,20)
t2.Font=Enum.Font.GothamMedium
t2.Text="Volt successfully loaded"
t2.TextColor3=Color3.fromRGB(188,193,210)
t2.TextSize=13
t2.TextXAlignment=Enum.TextXAlignment.Left
t2.TextTransparency=1
t2.Parent=c

local s=Instance.new("Sound")
s.SoundId="rbxassetid://121045990444676"
s.Volume=0.45
s.Parent=S

local function tw(o,t,p)
	local x=T:Create(o,t,p)
	x:Play()
end

local fi=TweenInfo.new(0.28,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
local mi=TweenInfo.new(0.42,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)
local fo=TweenInfo.new(0.22,Enum.EasingStyle.Quad,Enum.EasingDirection.In)
local mo=TweenInfo.new(0.34,Enum.EasingStyle.Quint,Enum.EasingDirection.In)

s:Play()

tw(h,mi,{Position=UDim2.new(1,-20,1,-24)})
tw(c,fi,{BackgroundTransparency=0})
tw(cs,fi,{Transparency=0.25})
tw(l,fi,{BackgroundTransparency=0.7})
tw(i,fi,{BackgroundTransparency=0})
tw(is,fi,{Transparency=0.35})
tw(img,fi,{ImageTransparency=0})
tw(t1,fi,{TextTransparency=0})
tw(t2,fi,{TextTransparency=0})

task.wait(4)

tw(h,mo,{Position=UDim2.new(1,32,1,-24)})
tw(c,fo,{BackgroundTransparency=1})
tw(cs,fo,{Transparency=1})
tw(l,fo,{BackgroundTransparency=1})
tw(i,fo,{BackgroundTransparency=1})
tw(is,fo,{Transparency=1})
tw(img,fo,{ImageTransparency=1})
tw(t1,fo,{TextTransparency=1})
tw(t2,fo,{TextTransparency=1})

task.wait(0.4)
g:Destroy()
s:Destroy()
