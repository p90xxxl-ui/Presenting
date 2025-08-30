local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- the key
local correctKey = "SubToZAXV3"

-- the teleport thingies idk
local teleports = {
    {name = "Exit", pos = Vector3.new(-6, 517, 374)},
    {name = "dummy123", pos = Vector3.new(100, 10, 100)},
    -- exampless: {name = "New Place", pos = Vector3.new(x, y, z)},
}

-- Tween info
local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

-- mobile detection for mobile users
local isMobile = UserInputService.TouchEnabled

-- the gui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TeleportGUI"
screenGui.Parent = playerGui
screenGui.IgnoreGuiInset = true

-- Key system (it sucks ngl)
local function createKeyGui()
    local keyFrame = Instance.new("Frame")
    keyFrame.Size = UDim2.new(0, 300, 0, 200)
    keyFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    keyFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    keyFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    keyFrame.BorderSizePixel = 0
    keyFrame.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = keyFrame

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, 0, 0, 40)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = "Enter Key"
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextSize = 20
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.Parent = keyFrame

    local keyBox = Instance.new("TextBox")
    keyBox.Size = UDim2.new(0.8, 0, 0, 40)
    keyBox.Position = UDim2.new(0.1, 0, 0.3, 0)
    keyBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    keyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    keyBox.TextSize = 18
    keyBox.PlaceholderText = "Key here..."
    keyBox.Parent = keyFrame

    local cornerBox = Instance.new("UICorner")
    cornerBox.CornerRadius = UDim.new(0, 4)
    cornerBox.Parent = keyBox

    local submitButton = Instance.new("TextButton")
    submitButton.Size = UDim2.new(0.8, 0, 0, 40)
    submitButton.Position = UDim2.new(0.1, 0, 0.6, 0)
    submitButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    submitButton.Text = "Submit"
    submitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    submitButton.TextSize = 18
    submitButton.Font = Enum.Font.SourceSansBold
    submitButton.Parent = keyFrame

    local cornerBtn = Instance.new("UICorner")
    cornerBtn.CornerRadius = UDim.new(0, 4)
    cornerBtn.Parent = submitButton

    -- Animate thigny
    keyFrame.BackgroundTransparency = 1
    TweenService:Create(keyFrame, tweenInfo, {BackgroundTransparency = 0}):Play()

    -- Submit code
    submitButton.MouseButton1Click:Connect(function()
        if keyBox.Text == correctKey then
            -- Animate outside
            TweenService:Create(keyFrame, tweenInfo, {BackgroundTransparency = 1}):Play()
            wait(0.3)
            keyFrame:Destroy()
            createMainGui()
        else
            -- shakey :3
            local originalPos = keyFrame.Position
            TweenService:Create(keyFrame, TweenInfo.new(0.05, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 2, true), {Position = originalPos + UDim2.new(0, 10, 0, 0)}):Play()
        end
    end)
end

-- the main gui
local function createMainGui()
    -- Determines the size
    local initialWidth = isMobile and 250 or 300
    local initialHeight = isMobile and 350 or 400

    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, initialWidth, 0, initialHeight)
    mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = mainFrame
  
    local topBar = Instance.new("Frame")
    topBar.Size = UDim2.new(1, 0, 0, 40)
    topBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    topBar.BorderSizePixel = 0
    topBar.Parent = mainFrame

    local topCorner = Instance.new("UICorner")
    topCorner.CornerRadius = UDim.new(0, 8)
    topCorner.Parent = topBar
    topCorner.CornerRadius = UDim.new(0, 8)

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(0.7, 0, 1, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = "Asylum Life Teleporter | V1.0"
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextSize = 20
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Position = UDim2.new(0.05, 0, 0, 0)
    titleLabel.Parent = topBar
  
    local minimizeButton = Instance.new("TextButton")
    minimizeButton.Size = UDim2.new(0, 30, 0, 30)
    minimizeButton.Position = UDim2.new(0.85, 0, 0.5, -15)
    minimizeButton.BackgroundTransparency = 1
    minimizeButton.Text = "-"
    minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    minimizeButton.TextSize = 24
    minimizeButton.Parent = topBar
  
    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(0, 30, 0, 30)
    closeButton.Position = UDim2.new(0.95, 0, 0.5, -15)
    closeButton.BackgroundTransparency = 1
    closeButton.Text = "X"
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.TextSize = 20
    closeButton.Parent = topBar

    -- idk what this is
    local contentFrame = Instance.new("ScrollingFrame")
    contentFrame.Size = UDim2.new(1, 0, 1, -40)
    contentFrame.Position = UDim2.new(0, 0, 0, 40)
    contentFrame.BackgroundTransparency = 1
    contentFrame.BorderSizePixel = 0
    contentFrame.ScrollBarThickness = 6
    contentFrame.Parent = mainFrame

    local uiListLayout = Instance.new("UIListLayout")
    uiListLayout.Padding = UDim.new(0, 5)
    uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    uiListLayout.Parent = contentFrame

    -- imports the buttojs into the mai nfragem
    for _, tp in ipairs(teleports) do
        local tpButton = Instance.new("TextButton")
        tpButton.Size = UDim2.new(1, -10, 0, 40)
        tpButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        tpButton.Text = tp.name
        tpButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        tpButton.TextSize = 18
        tpButton.Parent = contentFrame

        local btnCorner = Instance.new("UICorner")
        btnCorner.CornerRadius = UDim.new(0, 4)
        btnCorner.Parent = tpButton

        tpButton.MouseButton1Click:Connect(function()
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                player.Character.HumanoidRootPart.CFrame = CFrame.new(tp.pos)
            end
        end)
    end

    -- uj
    contentFrame.CanvasSize = UDim2.new(0, 0, 0, uiListLayout.AbsoluteContentSize.Y + 10)

    -- atp idk what im doing <:1
    local resizeHandle = Instance.new("Frame")
    resizeHandle.Size = UDim2.new(0, 20, 0, 20)
    resizeHandle.Position = UDim2.new(1, -20, 1, -20)
    resizeHandle.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    resizeHandle.Parent = mainFrame

    local handleCorner = Instance.new("UICorner")
    handleCorner.CornerRadius = UDim.new(0, 4)
    handleCorner.Parent = resizeHandle

    -- Dragging feature
    local dragging = false
    local dragInput
    local dragStart
    local startPos

    local function updateInput(input)
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    topBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = mainFrame.Position

            local conn
            conn = input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                    conn:Disconnect()
                end
            end)
        end
    end)

    topBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input == dragInput) then
            updateInput(input)
        end
    end)

    -- Resizing cuz why not
    local resizing = false
    local resizeStart
    local startSize

    local function updateResize(input)
        local delta = input.Position - resizeStart
        local newWidth = math.max(200, startSize.X + delta.X)  -- Min width
        local newHeight = math.max(150, startSize.Y + delta.Y)  -- Min height
        mainFrame.Size = UDim2.new(0, newWidth, 0, newHeight)
        contentFrame.Size = UDim2.new(1, 0, 1, -40)
    end

    resizeHandle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            resizing = true
            resizeStart = input.Position
            startSize = mainFrame.AbsoluteSize

            local conn
            conn = input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    resizing = false
                    conn:Disconnect()
                end
            end)
        end
    end)

    resizeHandle.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if resizing and (input == dragInput) then
            updateResize(input)
        end
    end)

    -- Minimizing feature
    local minimized = false
    local originalSize = mainFrame.Size -- Store the original size when the GUI is created

minimizeButton.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        
        originalSize = mainFrame.Size -- Update original size in case of resize
        TweenService:Create(contentFrame, tweenInfo, {Size = UDim2.new(1, 0, 0, 0)}):Play()
        TweenService:Create(mainFrame, tweenInfo, {Size = UDim2.new(originalSize.X.Scale, originalSize.X.Offset, 0, 40)}):Play()
        minimizeButton.Text = "+"
    else
        
        TweenService:Create(contentFrame, tweenInfo, {Size = UDim2.new(1, 0, 1, -40)}):Play()
        TweenService:Create(mainFrame, tweenInfo, {Size = originalSize}):Play()
        minimizeButton.Text = "-"
    end
end)
  
    closeButton.MouseButton1Click:Connect(function()
        TweenService:Create(mainFrame, tweenInfo, {BackgroundTransparency = 1}):Play()
        wait(0.3)
        screenGui:Destroy()
    end)
  
    mainFrame.BackgroundTransparency = 1
    TweenService:Create(mainFrame, tweenInfo, {BackgroundTransparency = 0}):Play()
end

createKeyGui()