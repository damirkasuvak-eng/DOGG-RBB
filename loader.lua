-- ================= DOGG_RBB LOADER =================
-- Загрузчик в стиле Sakura Hub
-- ===================================================

local SOUND_ID = 107089652181213  -- звук при запуске
local LOADER_URL = local LOADER_URL = "https://raw.githubusercontent.com/danirkasuvak-eng/DOGG-RBB/main/hub.lua" -- СЮДА ВСТАВЬ ССЫЛКУ НА СВОЙ ОСНОВНОЙ СКРИПТ

-- Воспроизведение звука
local function playSound()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://" .. SOUND_ID
    sound.Volume = 1
    sound.Parent = workspace
    sound:Play()
    sound.Ended:Connect(function()
        sound:Destroy()
    end)
end

-- Создание GUI
local function createGUI()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    screenGui.ResetOnSpawn = false

    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 400, 0, 250)
    mainFrame.Position = UDim2.new(0.5, -200, 0.5, -125)
    mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    mainFrame.BorderSizePixel = 0
    mainFrame.ClipsDescendants = true
    mainFrame.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = mainFrame

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Position = UDim2.new(0, 0, 0, 10)
    title.BackgroundTransparency = 1
    title.Text = "DOGG_RBB"
    title.TextColor3 = Color3.fromRGB(255, 200, 200)
    title.TextSize = 24
    title.Font = Enum.Font.GothamBold
    title.Parent = mainFrame

    local infoText = Instance.new("TextLabel")
    infoText.Size = UDim2.new(0.9, 0, 0, 30)
    infoText.Position = UDim2.new(0.05, 0, 0, 80)
    infoText.BackgroundTransparency = 1
    infoText.Text = "Нажми 'Согласен', чтобы загрузить скрипт"
    infoText.TextColor3 = Color3.fromRGB(200, 200, 200)
    infoText.TextSize = 14
    infoText.Font = Enum.Font.Gotham
    infoText.TextWrapped = true
    infoText.Parent = mainFrame

    local buttonFrame = Instance.new("Frame")
    buttonFrame.Size = UDim2.new(0.9, 0, 0, 40)
    buttonFrame.Position = UDim2.new(0.05, 0, 0, 150)
    buttonFrame.BackgroundTransparency = 1
    buttonFrame.Parent = mainFrame

    local agreeBtn = Instance.new("TextButton")
    agreeBtn.Size = UDim2.new(0.45, -5, 1, 0)
    agreeBtn.Position = UDim2.new(0, 0, 0, 0)
    agreeBtn.BackgroundColor3 = Color3.fromRGB(60, 200, 100)
    agreeBtn.Text = "Согласен"
    agreeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    agreeBtn.TextSize = 18
    agreeBtn.Font = Enum.Font.GothamBold
    agreeBtn.Parent = buttonFrame

    local agreeCorner = Instance.new("UICorner")
    agreeCorner.CornerRadius = UDim.new(0, 8)
    agreeCorner.Parent = agreeBtn

    local denyBtn = Instance.new("TextButton")
    denyBtn.Size = UDim2.new(0.45, -5, 1, 0)
    denyBtn.Position = UDim2.new(0.55, 0, 0, 0)
    denyBtn.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
    denyBtn.Text = "Отмена"
    denyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    denyBtn.TextSize = 18
    denyBtn.Font = Enum.Font.GothamBold
    denyBtn.Parent = buttonFrame

    local denyCorner = Instance.new("UICorner")
    denyCorner.CornerRadius = UDim.new(0, 8)
    denyCorner.Parent = denyBtn

    agreeBtn.MouseButton1Click:Connect(function()
        screenGui:Destroy()
        loadstring(game:HttpGet(LOADER_URL))()
    end)

    denyBtn.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)
end

playSound()
task.wait(0.5)
createGUI()
