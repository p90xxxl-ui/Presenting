-- THE CODE IS OPEN-SOURCE BUT MUST CREDIT ME!
-- feel free to make your own version! :D
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local CONFIG = {
    Key = "SubToZAXV3",
    Title = "Asylum Life Teleporter | V1.0",
    Teleports = {
        {Name = "Exit", Position = Vector3.new(-6, 517, 374)},
        {Name = "dummy123", Position = Vector3.new(100, 10, 100)},
        {Name = "Closet", Position = Vector3.new(15, 251, -373)},
        {Name = "Gym", Position = Vector3.new(-89, 270, -458)},
        {Name = "Box Room", Position = Vector3.new(144, 251, -362)},
        {Name = "Facility Director Configure Room", Position = Vector3.new(129, 251, -317)},
        {Name = "Ignotus Lab", Position = Vector3.new(290, 270, -261)},
        {Name = "Management", Position = Vector3.new(220, 270, -264)},
        {Name = "Disposal", Position = Vector3.new(203, 270, -272)},
        {Name = "Emergency Stairs", Position = Vector3.new(-68, 518, -371)},
        {Name = "Cubix exit", Position = Vector3.new(18, 287, -422)},
        {Name = "Basement", Position = Vector3.new(-59, 249, -402)},
    },
    TweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
}

local MainGui = Instance.new("ScreenGui")
MainGui.Name = "TeleporterGui"
MainGui.ResetOnSpawn = false
MainGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
MainGui.IgnoreGuiInset = true

local createMainGui

local function createKeyGui()
    local keyFrame = Instance.new("Frame")
    keyFrame.Size = UDim2.fromOffset(300, 180)
    keyFrame.Position = UDim2.fromScale(0.5, 0.5)
    keyFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    keyFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    keyFrame.BackgroundTransparency = 1
    keyFrame.Parent = MainGui

    Instance.new("UICorner", keyFrame).CornerRadius = UDim.new(0, 8)

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Text = "Enter Key"
    title.Font = Enum.Font.SourceSansBold
    title.TextSize = 20
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.BackgroundTransparency = 1
    title.Parent = keyFrame

    local keyBox = Instance.new("TextBox")
    keyBox.Size = UDim2.new(1, -40, 0, 40)
    keyBox.Position = UDim2.new(0.5, 0, 0.45, 0)
    keyBox.AnchorPoint = Vector2.new(0.5, 0.5)
    keyBox.PlaceholderText = "Key here..."
    keyBox.ClearTextOnFocus = false
    keyBox.Font = Enum.Font.SourceSans
    keyBox.TextSize = 18
    keyBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    keyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    keyBox.Parent = keyFrame
    Instance.new("UICorner", keyBox).CornerRadius = UDim.new(0, 4)

    local submitButton = Instance.new("TextButton")
    submitButton.Size = UDim2.new(1, -40, 0, 40)
    submitButton.Position = UDim2.new(0.5, 0, 0.8, 0)
    submitButton.AnchorPoint = Vector2.new(0.5, 0.5)
    submitButton.Text = "Submit"
    submitButton.Font = Enum.Font.SourceSansBold
    submitButton.TextSize = 18
    submitButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    submitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    submitButton.Parent = keyFrame
    Instance.new("UICorner", submitButton).CornerRadius = UDim.new(0, 4)
    
    TweenService:Create(keyFrame, CONFIG.TweenInfo, {BackgroundTransparency = 0}):Play()

    submitButton.MouseButton1Click:Connect(function()
        if keyBox.Text == CONFIG.Key then
            local fadeOut = TweenService:Create(keyFrame, CONFIG.TweenInfo, {BackgroundTransparency = 1})
            fadeOut:Play()
            fadeOut.Completed:Wait()
            keyFrame:Destroy()
            createMainGui()
        else
            
            local originalPos = keyFrame.Position
            local shakeTween = TweenService:Create(keyFrame, TweenInfo.new(0.05), {Position = originalPos + UDim2.fromOffset(10, 0)})
            shakeTween:Play()
            shakeTween.Completed:Wait()
            shakeTween = TweenService:Create(keyFrame, TweenInfo.new(0.05), {Position = originalPos})
            shakeTween:Play()
        end
    end)
end

createMainGui = function()
    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.fromOffset(300, 400)
    mainFrame.Position = UDim2.fromScale(0.5, 0.5)
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    mainFrame.BackgroundTransparency = 1
    mainFrame.ClipsDescendants = true
    mainFrame.Parent = MainGui
    Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 8)

    local topBar = Instance.new("Frame")
    topBar.Size = UDim2.new(1, 0, 0, 40)
    topBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    topBar.Parent = mainFrame
    
    local contentFrame = Instance.new("ScrollingFrame")
    contentFrame.Size = UDim2.new(1, 0, 1, -40)
    contentFrame.Position = UDim2.fromOffset(0, 40)
    contentFrame.BackgroundTransparency = 1
    contentFrame.BorderSizePixel = 0
    contentFrame.ScrollBarThickness = 6
    contentFrame.Parent = mainFrame
    Instance.new("UIListLayout", contentFrame).Padding = UDim.new(0, 5)
    Instance.new("UIPadding", contentFrame).PaddingTop = UDim.new(0, 5)
    
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -80, 1, 0)
    title.Position = UDim2.fromOffset(10, 0)
    title.Text = CONFIG.Title
    title.Font = Enum.Font.SourceSansBold
    title.TextSize = 18
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.BackgroundTransparency = 1
    title.Parent = topBar

    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.fromOffset(40, 40)
    closeButton.Position = UDim2.new(1, 0, 0.5, 0)
    closeButton.AnchorPoint = Vector2.new(1, 0.5)
    closeButton.Text = "X"
    closeButton.Font = Enum.Font.SourceSansBold
    closeButton.TextSize = 20
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.BackgroundTransparency = 1
    closeButton.Parent = topBar

    local minimizeButton = Instance.new("TextButton")
    minimizeButton.Size = UDim2.fromOffset(40, 40)
    minimizeButton.Position = UDim2.new(1, -40, 0.5, 0)
    minimizeButton.AnchorPoint = Vector2.new(1, 0.5)
    minimizeButton.Text = "—"
    minimizeButton.Font = Enum.Font.SourceSansBold
    minimizeButton.TextSize = 20
    minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    minimizeButton.BackgroundTransparency = 1
    minimizeButton.Parent = topBar
    
    for _, data in ipairs(CONFIG.Teleports) do
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(1, -10, 0, 40)
        button.Position = UDim2.fromScale(0.5, 0)
        button.AnchorPoint = Vector2.new(0.5, 0)
        button.Text = data.Name
        button.Font = Enum.Font.SourceSans
        button.TextSize = 18
        button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.Parent = contentFrame
        Instance.new("UICorner", button).CornerRadius = UDim.new(0, 4)
        
        button.MouseButton1Click:Connect(function()
            local char = player.Character
            local rootPart = char and char:FindFirstChild("HumanoidRootPart")
            if rootPart then
                rootPart.CFrame = CFrame.new(data.Position)
            end
        end)
    end
    
    local isMinimized = false
    local sizeBeforeMinimize = mainFrame.Size
    
    closeButton.MouseButton1Click:Connect(function()
        local fadeOut = TweenService:Create(mainFrame, CONFIG.TweenInfo, {BackgroundTransparency = 1})
        fadeOut:Play()
        fadeOut.Completed:Wait()
        MainGui:Destroy()
    end)
    
    minimizeButton.MouseButton1Click:Connect(function()
        isMinimized = not isMinimized
        if isMinimized then
            sizeBeforeMinimize = mainFrame.Size
            minimizeButton.Text = "+"
            TweenService:Create(mainFrame, CONFIG.TweenInfo, {Size = UDim2.fromOffset(sizeBeforeMinimize.X.Offset, 40)}):Play()
        else
            minimizeButton.Text = "—"
            TweenService:Create(mainFrame, CONFIG.TweenInfo, {Size = sizeBeforeMinimize}):Play()
        end
    end)
    
    topBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            local dragStart = input.Position
            local startPos = mainFrame.Position
            
            local moveConn
            moveConn = UserInputService.InputChanged:Connect(function(moveInput)
                if moveInput.UserInputType == input.UserInputType then
                    local delta = moveInput.Position - dragStart
                    mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
                end
            end)
            
            local endConn
            endConn = UserInputService.InputEnded:Connect(function(endInput)
                if endInput.UserInputType == input.UserInputType then
                    moveConn:Disconnect()
                    endConn:Disconnect()
                end
            end)
        end
    end)
    
    TweenService:Create(mainFrame, CONFIG.TweenInfo, {BackgroundTransparency = 0}):Play()
end

MainGui.Parent = playerGui
createKeyGui()