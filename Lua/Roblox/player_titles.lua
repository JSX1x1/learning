-- player_titles.lua

-- Setup:
-- This script adds a customizable title above each player's head. The title can be personalized with:
-- 1. Text content
-- 2. Font size
-- 3. Font color
-- 4. Text stroke (outline)
-- 5. Title positioning (offset)
-- 6. Removal and update functionality
-- The title is created automatically when the player joins the game and can be modified at any time.

-- Settings for customization (modifiable as needed):
local defaultTitle = "New Player"  -- Default title for new players
local defaultFontSize = 24  -- Default font size for the title
local defaultFontColor = Color3.fromRGB(255, 255, 255)  -- Default font color (white)
local defaultTextStrokeTransparency = 0.8  -- Default text stroke transparency (lower is more visible)
local titleOffset = Vector3.new(0, 3, 0)  -- Offset for the title above the player's head
local defaultTextStrokeColor = Color3.fromRGB(0, 0, 0)  -- Default text stroke color (black)

-- Function to create a title above a player's head
local function createPlayerTitle(player, titleText, fontSize, fontColor, textStrokeTransparency, textStrokeColor, offset)
    -- Check if the player already has a title
    if player:FindFirstChild("PlayerTitle") then
        player.PlayerTitle:Destroy()  -- Remove any existing title
    end

    -- Create a BillboardGui to display the title above the player's head
    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Name = "PlayerTitle"
    billboardGui.Adornee = player.Character:WaitForChild("Head")  -- Attach the title to the player's head
    billboardGui.Size = UDim2.new(0, 200, 0, 50)  -- Set the size of the title (width x height)
    billboardGui.StudsOffset = offset  -- Set the offset for how far the title is above the player's head
    billboardGui.Parent = player.Character:WaitForChild("Head")  -- Parent it to the player's head

    -- Create a TextLabel to display the title
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Text = titleText  -- Set the title text
    titleLabel.TextSize = fontSize  -- Set the font size for the title
    titleLabel.TextColor3 = fontColor  -- Set the title text color
    titleLabel.BackgroundTransparency = 1  -- Make the background transparent
    titleLabel.TextStrokeTransparency = textStrokeTransparency  -- Add stroke effect (outline)
    titleLabel.TextStrokeColor3 = textStrokeColor  -- Set stroke color (black or any color)
    titleLabel.Parent = billboardGui  -- Set the title label as the child of the billboardGui
end

-- Function to update a player's title
local function updatePlayerTitle(player, newTitle, fontSize, fontColor, textStrokeTransparency, textStrokeColor)
    local title = player:FindFirstChild("PlayerTitle")
    if title then
        local titleLabel = title:FindFirstChildOfClass("TextLabel")
        if titleLabel then
            titleLabel.Text = newTitle  -- Update the title text
            titleLabel.TextSize = fontSize  -- Update font size
            titleLabel.TextColor3 = fontColor  -- Update font color
            titleLabel.TextStrokeTransparency = textStrokeTransparency  -- Update stroke transparency
            titleLabel.TextStrokeColor3 = textStrokeColor  -- Update stroke color
        end
    end
end

-- Function to remove the title above a player's head
local function removePlayerTitle(player)
    local title = player:FindFirstChild("PlayerTitle")
    if title then
        title:Destroy()  -- Remove the title if it exists
    end
end

-- Function to reset a player's title to the default settings
local function resetPlayerTitle(player)
    createPlayerTitle(player, defaultTitle, defaultFontSize, defaultFontColor, defaultTextStrokeTransparency, defaultTextStrokeColor, titleOffset)
end

-- PlayerAdded event to create a title for each player when they join
game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        -- Create the title with default settings when the player spawns
        createPlayerTitle(player, defaultTitle, defaultFontSize, defaultFontColor, defaultTextStrokeTransparency, defaultTextStrokeColor, titleOffset)
    end)
end)

-- Example: Update the title for a specific player after they join
game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        wait(2)  -- Wait for a moment after the character is added to the game
        updatePlayerTitle(player, "Custom Title!", 28, Color3.fromRGB(255, 0, 0), 0.6, Color3.fromRGB(0, 0, 0))  -- Change title to a custom one
    end)
end)

-- Example: Remove the title after a certain period (optional)
game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        wait(10)  -- Wait for 10 seconds after the player spawns
        removePlayerTitle(player)  -- Remove the title
    end)
end)

-- Example: Reset the title back to the default after a certain period (optional)
game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        wait(5)  -- Wait for 5 seconds after the player spawns
        resetPlayerTitle(player)  -- Reset the title to the default
    end)
end)

-- Conclusion:
-- This script demonstrates how to add a customizable title above each player's head with multiple customization options.
-- You can change the title's text, font size, color, text stroke, and positioning. The title can also be updated or removed at any time.
-- THIS SCRIPT CAN BE PLACED INTO THE WORKSPACE FOR TESTING