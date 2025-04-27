local queueTeleport = queue_on_teleport

if not queueTeleport then
    warn("queue_on_teleport is not supported in your environment!")
    return
end

local TeleportCheck = false
game.Players.LocalPlayer.OnTeleport:Connect(function(State)
    if not TeleportCheck and queueTeleport then
        TeleportCheck = true
        queueTeleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/...'))()")
    end
end)

-- Create the Teleport UI
local screenGui = Instance.new("ScreenGui")
screenGui.ResetOnSpawn = false
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Frame Settings
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 140, 0, 110)
frame.Position = UDim2.new(0, 10, 1, -120)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BackgroundTransparency = 0.7
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

-- Close Button
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 20, 0, 20)
closeButton.Position = UDim2.new(1, -25, 0, 5)
closeButton.Text = "X"
closeButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextScaled = true
closeButton.BackgroundTransparency = 0.4
closeButton.Parent = frame

closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- TextBox
local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(1, -10, 0.35, -5)
textBox.Position = UDim2.new(0, 5, 0, 30)
textBox.PlaceholderText = "Enter Job ID"
textBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
textBox.BackgroundTransparency = 0.5
textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
textBox.Parent = frame

-- Teleport Button
local button = Instance.new("TextButton")
button.Size = UDim2.new(1, -10, 0.35, -5)
button.Position = UDim2.new(0, 5, 0.6, 5)
button.Text = "TELEPORT"
button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
button.BackgroundTransparency = 0.5
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Parent = frame

button.MouseButton1Click:Connect(function()
    local jobId = textBox.Text
    if jobId ~= "" then
        local TeleportService = game:GetService("TeleportService")
        queueTeleport([[loadstring(game:HttpGet('https://raw.githubusercontent.com/...'))()]])
        TeleportService:TeleportToPlaceInstance(game.PlaceId, jobId, game.Players.LocalPlayer)
    else
        warn("Please enter a valid Job ID!")
    end
end)

print("Enhanced UI with teleport logic integrated is ready!")
