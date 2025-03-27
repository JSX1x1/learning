-- player_operations.lua

-- This script demonstrates a GUI that allows the user to modify the player's character behavior,
-- including walk speed, jump power, and other operations.

-- Get the local player and their PlayerGui
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create the ScreenGui to hold all the UI elements
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "PlayerOperationsGui"
screenGui.Parent = playerGui

-- 1. Create a Frame for the GUI layout
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 350)  -- Size of the frame (300x350 pixels)
frame.Position = UDim2.new(0.5, -150, 0.5, -175)  -- Position in the center of the screen
frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)  -- White background
frame.Parent = screenGui

-- 2. Create a Title Label inside the Frame
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(0, 300, 0, 40)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.Text = "Player Operations"
titleLabel.TextSize = 24
titleLabel.TextColor3 = Color3.fromRGB(0, 0, 0)  -- Black text color
titleLabel.BackgroundTransparency = 1
titleLabel.Parent = frame

-- 3. Create a Walk Speed Slider
local walkSpeedLabel = Instance.new("TextLabel")
walkSpeedLabel.Size = UDim2.new(0, 200, 0, 30)
walkSpeedLabel.Position = UDim2.new(0.5, -100, 0, 60)
walkSpeedLabel.Text = "Walk Speed: 16"
walkSpeedLabel.TextSize = 18
walkSpeedLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
walkSpeedLabel.BackgroundTransparency = 1
walkSpeedLabel.Parent = frame

local walkSpeedSlider = Instance.new("Slider")
walkSpeedSlider.Size = UDim2.new(0, 200, 0, 30)
walkSpeedSlider.Position = UDim2.new(0.5, -100, 0, 100)
walkSpeedSlider.MinValue = 0
walkSpeedSlider.MaxValue = 100
walkSpeedSlider.Value = player.Character:WaitForChild("Humanoid").WalkSpeed
walkSpeedSlider.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
walkSpeedSlider.Parent = frame

-- Update WalkSpeed when the slider value changes
walkSpeedSlider.Changed:Connect(function()
    local humanoid = player.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = walkSpeedSlider.Value
        walkSpeedLabel.Text = "Walk Speed: " .. math.floor(walkSpeedSlider.Value)
    end
end)

-- 4. Create a Jump Power Slider
local jumpPowerLabel = Instance.new("TextLabel")
jumpPowerLabel.Size = UDim2.new(0, 200, 0, 30)
jumpPowerLabel.Position = UDim2.new(0.5, -100, 0, 150)
jumpPowerLabel.Text = "Jump Power: 50"
jumpPowerLabel.TextSize = 18
jumpPowerLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
jumpPowerLabel.BackgroundTransparency = 1
jumpPowerLabel.Parent = frame

local jumpPowerSlider = Instance.new("Slider")
jumpPowerSlider.Size = UDim2.new(0, 200, 0, 30)
jumpPowerSlider.Position = UDim2.new(0.5, -100, 0, 190)
jumpPowerSlider.MinValue = 0
jumpPowerSlider.MaxValue = 200
jumpPowerSlider.Value = player.Character:WaitForChild("Humanoid").JumpPower
jumpPowerSlider.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
jumpPowerSlider.Parent = frame

-- Update JumpPower when the slider value changes
jumpPowerSlider.Changed:Connect(function()
    local humanoid = player.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.JumpPower = jumpPowerSlider.Value
        jumpPowerLabel.Text = "Jump Power: " .. math.floor(jumpPowerSlider.Value)
    end
end)

-- 5. Create a Toggle to Enable/Disable Infinite Yield
local infiniteYieldLabel = Instance.new("TextLabel")
infiniteYieldLabel.Size = UDim2.new(0, 200, 0, 30)
infiniteYieldLabel.Position = UDim2.new(0.5, -100, 0, 240)
infiniteYieldLabel.Text = "Infinite Yield: OFF"
infiniteYieldLabel.TextSize = 18
infiniteYieldLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
infiniteYieldLabel.BackgroundTransparency = 1
infiniteYieldLabel.Parent = frame

local infiniteYieldButton = Instance.new("TextButton")
infiniteYieldButton.Size = UDim2.new(0, 200, 0, 40)
infiniteYieldButton.Position = UDim2.new(0.5, -100, 0, 280)
infiniteYieldButton.Text = "Toggle Infinite Yield"
infiniteYieldButton.TextSize = 18
infiniteYieldButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)  -- Red button
infiniteYieldButton.Parent = frame

-- Toggle Infinite Yield (set to 10000 to simulate Infinite Yield)
local infiniteYieldEnabled = false
infiniteYieldButton.MouseButton1Click:Connect(function()
    infiniteYieldEnabled = not infiniteYieldEnabled
    if infiniteYieldEnabled then
        local humanoid = player.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.Health = humanoid.Health + 10000  -- Simulate infinite health
        end
        infiniteYieldLabel.Text = "Infinite Yield: ON"
        infiniteYieldButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)  -- Green button
    else
        infiniteYieldLabel.Text = "Infinite Yield: OFF"
        infiniteYieldButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)  -- Red button
    end
end)

-- 6. Conclusion
print("Player Operations GUI loaded. You can now modify the player's WalkSpeed, JumpPower, and toggle Infinite Yield!")
