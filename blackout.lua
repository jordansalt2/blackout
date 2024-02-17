getgenv().BlackOut = {
	Enabled = true,

	KillAura = {
		Distance = 4.13,
		Visualizer = false,
		Damage = false,
		LungeWhenNear = {
		    Enabled = false,
		    Distance = 17
		},
        LungeOnly = false
	},
	Extra = {
		AC = true,
		Notifications = true,
		HideOnExecute = true,
		Hitbox = {
		    Enabled = false,
		    Colour = Color3.fromRGB(0, 0, 0),
		    SurfaceColour = Color3.fromRGB(0, 0, 0)
		}
	},
	Keybinds = {
		HideGUI = "X",
		AC = "U",
		ToggleScript = "Z",
		Increase = "J",
		Decrease = "K",
		LungeWhenNearIncrease = "Q",
		LungeWhenNearDecrease = "E",
		ToggleVisualizer = "V",
		ToggleDamage = "G",
		ToggleNotifications = "N",
		Check = "C",
		LungeWhenNear = "L",
		Hitbox = "R",
		KillScript = "Y",
        LungeOnly = "O"
	}
}

-- // Services
local StarterGui = game:GetService("StarterGui")
local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")

-- // Variables
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Chatbar = LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
local Enabled = getgenv().BlackOut.Enabled
local Distance = getgenv().BlackOut.KillAura.Distance
local Damage = getgenv().BlackOut.KillAura.Damage
local Visualizer = getgenv().BlackOut.KillAura.Visualizer
local AC = getgenv().BlackOut.Extra.AC
local Typing = false
local Notifications = getgenv().BlackOut.Extra.Notifications
local LungeWhenNear = getgenv().BlackOut.KillAura.LungeWhenNear
local Hitbox = getgenv().BlackOut.Extra.Hitbox
local HideOnExecute = getgenv().BlackOut.Extra.HideOnExecute
local LungeOnly = getgenv().BlackOut.KillAura.LungeOnly
local KillScript = false

local tabbedOff = false

UIS.WindowFocused:connect(function()
    tabbedOff = false
end)

UIS.WindowFocusReleased:connect(function()
    tabbedOff = true
end)

-- // Functions
local ProcessConnections = function(Connection, State)
	for i, v in ipairs(getconnections(Connection)) do
		if State == "Disable" then
			v:Disable()
		elseif State == "Enable" then
			v:Enable()
		end
	end
end

local RandomString = function()
	local Length = math.random(10,20)
	local Array = {}
	for i = 1, Length do
		Array[i] = string.char(math.random(32, 126))
	end
	return table.concat(Array)
end

local Notification = function(Message)
	if not Notifications and not Message:find("Notifications =") then return end
	StarterGui:SetCore("SendNotification", {
		Title = "BlackOut",
		Text = Message,
		Duration = 3
	})
end

local Filter = function(String)
    return String:split("\"")[1]
end

local FTI1 = function(LArm, Handle)
    firetouchinterest(LArm, Handle, 0)
    firetouchinterest(LArm, Handle, 1)
	firetouchinterest(LArm, Handle, 0)
end

local FTI2 = function(LArm, RArm, Handle)
    firetouchinterest(LArm, Handle, 0)
    firetouchinterest(LArm, Handle, 1)
	firetouchinterest(LArm, Handle, 0)

    firetouchinterest(RArm, Handle, 0)
    firetouchinterest(RArm, Handle, 1)
	firetouchinterest(RArm, Handle, 0)
end

local FTI3 = function(LArm, RArm, Torso, Handle)
    firetouchinterest(LArm, Handle, 0)
    firetouchinterest(LArm, Handle, 1)
	firetouchinterest(LArm, Handle, 0)

    firetouchinterest(RArm, Handle, 0)
    firetouchinterest(RArm, Handle, 1)
	firetouchinterest(RArm, Handle, 0)

    firetouchinterest(Torso, Handle, 0)
    firetouchinterest(Torso, Handle, 1)
	firetouchinterest(Torso, Handle, 0)
end

local FTI4 = function(LArm, RArm, Torso, Head, Handle)
    firetouchinterest(LArm, Handle, 0)
    firetouchinterest(LArm, Handle, 1)
	firetouchinterest(LArm, Handle, 0)

    firetouchinterest(RArm, Handle, 0)
    firetouchinterest(RArm, Handle, 1)
	firetouchinterest(RArm, Handle, 0)

    firetouchinterest(Torso, Handle, 0)
    firetouchinterest(Torso, Handle, 1)
	firetouchinterest(Torso, Handle, 0)

    firetouchinterest(Head, Handle, 0)
    firetouchinterest(Head, Handle, 1)
	firetouchinterest(Head, Handle, 0)
end

local FTI5 = function(LArm, RArm, Torso, Head, LLeg, Handle)
    firetouchinterest(LArm, Handle, 0)
    firetouchinterest(LArm, Handle, 1)
	firetouchinterest(LArm, Handle, 0)

    firetouchinterest(RArm, Handle, 0)
    firetouchinterest(RArm, Handle, 1)
	firetouchinterest(RArm, Handle, 0)

    firetouchinterest(Torso, Handle, 0)
    firetouchinterest(Torso, Handle, 1)
	firetouchinterest(Torso, Handle, 0)

    firetouchinterest(Head, Handle, 0)
    firetouchinterest(Head, Handle, 1)
	firetouchinterest(Head, Handle, 0)

    firetouchinterest(LLeg, Handle, 0)
    firetouchinterest(LLeg, Handle, 1)
	firetouchinterest(LLeg, Handle, 0)
end

local FTI6 = function(LArm, RArm, Torso, Head, LLeg, RLeg, Handle)
    firetouchinterest(LArm, Handle, 0)
    firetouchinterest(LArm, Handle, 1)
	firetouchinterest(LArm, Handle, 0)

    firetouchinterest(RArm, Handle, 0)
    firetouchinterest(RArm, Handle, 1)
	firetouchinterest(RArm, Handle, 0)

    firetouchinterest(Torso, Handle, 0)
    firetouchinterest(Torso, Handle, 1)
	firetouchinterest(Torso, Handle, 0)

    firetouchinterest(Head, Handle, 0)
    firetouchinterest(Head, Handle, 1)
	firetouchinterest(Head, Handle, 0)

    firetouchinterest(LLeg, Handle, 0)
    firetouchinterest(LLeg, Handle, 1)
	firetouchinterest(LLeg, Handle, 0)

    firetouchinterest(RLeg, Handle, 0)
    firetouchinterest(RLeg, Handle, 1)
	firetouchinterest(RLeg, Handle, 0)
end

local FTI7 = function(LArm, RArm, Torso, Head, LLeg, RLeg, Handle)
    firetouchinterest(LArm, Handle, 0)
    firetouchinterest(LArm, Handle, 1)
	firetouchinterest(LArm, Handle, 0)

    firetouchinterest(RArm, Handle, 0)
    firetouchinterest(RArm, Handle, 1)
	firetouchinterest(RArm, Handle, 0)

    firetouchinterest(Torso, Handle, 0)
    firetouchinterest(Torso, Handle, 1)
	firetouchinterest(Torso, Handle, 0)

    firetouchinterest(Head, Handle, 0)
    firetouchinterest(Head, Handle, 1)
	firetouchinterest(Head, Handle, 0)

    firetouchinterest(LLeg, Handle, 0)
    firetouchinterest(LLeg, Handle, 1)
	firetouchinterest(LLeg, Handle, 0)

    firetouchinterest(RLeg, Handle, 0)
    firetouchinterest(RLeg, Handle, 1)
	firetouchinterest(RLeg, Handle, 0)
end

local Tick = tick()
local FTI = function(Hit, Handle)
    local Hum = Hit.Parent:FindFirstChildOfClass("Humanoid")
    if Hum and Hit.Parent and Hit.Parent.Name ~= LocalPlayer.Name and Hum.Health ~= 0 then
		if Damage then
			local Torso = Hit.Parent:FindFirstChild("Torso")
			local LLeg = Hit.Parent:FindFirstChild("Left Leg")
			local RLeg = Hit.Parent:FindFirstChild("Right Leg")
			local LArm = Hit.Parent:FindFirstChild("Left Arm")
			local RArm = Hit.Parent:FindFirstChild("Right Arm")
			local Head = Hit.Parent:FindFirstChild("Head")

			if LocalPlayer:DistanceFromCharacter(Torso.Position) >= (Distance + 3.5) then
				return
			end
			if LocalPlayer:DistanceFromCharacter(LLeg.Position) >= (Distance + 3.5) then
				return
			end
			if LocalPlayer:DistanceFromCharacter(RLeg.Position) >= (Distance + 3.5) then
				return
			end
			if LocalPlayer:DistanceFromCharacter(LArm.Position) >= (Distance + 3.5) then
				return
			end
			if LocalPlayer:DistanceFromCharacter(RArm.Position) >= (Distance + 3.5) then
				return
			end
			if LocalPlayer:DistanceFromCharacter(Head.Position) >= (Distance + 3.5) then
				return
			end

            local Tool = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")
			if LungeOnly then
                if Tool.GripUp.Z == 0 then
                    if Hum.Health < 5 then
                        if math.abs(tick() - Tick) < 0.1 then return end
                        Tick = tick()
                        FTI1(LArm, Handle)
                    elseif Hum.Health < 10 and Hum.Health > 5 then
                        if math.abs(tick() - Tick) < 0.1 then return end
                        Tick = tick()
                        FTI2(LArm, RArm, Handle)
                    elseif Hum.Health < 15 and Hum.Health > 10 then
                        if math.abs(tick() - Tick) < 0.1 then return end
                        Tick = tick()
                        FTI3(LArm, RArm, Torso, Handle)
                    elseif Hum.Health < 20 and Hum.Health > 15 then
                        if math.abs(tick() - Tick) < 0.1 then return end
                        Tick = tick()
                        FTI4(LArm, RArm, Torso, Head, Handle)
                    elseif Hum.Health < 25 and Hum.Health > 20 then
                        if math.abs(tick() - Tick) < 0.1 then return end
                        Tick = tick()
                        FTI5(LArm, RArm, Torso, Head, LLeg, Handle)
                    elseif Hum.Health < 30 and Hum.Health > 25 then
                        if math.abs(tick() - Tick) < 0.1 then return end
                        Tick = tick()
                        FTI6(LArm, RArm, Torso, Head, LLeg, RLeg, Handle)
                    elseif Hum.Health < 35 and Hum.Health > 30 then
                        if math.abs(tick() - Tick) < 0.1 then return end
                        Tick = tick()
                        FTI7(LArm, RArm, Torso, Head, LLeg, RLeg, Handle)
                    elseif Hum.Health > 35 then
                        if math.abs(tick() - Tick) < 0.1 then return end
                        Tick = tick()
                        FTI7(LArm, RArm, Torso, Head, LLeg, RLeg, Handle)
                    end
                end
            else
                if Hum.Health < 5 then
                    if math.abs(tick() - Tick) < 0.1 then return end
                    Tick = tick()
                    FTI1(LArm, Handle)
                elseif Hum.Health < 10 and Hum.Health > 5 then
                    if math.abs(tick() - Tick) < 0.1 then return end
                    Tick = tick()
                    FTI2(LArm, RArm, Handle)
                elseif Hum.Health < 15 and Hum.Health > 10 then
                    if math.abs(tick() - Tick) < 0.1 then return end
                    Tick = tick()
                    FTI3(LArm, RArm, Torso, Handle)
                elseif Hum.Health < 20 and Hum.Health > 15 then
                    if math.abs(tick() - Tick) < 0.1 then return end
                    Tick = tick()
                    FTI4(LArm, RArm, Torso, Head, Handle)
                elseif Hum.Health < 25 and Hum.Health > 20 then
                    if math.abs(tick() - Tick) < 0.1 then return end
                    Tick = tick()
                    FTI5(LArm, RArm, Torso, Head, LLeg, Handle)
                elseif Hum.Health < 30 and Hum.Health > 25 then
                    if math.abs(tick() - Tick) < 0.1 then return end
                    Tick = tick()
                    FTI6(LArm, RArm, Torso, Head, LLeg, RLeg, Handle)
                elseif Hum.Health < 35 and Hum.Health > 30 then
                    if math.abs(tick() - Tick) < 0.1 then return end
                    Tick = tick()
                    FTI7(LArm, RArm, Torso, Head, LLeg, RLeg, Handle)
                elseif Hum.Health > 35 then
                    if math.abs(tick() - Tick) < 0.1 then return end
                    Tick = tick()
                    FTI7(LArm, RArm, Torso, Head, LLeg, RLeg, Handle)
                end
            end
		else
            local Tool = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")
			if LungeOnly then
                if Tool.GripUp.Z == 0 then
                    local LArm = Hit.Parent:FindFirstChild("Left Arm")
                    if math.abs(tick() - Tick) < 0.1 then return end
                    Tick = tick()
                    FTI1(LArm, Handle)
                end
            else
                local LArm = Hit.Parent:FindFirstChild("Left Arm")
                if math.abs(tick() - Tick) < 0.1 then return end
                Tick = tick()
                FTI1(LArm, Handle)
            end
		end
    end
end

-- // Protect GUI
local ScreenGui = Instance.new("ScreenGui")

if HideOnExecute then
	ScreenGui.Enabled = false
end

ScreenGui.Name = RandomString()
local x = identifyexecutor() or "unknown"
if x:lower():find("synapse") then
    syn.protect_gui(ScreenGui)
    ScreenGui.Parent = game:GetService("CoreGui").RobloxGui
elseif x:lower():find("scriptware") then
    ScreenGui.Parent = gethui()
else
    ScreenGui.Parent = game:GetService("CoreGui").RobloxGui
end

-- // Instantiate GUI
local Frame = Instance.new("ImageLabel")
local GradientFrame = Instance.new("ImageLabel")
local Gradient = Instance.new("UIGradient")
local Title = Instance.new("TextLabel")
local DistanceText = Instance.new("TextLabel")
local DamageText = Instance.new("TextLabel")
local ShapeText = Instance.new("TextLabel")
local VisualizerText = Instance.new("TextLabel")
local DistanceTextBox = Instance.new("TextBox")
local DamageButton = Instance.new("TextButton")
local Frame_2 = Instance.new("Frame")
local VisualizerButton = Instance.new("TextButton")
local Frame_3 = Instance.new("Frame")
local Shape = Instance.new("TextButton")
local BlackCorner = Instance.new("UICorner")

Frame.Name = RandomString()
Frame.Parent = ScreenGui
Frame.ZIndex = 1
Frame.AnchorPoint = Vector2.new(0, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BackgroundTransparency = 1.000
Frame.Position = UDim2.new(0, 0, 0.515806973, 0)
Frame.Size = UDim2.new(0, 243, 0, 305)
Frame.Image = "rbxassetid://3570695787"
Frame.ImageColor3 = Color3.fromRGB(0, 0, 0)
Frame.ImageTransparency = 0.400
Frame.ScaleType = Enum.ScaleType.Slice
Frame.SliceCenter = Rect.new(100, 100, 100, 100)
Frame.SliceScale = 0.120

GradientFrame.Name = RandomString()
GradientFrame.Parent = ScreenGui
GradientFrame.ZIndex = 0
GradientFrame.AnchorPoint = Vector2.new(0, 0.5)
GradientFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GradientFrame.BackgroundTransparency = 1.000
GradientFrame.Position = UDim2.new(0, 0, 0.515806973, 0)
GradientFrame.Size = UDim2.new(0, 250, 0, 320)
GradientFrame.Image = "rbxassetid://3570695787"
GradientFrame.ImageColor3 = Color3.fromRGB(255, 255, 255)
GradientFrame.ImageTransparency = 0.400
GradientFrame.ScaleType = Enum.ScaleType.Slice
GradientFrame.SliceCenter = Rect.new(100, 100, 100, 100)
GradientFrame.SliceScale = 0.120

Gradient.Name = RandomString()
Gradient.Parent = GradientFrame
Gradient.Rotation = 40
Gradient.Color = ColorSequence.new(Color3.fromRGB(255, 0, 255), Color3.fromRGB(85, 255, 255))

task.spawn(function()
    local TweenInformation = TweenInfo.new(2, Enum.EasingStyle.Linear,Enum.EasingDirection.In, -1, false)
    local Goal = {Rotation = Gradient.Rotation + 360}
    local Tween = game:GetService("TweenService"):Create(Gradient, TweenInformation, Goal)
    Tween:Play()
end)

Title.Name = RandomString()
Title.Parent = Frame
Title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Title.BackgroundTransparency = 1.000
Title.Size = UDim2.new(0, 249, 0, 70)
Title.Font = Enum.Font.LuckiestGuy
Title.Text = "BlackOut"
Title.TextColor3 = Color3.fromRGB(0, 0, 0)
Title.TextSize = 25.000

DistanceText.Name = RandomString()
DistanceText.Parent = Frame
DistanceText.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
DistanceText.BackgroundTransparency = 1.000
DistanceText.Position = UDim2.new(0, 33, 0, 70)
DistanceText.Size = UDim2.new(0, 99, 0, 35)
DistanceText.Font = Enum.Font.LuckiestGuy
DistanceText.Text = "Distance"
DistanceText.TextColor3 = Color3.fromRGB(0, 0, 0)
DistanceText.TextSize = 20.000

DamageText.Name = RandomString()
DamageText.Parent = Frame
DamageText.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
DamageText.BackgroundTransparency = 1.000
DamageText.Position = UDim2.new(0, 33, 0, 125)
DamageText.Size = UDim2.new(0, 99, 0, 35)
DamageText.Font = Enum.Font.LuckiestGuy
DamageText.Text = "Damage"
DamageText.TextColor3 = Color3.fromRGB(0, 0, 0)
DamageText.TextSize = 20.000

ShapeText.Name = RandomString()
ShapeText.Parent = Frame
ShapeText.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ShapeText.BackgroundTransparency = 1.000
ShapeText.Position = UDim2.new(0, 33, 0, 180)
ShapeText.Size = UDim2.new(0, 99, 0, 35)
ShapeText.Font = Enum.Font.LuckiestGuy
ShapeText.Text = "Shape"
ShapeText.TextColor3 = Color3.fromRGB(0, 0, 0)
ShapeText.TextSize = 20.000

VisualizerText.Name = RandomString()
VisualizerText.Parent = Frame
VisualizerText.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
VisualizerText.BackgroundTransparency = 1.000
VisualizerText.Position = UDim2.new(0, 33, 0, 235)
VisualizerText.Size = UDim2.new(0, 99, 0, 35)
VisualizerText.Font = Enum.Font.LuckiestGuy
VisualizerText.Text = "Visualizer"
VisualizerText.TextColor3 = Color3.fromRGB(0, 0, 0)
VisualizerText.TextSize = 20.000

DistanceTextBox.Name = RandomString()
DistanceTextBox.Parent = Frame
DistanceTextBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
DistanceTextBox.BackgroundTransparency = 1.000
DistanceTextBox.Position = UDim2.new(0, 167, 0, 70)
DistanceTextBox.Size = UDim2.new(0, 49, 0, 35)
DistanceTextBox.Font = Enum.Font.LuckiestGuy
DistanceTextBox.Text = tostring(Distance)
DistanceTextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
DistanceTextBox.TextSize = 20.000

DamageButton.Name = RandomString()
DamageButton.Parent = Frame
DamageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
DamageButton.BackgroundTransparency = 0.400
DamageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
DamageButton.BorderSizePixel = 2
DamageButton.Position = UDim2.new(0, 177, 0, 125)
DamageButton.Size = UDim2.new(0, 29, 0, 30)
DamageButton.Font = Enum.Font.SourceSans
DamageButton.Text = ""
DamageButton.TextColor3 = Color3.fromRGB(0, 0, 0)
DamageButton.TextSize = 14.000

Frame_2.Parent = DamageButton
Frame_2.AnchorPoint = Vector2.new(0.5, 0.5)
Frame_2.BackgroundColor3 = Color3.fromRGB(169, 169, 169)
Frame_2.BorderSizePixel = 0
Frame_2.Position = UDim2.new(0.5, 0, 0.5, 0)

VisualizerButton.Name = RandomString()
VisualizerButton.Parent = Frame
VisualizerButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
VisualizerButton.BackgroundTransparency = 0.400
VisualizerButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
VisualizerButton.BorderSizePixel = 2
VisualizerButton.Position = UDim2.new(0, 177, 0, 235)
VisualizerButton.Size = UDim2.new(0, 30, 0, 30)
VisualizerButton.Font = Enum.Font.SourceSans
VisualizerButton.Text = ""
VisualizerButton.TextColor3 = Color3.fromRGB(0, 0, 0)
VisualizerButton.TextSize = 14.000

Frame_3.Parent = VisualizerButton
Frame_3.AnchorPoint = Vector2.new(0.5, 0.5)
Frame_3.BackgroundColor3 = Color3.fromRGB(169, 169, 169)
Frame_3.BorderSizePixel = 0
Frame_3.Position = UDim2.new(0.5, 0, 0.5, 0)

Shape.Name = RandomString()
Shape.Parent = Frame
Shape.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Shape.BackgroundTransparency = 1.000
Shape.Position = UDim2.new(0, 155, 0, 180)
Shape.Size = UDim2.new(0, 74, 0, 35)
Shape.Font = Enum.Font.LuckiestGuy
Shape.Text = "Circle"
Shape.TextColor3 = Color3.fromRGB(0, 0, 0)
Shape.TextSize = 17.000


BlackCorner.CornerRadius = UDim.new(0, 15)
BlackCorner.Name = RandomString()
BlackCorner.Parent = Frost

-- // Instantiate Visualizer + Protect Visualizer
ProcessConnections(game.DescendantAdded, "Disable")
ProcessConnections(workspace.CurrentCamera.ChildAdded, "Disable")
ProcessConnections(workspace.CurrentCamera.DescendantAdded, "Disable")

local SelectionBox = Instance.new("SelectionBox")
if syn then
    syn.protect_gui(SelectionBox)
end
SelectionBox.Parent = game:GetService("CoreGui").RobloxGui

local VisualizerPart = Instance.new("Part")
if syn then
	syn.protect_gui(VisualizerPart)
end
VisualizerPart.Name = RandomString()
VisualizerPart.Color = Color3.fromRGB(0, 0, 0)
VisualizerPart.Transparency = 0
VisualizerPart.Anchored = false
VisualizerPart.CanCollide = false
VisualizerPart.CanTouch = false
VisualizerPart.CanQuery = false
VisualizerPart.Massless = true
VisualizerPart.Size = Vector3.new(0.5, 0.5, 0.5)
VisualizerPart.Material = Enum.Material.ForceField
VisualizerPart.CastShadow = false

local WeldConstraint = Instance.new("WeldConstraint")
WeldConstraint.Name = RandomString()
WeldConstraint.Part0 = VisualizerPart
WeldConstraint.Parent = VisualizerPart

ProcessConnections(game.DescendantAdded, "Enable")
ProcessConnections(workspace.CurrentCamera.ChildAdded, "Enable")
ProcessConnections(workspace.CurrentCamera.DescendantAdded, "Enable")

local Old1; Old1 = hookfunc(game.FindFirstChildWhichIsA, function(...)
	local Args = {...}
	if not checkcaller() and not KillScript then
		if typeof(Args[1]) == "Instance" then
			if Args[1] == VisualizerPart or Args[1] == WeldConstraint then
				return nil
			end
		end
	end
	return Old1(...)
end)

local Old2; Old2 = hookfunc(game.FindFirstChildOfClass, function(...)
	local Args = {...}
	if not checkcaller() and not KillScript then
		if typeof(Args[1]) == "Instance" then
			if Args[1] == VisualizerPart or Args[1] == WeldConstraint then
				return nil
			end
		end
	end
	return Old2(...)
end)

local Old3; Old3 = hookfunc(game.GetDescendants, function(...)
	local Descendants = game:GetDescendants()
	if not checkcaller() and not KillScript then
		if table.find(Descendants, VisualizerPart) then
			table.remove(Descendants, table.find(Descendants, VisualizerPart))
		end
	end
	return Descendants
end)

local UBL = false
function AvoidCrasher(Fenv, F)
    for i, v in pairs(Fenv) do
        if i == "script" and typeof(v) == "Instance" and v.ClassName == F.ClassName and F == v then
            return true
        end
    end
    return false
end
function LoopThroughTable(Tab, F, LookThrough)
    for i, v in pairs(LookThrough) do
        if typeof(v) == "function" and islclosure(v) and getfenv(v) and AvoidCrasher(getfenv(v), F) then
            table.insert(Tab, v)
        end
    end
end
function GetFunctionsFromScript(F)
    local functionstab = {}
    LoopThroughTable(functionstab, F, getgc())
    LoopThroughTable(functionstab, F, debug.getregistry())
    return functionstab
end

for i,v in pairs(getnilinstances()) do
    if v:IsA("ModuleScript") then
        if v.Name ~= "Encrypt" then
            Fs = GetFunctionsFromScript(v)
        else
            UBL = true
        end
    end
end

if UBL then
    local GBT = Fs
    for i,v in pairs(GBT) do
        if table.find(debug.getconstants(v), ">50 touch triggers ") then
            debug.setconstant(v, table.find(debug.getconstants(v), ">50 touch triggers "), "Value")
        end
    end
end

-- // GUI Functions
DamageButton.MouseButton1Click:Connect(function()
	Damage = not Damage
	if DamageButton.Frame then
		if Damage then
			DamageButton.Frame:TweenSize(UDim2.new(0, 30, 0, 30), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.1, true)
		else
			DamageButton.Frame:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.1, true)
		end
	end
end)

VisualizerButton.MouseButton1Click:Connect(function()
	Visualizer = not Visualizer
	if VisualizerButton.Frame then
		if Visualizer then
			VisualizerButton.Frame:TweenSize(UDim2.new(0, 30, 0, 30), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.1, true)
		else
			VisualizerButton.Frame:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.1, true)
		end
	end
end)

local Index = 1
Shape.MouseButton1Click:Connect(function()
	if Index ~= 3 then
		Index = Index + 1
	else
		Index = 1
	end

	if Index == 1 then
		Shape.Text = "Circle"
	elseif Index == 2 then
		Shape.Text = "Box"
	elseif Index == 3 then
		Shape.Text = "Cylinder"
	end
end)

Chatbar.Focused:Connect(function()
    Typing = true
end)

Chatbar.FocusLost:Connect(function()
    Typing = false
end)

DistanceTextBox.FocusLost:Connect(function()
	if tonumber(DistanceTextBox.Text) then
		Distance = tonumber(DistanceTextBox.Text)
	end
end)

-- // Keybinds
local Con1; Con1 = Mouse.KeyDown:Connect(function(Key)
    if Key == getgenv().BlackOut.Keybinds.ToggleNotifications:lower() then
        Notifications = not Notifications
		Notification("Notifications = " .. tostring(Notifications))
    elseif Key == getgenv().BlackOut.Keybinds.AC:lower() then
        AC = not AC
        Notification("AC = " .. tostring(AC))
    elseif Key == getgenv().BlackOut.Keybinds.HideGUI:lower() then
        ScreenGui.Enabled = not ScreenGui.Enabled
		Notification("GUI = " .. tostring(ScreenGui.Enabled))
    elseif Key == getgenv().BlackOut.Keybinds.Increase:lower() then
		Distance = Distance + 0.5
		DistanceTextBox.Text = tostring(Distance)
		Notification("Distance = " .. tostring(Distance))
	elseif Key == getgenv().BlackOut.Keybinds.Decrease:lower() then
		Distance = Distance - 0.5
		DistanceTextBox.Text = tostring(Distance)
		Notification("Distance = " .. tostring(Distance))
	elseif Key == getgenv().BlackOut.Keybinds.LungeWhenNearIncrease:lower() then
	    LungeWhenNear.Distance = LungeWhenNear.Distance + 0.5
		Notification("Lunge When Near Distance = " .. tostring(LungeWhenNear.Distance))
    elseif Key == getgenv().BlackOut.Keybinds.LungeWhenNearDecrease:lower() then
	    LungeWhenNear.Distance = LungeWhenNear.Distance - 0.5
		Notification("Lunge When Near Distance = " .. tostring(LungeWhenNear.Distance))
	elseif Key == getgenv().BlackOut.Keybinds.ToggleVisualizer:lower() then
		Visualizer = not Visualizer
		if VisualizerButton.Frame then
			if Visualizer then
				VisualizerButton.Frame:TweenSize(UDim2.new(0, 30, 0, 30), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.1, true)
			else
				VisualizerButton.Frame:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.1, true)
			end
		end
		Notification("Visualizer = " .. tostring(Visualizer))
	elseif Key == getgenv().BlackOut.Keybinds.ToggleDamage:lower() then
		Damage = not Damage
		if DamageButton.Frame then
			if Damage then
				DamageButton.Frame:TweenSize(UDim2.new(0, 30, 0, 30), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.1, true)
			else
				DamageButton.Frame:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.1, true)
			end
		end
		Notification("Damage = " .. tostring(Damage))
	elseif Key == getgenv().BlackOut.Keybinds.ToggleScript:lower() then
		Enabled = not Enabled
		Notification("Enabled = " .. tostring(Enabled))
	elseif Key == getgenv().BlackOut.Keybinds.Check:lower() then
		Notification("Lunge When Near = " .. tostring(LungeWhenNear.Enabled) .. " | Lunge When Near = " .. tostring(LungeWhenNear.Distance) .. " | AC = " .. tostring(AC))
	elseif Key == getgenv().BlackOut.Keybinds.LungeWhenNear:lower() then
		LungeWhenNear.Enabled = not LungeWhenNear.Enabled
		Notification("Lunge When Near = " .. tostring(LungeWhenNear.Enabled))
	elseif Key == getgenv().BlackOut.Keybinds.Hitbox:lower() then
	    Hitbox.Enabled = not Hitbox.Enabled
	    Notification("Hitbox = " .. tostring(Hitbox.Enabled))
	elseif Key == getgenv().BlackOut.Keybinds.KillScript:lower() then
		KillScript = true
        if SelectionBox then SelectionBox:Destroy() end
        if VisualizerPart then VisualizerPart:Destroy() end
        if WeldConstraint then WeldConstraint:Destroy() end
		Notification("Script Killed")
    elseif Key == getgenv().BlackOut.Keybinds.LungeOnly:lower() then
        LungeOnly = not LungeOnly
        Notification("Lunge Only = " .. tostring(LungeOnly))
    end
end)

-- // Spoofing
local GTP; GTP = hookfunction(Instance.new("Part").GetTouchingParts, newcclosure(function(Part)
    if not checkcaller() and not KillScript then
		if tostring(Part) == "Handle" then
			return {}
		end
	end
    return GTP(Part)
end))

local GPIP; GPIP = hookfunction(workspace.GetPartsInPart, newcclosure(function(_, Part)
    if not checkcaller() and not KillScript then
        if tostring(Part) == "Handle" then
			return {}
		end
    end
    return GPIP(_, Part)
end))

-- // Damaging

local Con2; Con2 = game:GetService("RunService").RenderStepped:Connect(function()
	if KillScript then
		getgenv().BlackOut = nil
		ScreenGui:Destroy()
		Con1:Disconnect()
		Con2:Disconnect()
		return
	end

    if not Enabled then 
        return 
    end

    local Tool = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")
    if not Tool and VisualizerPart.Parent ~= nil then 
        VisualizerPart.Parent = nil
    end

    if Tool then
        if AC and not Typing and not tabbedOff and LocalPlayer.Character.Humanoid.Health > 0 then
            Tool:Activate()
			Mouse.Icon = "rbxasset://textures\\GunWaitCursor.png"
            task.delay(1, function()
                Mouse.Icon = "rbxasset://textures\\GunCursor.png"
            end)
        end

        local Handle = Tool:FindFirstChild("Handle") or Tool:FindFirstChildOfClass("Part")
        if Handle then
            if VisualizerPart.CFrame ~= Handle.CFrame then
                VisualizerPart.CFrame = Handle.CFrame
            end

            if WeldConstraint.Part1 ~= Handle then
                WeldConstraint.Part1 = Handle
            end
            
            if Hitbox.Enabled then
                if Handle.Parent.Parent:IsA("Model") then
                    SelectionBox.Visible = true
                    SelectionBox.Color3 = Hitbox.Colour
                    SelectionBox.LineThickness = 0.02
                    SelectionBox.SurfaceTransparency = 0.5
                    SelectionBox.SurfaceColor3 = Hitbox.SurfaceColour
                    SelectionBox.Adornee = Handle
                else
                    SelectionBox.Visible = false
                end
            else
                SelectionBox.Visible = false
            end

            if Shape.Text == "Circle" then
                VisualizerPart.Shape = Enum.PartType.Ball
            elseif Shape.Text == "Box" then
                VisualizerPart.Shape = Enum.PartType.Block
            elseif Shape.Text == "Cylinder" then
                VisualizerPart.Shape = Enum.PartType.Cylinder
            end

            if Visualizer then
				if syn then
					syn.protect_gui(workspace.CurrentCamera)
				end
                VisualizerPart.Parent = workspace.CurrentCamera
            else
				VisualizerPart.Parent = nil
            end

            if Distance then
                VisualizerPart.Size = Vector3.new(Distance, Distance, Distance)
				for i, v in pairs(Players:GetPlayers()) do
					if v ~= LocalPlayer then
						local Torso = v.Character and v.Character:FindFirstChild("Torso")
						if Torso and Torso:IsA("Part") then
							local Dist = v:DistanceFromCharacter(Handle.Position)
							if Dist <= LungeWhenNear.Distance and LocalPlayer.Character.Humanoid.Health > 0 and v.Character.Humanoid.Health > 0 and v.TeamColor ~= LocalPlayer.TeamColor and Tool and not Typing then
							    Tool:Activate()
							end
							if Dist <= Distance then
								if not Typing then
									FTI(Torso, Handle)
								end
							end
						end
					end
				end
            end
        else
            SelectionBox.Visible = false
        end
    else
        SelectionBox.Visible = false
    end
end)
