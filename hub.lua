-- ================= DOGG_RBB HUB =================
-- Основной скрипт
-- =================================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- ================= НАСТРОЙКИ =================
local CONFIG = {
    ESP = false,
    Aimbot = false,
    Fling = false,
    SpeedGlitch = false,
    Aura = false,
    SniperSkin = false,
    KerambitSkin = false,
    Fullbright = false,
    KillSound = false,
    ShootSound = false,
    WalkSpeed = 100,
    AuraRadius = 30,
}
-- ==============================================

-- ================= LOADING =================
local LoadGui = Instance.new("ScreenGui")
LoadGui.Name = "DOGG_RBB_Loading"
LoadGui.ResetOnSpawn = false
LoadGui.Parent = game.CoreGui

local LoadFrame = Instance.new("Frame")
LoadFrame.Size = UDim2.new(1, 0, 1, 0)
LoadFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
LoadFrame.BorderSizePixel = 0
LoadFrame.Parent = LoadGui

local LoadTitle = Instance.new("TextLabel")
LoadTitle.Size = UDim2.new(1, 0, 0, 60)
LoadTitle.Position = UDim2.new(0, 0, 0.4, -60)
LoadTitle.BackgroundTransparency = 1
LoadTitle.Text = "DOGG_RBB"
LoadTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadTitle.TextSize = 40
LoadTitle.Font = Enum.Font.GothamBold
LoadTitle.Parent = LoadFrame

local BarBg = Instance.new("Frame")
BarBg.Size = UDim2.new(0, 300, 0, 10)
BarBg.Position = UDim2.new(0.5, -150, 0.5, 40)
BarBg.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
BarBg.BorderSizePixel = 0
BarBg.Parent = LoadFrame

local BarBgCorner = Instance.new("UICorner")
BarBgCorner.CornerRadius = UDim.new(0, 5)
BarBgCorner.Parent = BarBg

local BarFill = Instance.new("Frame")
BarFill.Size = UDim2.new(0, 0, 1, 0)
BarFill.BackgroundColor3 = Color3.fromRGB(80, 160, 255)
BarFill.BorderSizePixel = 0
BarFill.Parent = BarBg

local BarFillCorner = Instance.new("UICorner")
BarFillCorner.CornerRadius = UDim.new(0, 5)
BarFillCorner.Parent = BarFill

task.spawn(function()
    for i = 0, 100, 2 do
        BarFill.Size = UDim2.new(i / 100, 0, 1, 0)
        task.wait(0.02)
    end
    task.wait(0.3)
    LoadGui:Destroy()
end)
-- ==============================================

-- ================= МЕНЮ =================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DOGG_RBB"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game.CoreGui

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 200, 0, 300)
Main.Position = UDim2.new(0.5, -100, 0.5, -150)
Main.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.Parent = ScreenGui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 8)
Corner.Parent = Main

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 35)
Title.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
Title.BorderSizePixel = 0
Title.Text = "DOGG_RBB"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16
Title.Font = Enum.Font.GothamBold
Title.Parent = Main

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 8)
TitleCorner.Parent = Title

local Minimize = Instance.new("TextButton")
Minimize.Size = UDim2.new(0, 25, 0, 25)
Minimize.Position = UDim2.new(1, -55, 0, 5)
Minimize.BackgroundColor3 = Color3.fromRGB(200, 160, 60)
Minimize.Text = "—"
Minimize.TextColor3 = Color3.fromRGB(255, 255, 255)
Minimize.TextSize = 16
Minimize.Font = Enum.Font.GothamBold
Minimize.Parent = Title

local Close = Instance.new("TextButton")
Close.Size = UDim2.new(0, 25, 0, 25)
Close.Position = UDim2.new(1, -28, 0, 5)
Close.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.TextSize = 14
Close.Font = Enum.Font.GothamBold
Close.Parent = Title

local Scroll = Instance.new("ScrollingFrame")
Scroll.Size = UDim2.new(1, -10, 1, -45)
Scroll.Position = UDim2.new(0, 5, 0, 40)
Scroll.BackgroundTransparency = 1
Scroll.BorderSizePixel = 0
Scroll.ScrollBarThickness = 3
Scroll.CanvasSize = UDim2.new(0, 0, 0, 600)
Scroll.Parent = Main

local UIList = Instance.new("UIListLayout")
UIList.Padding = UDim.new(0, 5)
UIList.SortOrder = Enum.SortOrder.LayoutOrder
UIList.Parent = Scroll

local function createToggle(name, key)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1, -8, 0, 30)
    Btn.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    Btn.Text = name .. ": ВЫКЛ"
    Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    Btn.TextSize = 13
    Btn.Font = Enum.Font.Gotham
    Btn.Parent = Scroll

    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 5)
    BtnCorner.Parent = Btn

    Btn.MouseButton1Click:Connect(function()
        CONFIG[key] = not CONFIG[key]
        if CONFIG[key] then
            Btn.Text = name .. ": ВКЛ"
            Btn.BackgroundColor3 = Color3.fromRGB(50, 130, 50)
            Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        else
            Btn.Text = name .. ": ВЫКЛ"
            Btn.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
            Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
        end
    end)
end

local function createSlider(name, key, min, max, default)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, -8, 0, 45)
    Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    Frame.BorderSizePixel = 0
    Frame.Parent = Scroll

    local FrameCorner = Instance.new("UICorner")
    FrameCorner.CornerRadius = UDim.new(0, 5)
    FrameCorner.Parent = Frame

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, 0, 0, 20)
    Label.BackgroundTransparency = 1
    Label.Text = name .. ": " .. default
    Label.TextColor3 = Color3.fromRGB(200, 200, 200)
    Label.TextSize = 12
    Label.Font = Enum.Font.Gotham
    Label.Parent = Frame

    local Slider = Instance.new("TextButton")
    Slider.Size = UDim2.new(0.9, 0, 0, 15)
    Slider.Position = UDim2.new(0.05, 0, 0, 22)
    Slider.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
    Slider.Text = ""
    Slider.Parent = Frame

    local SliderCorner = Instance.new("UICorner")
    SliderCorner.CornerRadius = UDim.new(0, 4)
    SliderCorner.Parent = Slider

    local Fill = Instance.new("Frame")
    Fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    Fill.BackgroundColor3 = Color3.fromRGB(80, 160, 255)
    Fill.BorderSizePixel = 0
    Fill.Parent = Slider

    local dragging = false

    Slider.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
        end
    end)

    Slider.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local mouseX = input.Position.X
            local sliderPos = Slider.AbsolutePosition.X
            local sliderSize = Slider.AbsoluteSize.X
            local percent = math.clamp((mouseX - sliderPos) / sliderSize, 0, 1)
            local value = math.floor(min + (max - min) * percent)
            Fill.Size = UDim2.new(percent, 0, 1, 0)
            Label.Text = name .. ": " .. value
            CONFIG[key] = value
        end
    end)
end

-- Кнопки
createToggle("ESP", "ESP")
createToggle("Aimbot", "Aimbot")
createToggle("Fling", "Fling")
createToggle("Speed Glitch", "SpeedGlitch")
createToggle("Aura", "Aura")
createToggle("Снайперка", "SniperSkin")
createToggle("Керамбит", "KerambitSkin")
createToggle("Fullbright", "Fullbright")
createToggle("Звук убийства", "KillSound")
createToggle("Звук выстрела", "ShootSound")

-- Слайдеры
createSlider("Скорость", "WalkSpeed", 16, 300, 100)
createSlider("Радиус ауры", "AuraRadius", 5, 100, 30)

-- Свернуть
local minimized = false
Minimize.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        Scroll.Visible = false
        Main.Size = UDim2.new(0, 200, 0, 35)
    else
        Scroll.Visible = true
        Main.Size = UDim2.new(0, 200, 0, 300)
    end
end)

-- Закрыть
Close.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)
-- ==============================================

-- ================= ESP =================
local espCache = {}

local function createESP(plr)
    if plr == LocalPlayer then return end
    if not Drawing then return end
    local box = Drawing.new("Square")
    box.Thickness = 1
    box.Filled = false
    box.Transparency = 1
    box.Color = Color3.fromRGB(255, 255, 255)

    local nameTag = Drawing.new("Text")
    nameTag.Size = 14
    nameTag.Center = true
    nameTag.Outline = true
    nameTag.OutlineColor = Color3.new(0, 0, 0)
    nameTag.Color = Color3.fromRGB(255, 255, 255)
    nameTag.Visible = false

    espCache[plr] = { box = box, name = nameTag }
end

local function removeESP(plr)
    if espCache[plr] then
        espCache[plr].box:Remove()
        espCache[plr].name:Remove()
        espCache[plr] = nil
    end
end

local function updateESP()
    for plr, data in pairs(espCache) do
        if not CONFIG.ESP or not plr.Character or not plr.Character:FindFirstChild("HumanoidRootPart") then
            data.box.Visible = false
            data.name.Visible = false
            continue
        end
        local hrp = plr.Character.HumanoidRootPart
        local pos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(hrp.Position)
        if onScreen then
            local size = (workspace.CurrentCamera:WorldToViewportPoint(hrp.Position + Vector3.new(0, 3, 0)) - pos).Y
            data.box.Size = Vector2.new(size * 1.5, size * 2.5)
            data.box.Position = Vector2.new(pos.X - data.box.Size.X / 2, pos.Y - data.box.Size.Y / 2)
            data.box.Visible = true
            data.name.Text = plr.Name
            data.name.Position = Vector2.new(pos.X, pos.Y - data.box.Size.Y / 2 - 15)
            data.name.Visible = true
        else
            data.box.Visible = false
            data.name.Visible = false
        end
    end
end

for _, plr in ipairs(Players:GetPlayers()) do createESP(plr) end
Players.PlayerAdded:Connect(createESP)
Players.PlayerRemoving:Connect(removeESP)

-- ================= SPEED GLITCH =================
local originalSpeed = 16
LocalPlayer.CharacterAdded:Connect(function(char)
    local hum = char:WaitForChild("Humanoid")
    originalSpeed = hum.WalkSpeed
end)

UserInputService.JumpRequest:Connect(function()
    if not CONFIG.SpeedGlitch then return end
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.WalkSpeed = CONFIG.WalkSpeed
        task.wait(0.5)
        if char.Humanoid then
            char.Humanoid.WalkSpeed = originalSpeed
        end
    end
end)

-- ================= FLING =================
local function flingPlayer(target)
    if not target or not target.Character then return end
    local hrp = target.Character:FindFirstChild("HumanoidRootPart")
    if hrp then
        local velocity = Instance.new("BodyVelocity")
        velocity.Velocity = Vector3.new(9999, 9999, 9999)
        velocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        velocity.Parent = hrp
        task.wait(0.1)
        velocity:Destroy()
    end
end

-- ================= AIMBOT + AURA =================
local function getNearestPlayer()
    local closest, dist = nil, math.huge
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return nil end
    local myPos = char.HumanoidRootPart.Position
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local d = (myPos - plr.Character.HumanoidRootPart.Position).Magnitude
            if d < dist then
                closest = plr
                dist = d
            end
        end
    end
    return closest
end

-- ================= FULLBRIGHT =================
local function setFullbright(on)
    if on then
        game.Lighting.Ambient = Color3.fromRGB(255, 255, 255)
        game.Lighting.Brightness = 2
    else
        game.Lighting.Ambient = Color3.fromRGB(0, 0, 0)
        game.Lighting.Brightness = 1
    end
end

-- ================= ГЛАВНЫЙ ЦИКЛ =================
RunService.RenderStepped:Connect(function()
    if Drawing then updateESP() end

    if CONFIG.Fullbright then setFullbright(true) else setFullbright(false) end

    if CONFIG.Aura then
        local target = getNearestPlayer()
        if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                local dist = (char.HumanoidRootPart.Position - target.Character.HumanoidRootPart.Position).Magnitude
                if dist <= CONFIG.AuraRadius then
                    flingPlayer(target)
                end
            end
        end
    end
end)

print("[DOGG_RBB] Hub загружен!")
