local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local Loader = Instance.new("ScreenGui")
local BG = Instance.new("Frame")
local Inject = Instance.new("TextButton")
local Glow_Around = Instance.new("ImageLabel")
local Holder = Instance.new("Frame")
local TOP = Instance.new("Frame")
local Name = Instance.new("TextLabel")
local Icon = Instance.new("ImageLabel")

Loader.Name = "Loader"
Loader.ResetOnSpawn = false
Loader.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Loader.Parent = PlayerGui

BG.Name = "BG"
BG.Parent = Loader
BG.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
BG.BorderColor3 = Color3.fromRGB(49, 49, 49)
BG.Size = UDim2.new(0, 326, 0, 305)
BG.AnchorPoint = Vector2.new(0.5, 0.5)
BG.Position = UDim2.new(0.5, 0, 0.5, 0)
BG.Active = true
BG.Draggable = true

Glow_Around.Name = "Glow_Around"
Glow_Around.Parent = BG
Glow_Around.BackgroundTransparency = 1
Glow_Around.BorderSizePixel = 0
Glow_Around.Position = UDim2.new(-0.06, 0, -0.06, 0)
Glow_Around.Size = UDim2.new(0, 365, 0, 341)
Glow_Around.ZIndex = 0
Glow_Around.Image = "http://www.roblox.com/asset/?id=4996891970"
Glow_Around.ImageColor3 = Color3.fromRGB(255, 0, 255)

TOP.Name = "TOP"
TOP.Parent = BG
TOP.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
TOP.BorderColor3 = Color3.fromRGB(49, 49, 49)
TOP.Size = UDim2.new(1, 0, 0, 28)

Name.Name = "Name"
Name.Parent = TOP
Name.BackgroundTransparency = 1
Name.Size = UDim2.new(1, 0, 1, 0)
Name.Font = Enum.Font.SourceSansSemibold
Name.Text = "Visuals.Wtf"
Name.TextColor3 = Color3.fromRGB(176, 176, 176)
Name.TextSize = 15

Icon.Name = "Icon"
Icon.Parent = TOP
Icon.BackgroundTransparency = 1
Icon.Position = UDim2.new(0, 0, 0, 0)
Icon.Size = UDim2.new(0, 28, 0, 28)
Icon.Image = "rbxassetid://130560846755502"

Holder.Name = "Holder"
Holder.Parent = BG
Holder.BackgroundTransparency = 1
Holder.Position = UDim2.new(0.018, 0, 0.111, 0)
Holder.Size = UDim2.new(0, 313, 0, 197)

Inject.Name = "Inject"
Inject.Parent = BG
Inject.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
Inject.BorderColor3 = Color3.new(0, 0, 0)
Inject.Position = UDim2.new(0.273, 0, 0.777, 0)
Inject.Size = UDim2.new(0, 147, 0, 50)
Inject.Font = Enum.Font.SourceSansSemibold
Inject.Text = "Inject  .  .  ."
Inject.TextColor3 = Color3.fromRGB(176, 176, 176)
Inject.TextSize = 15
--
local function animateInject()
	local frames = {"Inject .", "Inject ..", "Inject ..."}
	for i = 1, #frames do
		Inject.Text = frames[i]
		task.wait(0.25)
	end
end
--
Inject.MouseButton1Click:Connect(function()
	Inject.Text = "Injecting..."
	animateInject()
	
	local delayTime = math.random(1, 3)
	Inject.Text = "Loading..."
	task.wait(delayTime)
	
	local success, err = pcall(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/DHRFV2/junk/refs/heads/main/test.lua", true))()
	end)
	
	if success then
		Inject.Text = "Loaded ✓"
		task.wait(0.5)
		Loader:Destroy()
	else
		Inject.Text = "Failed ⚠"
		warn("Failed To Inject Visuals.Wtf Script:", err)
		task.wait(2)
		Inject.Text = "Inject  .  .  ."
	end
end)
