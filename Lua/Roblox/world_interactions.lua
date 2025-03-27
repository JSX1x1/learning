-- world_interactions.lua

-- This script provides a GUI that lets the player modify the game environment in various ways.
-- Players can interact with elements such as lighting, time of day, weather, and terrain properties.

-- Setup Instructions:
-- 1. Place this script in ServerScriptService.
-- 2. Ensure you have a LocalScript that handles player input and GUI functionality.
-- 3. Players can interact with the GUI to modify the environment (weather, time, etc.).

-- Setup for GUI and environment controls

-- Create the ScreenGui for the GUI interface
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "WorldInteractionsGui"
screenGui.Parent = playerGui

-- Create a Frame for the GUI
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 400)
frame.Position = UDim2.new(0, 20, 0, 20)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.BackgroundTransparency = 0.5
frame.Parent = screenGui

-- Title Label for the GUI
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(0, 300, 0, 50)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.Text = "World Interactions"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 24
titleLabel.BackgroundTransparency = 1
titleLabel.Parent = frame

-- Create Buttons to interact with the world settings

-- Time of Day Buttons
local timeOfDayLabel = Instance.new("TextLabel")
timeOfDayLabel.Size = UDim2.new(0, 300, 0, 30)
timeOfDayLabel.Position = UDim2.new(0, 0, 0, 60)
timeOfDayLabel.Text = "Change Time of Day:"
timeOfDayLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
timeOfDayLabel.BackgroundTransparency = 1
timeOfDayLabel.Parent = frame

-- Day Button
local dayButton = Instance.new("TextButton")
dayButton.Size = UDim2.new(0, 100, 0, 30)
dayButton.Position = UDim2.new(0, 0, 0, 100)
dayButton.Text = "Day"
dayButton.TextColor3 = Color3.fromRGB(255, 255, 255)
dayButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
dayButton.Parent = frame

-- Night Button
local nightButton = Instance.new("TextButton")
nightButton.Size = UDim2.new(0, 100, 0, 30)
nightButton.Position = UDim2.new(0, 150, 0, 100)
nightButton.Text = "Night"
nightButton.TextColor3 = Color3.fromRGB(255, 255, 255)
nightButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
nightButton.Parent = frame

-- Weather Buttons
local weatherLabel = Instance.new("TextLabel")
weatherLabel.Size = UDim2.new(0, 300, 0, 30)
weatherLabel.Position = UDim2.new(0, 0, 0, 150)
weatherLabel.Text = "Change Weather:"
weatherLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
weatherLabel.BackgroundTransparency = 1
weatherLabel.Parent = frame

-- Sunny Button
local sunnyButton = Instance.new("TextButton")
sunnyButton.Size = UDim2.new(0, 100, 0, 30)
sunnyButton.Position = UDim2.new(0, 0, 0, 190)
sunnyButton.Text = "Sunny"
sunnyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
sunnyButton.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
sunnyButton.Parent = frame

-- Rainy Button
local rainyButton = Instance.new("TextButton")
rainyButton.Size = UDim2.new(0, 100, 0, 30)
rainyButton.Position = UDim2.new(0, 150, 0, 190)
rainyButton.Text = "Rainy"
rainyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
rainyButton.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
rainyButton.Parent = frame

-- Lighting Buttons
local lightingLabel = Instance.new("TextLabel")
lightingLabel.Size = UDim2.new(0, 300, 0, 30)
lightingLabel.Position = UDim2.new(0, 0, 0, 250)
lightingLabel.Text = "Adjust Lighting:"
lightingLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
lightingLabel.BackgroundTransparency = 1
lightingLabel.Parent = frame

-- Increase Brightness Button
local increaseBrightnessButton = Instance.new("TextButton")
increaseBrightnessButton.Size = UDim2.new(0, 100, 0, 30)
increaseBrightnessButton.Position = UDim2.new(0, 0, 0, 290)
increaseBrightnessButton.Text = "Increase Brightness"
increaseBrightnessButton.TextColor3 = Color3.fromRGB(255, 255, 255)
increaseBrightnessButton.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
increaseBrightnessButton.Parent = frame

-- Decrease Brightness Button
local decreaseBrightnessButton = Instance.new("TextButton")
decreaseBrightnessButton.Size = UDim2.new(0, 100, 0, 30)
decreaseBrightnessButton.Position = UDim2.new(0, 150, 0, 290)
decreaseBrightnessButton.Text = "Decrease Brightness"
decreaseBrightnessButton.TextColor3 = Color3.fromRGB(255, 255, 255)
decreaseBrightnessButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
decreaseBrightnessButton.Parent = frame

-- Functionality to change the time of day
dayButton.MouseButton1Click:Connect(function()
    game.Lighting.TimeOfDay = "14:00:00"  -- Set to day
end)

nightButton.MouseButton1Click:Connect(function()
    game.Lighting.TimeOfDay = "00:00:00"  -- Set to night
end)

-- Functionality to change the weather (simulate by using effects)
sunnyButton.MouseButton1Click:Connect(function()
    -- Example of simulating sunny weather (clear skies)
    game.Lighting.Ambient = Color3.fromRGB(255, 255, 255)
    game.Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
    game.Lighting.FogColor = Color3.fromRGB(255, 255, 255)
    game.Lighting.FogStart = 5000
    game.Lighting.FogEnd = 10000
end)

rainyButton.MouseButton1Click:Connect(function()
    -- Example of simulating rainy weather
    game.Lighting.Ambient = Color3.fromRGB(100, 100, 100)
    game.Lighting.OutdoorAmbient = Color3.fromRGB(100, 100, 100)
    game.Lighting.FogColor = Color3.fromRGB(50, 50, 50)
    game.Lighting.FogStart = 0
    game.Lighting.FogEnd = 5000
end)

-- Functionality to adjust the lighting
increaseBrightnessButton.MouseButton1Click:Connect(function()
    -- Increase the brightness of the environment
    game.Lighting.Brightness = game.Lighting.Brightness + 0.1
end)

decreaseBrightnessButton.MouseButton1Click:Connect(function()
    -- Decrease the brightness of the environment
    game.Lighting.Brightness = game.Lighting.Brightness - 0.1
end)

-- Explanation:
-- This script gives players a GUI that allows them to change the following:
-- - Time of day (Day or Night)
-- - Weather (Sunny or Rainy)
-- - Lighting (Increase or Decrease Brightness)
-- 
-- Each of these elements can be customized by interacting with the GUI buttons.
-- The script provides a visual interface where players can modify the game environment dynamically.