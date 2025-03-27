-- learning_gui_operations.lua

-- This script will guide you through creating a simple GUI with different operations and modification possibilities in Roblox.

-- 1. Creating the ScreenGui and GUI Elements
-- First, let's create a basic GUI with a Frame, Button, TextLabel, TextBox, and a Slider.

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "LearningGui"
screenGui.Parent = playerGui

-- 2. Creating a Frame to hold other GUI elements
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 300)  -- Size of the frame (400x300 pixels)
frame.Position = UDim2.new(0.5, -200, 0.5, -150)  -- Center the frame on the screen
frame.BackgroundColor3 = Color3.fromRGB(200, 200, 255)  -- Light blue background color
frame.Parent = screenGui

-- 3. Adding a Title TextLabel inside the Frame
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(0, 400, 0, 50)  -- Size of the label (400x50 pixels)
titleLabel.Position = UDim2.new(0, 0, 0, 0)  -- Position at the top of the frame
titleLabel.Text = "Welcome to Roblox GUI Learning!"
titleLabel.TextSize = 24  -- Font size
titleLabel.TextColor3 = Color3.fromRGB(0, 0, 0)  -- Black text color
titleLabel.BackgroundTransparency = 1  -- Make the background transparent
titleLabel.Parent = frame

-- 4. Adding a Button to change the background color
local colorChangeButton = Instance.new("TextButton")
colorChangeButton.Size = UDim2.new(0, 150, 0, 50)
colorChangeButton.Position = UDim2.new(0.5, -75, 0, 60)  -- Position below the title label
colorChangeButton.Text = "Change Color"
colorChangeButton.TextSize = 18
colorChangeButton.BackgroundColor3 = Color3.fromRGB(100, 255, 100)  -- Green button
colorChangeButton.Parent = frame

-- Button Click Function to change the Frame's background color
colorChangeButton.MouseButton1Click:Connect(function()
    frame.BackgroundColor3 = Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))  -- Random color
end)

-- 5. Adding a TextBox for input
local inputBox = Instance.new("TextBox")
inputBox.Size = UDim2.new(0, 200, 0, 50)
inputBox.Position = UDim2.new(0.5, -100, 0, 120)  -- Below the color change button
inputBox.PlaceholderText = "Enter your name"
inputBox.TextSize = 18
inputBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)  -- White background
inputBox.Parent = frame

-- 6. Adding a Button to display input text in the label
local displayButton = Instance.new("TextButton")
displayButton.Size = UDim2.new(0, 150, 0, 50)
displayButton.Position = UDim2.new(0.5, -75, 0, 190)  -- Below the text box
displayButton.Text = "Display Name"
displayButton.TextSize = 18
displayButton.BackgroundColor3 = Color3.fromRGB(100, 100, 255)  -- Blue button
displayButton.Parent = frame

-- Button Click Function to display entered name in the title label
displayButton.MouseButton1Click:Connect(function()
    titleLabel.Text = "Hello, " .. inputBox.Text .. "!"
end)

-- 7. Adding a Slider to change TextLabel size dynamically
local slider = Instance.new("Slider")
slider.Size = UDim2.new(0, 200, 0, 50)
slider.Position = UDim2.new(0.5, -100, 0, 260)  -- Below the display button
slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
slider.MinValue = 10  -- Minimum text size
slider.MaxValue = 48  -- Maximum text size
slider.Value = titleLabel.TextSize  -- Set the initial text size to match title label's size
slider.Parent = frame

-- Slider change function to update the TextSize of the title label dynamically
slider.Changed:Connect(function()
    titleLabel.TextSize = slider.Value
end)

-- 8. Adding a Toggle to show/hide the Frame
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 150, 0, 50)
toggleButton.Position = UDim2.new(0.5, -75, 0, 320)  -- Below the slider
toggleButton.Text = "Hide/Show Frame"
toggleButton.TextSize = 18
toggleButton.BackgroundColor3 = Color3.fromRGB(255, 200, 100)  -- Orange button
toggleButton.Parent = frame

-- Button click function to hide/show the frame
toggleButton.MouseButton1Click:Connect(function()
    frame.Visible = not frame.Visible  -- Toggle visibility of the frame
end)

-- 9. Conclusion
print("GUI learning script with operations such as modifying frame color, displaying input, resizing text, and toggling visibility!")
