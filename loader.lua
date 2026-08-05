local inputService = game:GetService('UserInputService')
local renderService = game:GetService('RunService')
local tweenService = game:GetService('TweenService')

local function tw(obj, props, dur)
    tweenService:Create(obj, TweenInfo.new(dur or 0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), props):Play()
end

local themes = {
    default = {
        bg = Color3.fromRGB(15, 15, 18),
        surface = Color3.fromRGB(22, 22, 26),
        surfaceHover = Color3.fromRGB(30, 30, 36),
        accent = Color3.fromRGB(134, 53, 255),
        accent2 = Color3.fromRGB(211, 53, 255),
        text = Color3.fromRGB(220, 220, 220),
        textDim = Color3.fromRGB(120, 120, 130),
        border = Color3.fromRGB(35, 35, 40),
        borderHover = Color3.fromRGB(60, 60, 70),
        good = Color3.fromRGB(80, 230, 120),
        warn = Color3.fromRGB(255, 190, 60),
        bad = Color3.fromRGB(230, 70, 70),
    },
    red = {
        bg = Color3.fromRGB(14, 10, 10),
        surface = Color3.fromRGB(24, 16, 16),
        surfaceHover = Color3.fromRGB(34, 22, 22),
        accent = Color3.fromRGB(230, 50, 50),
        accent2 = Color3.fromRGB(255, 80, 80),
        text = Color3.fromRGB(230, 220, 220),
        textDim = Color3.fromRGB(140, 120, 120),
        border = Color3.fromRGB(45, 30, 30),
        borderHover = Color3.fromRGB(70, 45, 45),
        good = Color3.fromRGB(100, 230, 120),
        warn = Color3.fromRGB(255, 200, 60),
        bad = Color3.fromRGB(230, 70, 70),
    },
    cyan = {
        bg = Color3.fromRGB(10, 14, 16),
        surface = Color3.fromRGB(16, 24, 28),
        surfaceHover = Color3.fromRGB(22, 34, 40),
        accent = Color3.fromRGB(0, 190, 255),
        accent2 = Color3.fromRGB(0, 255, 200),
        text = Color3.fromRGB(220, 230, 235),
        textDim = Color3.fromRGB(120, 140, 150),
        border = Color3.fromRGB(30, 40, 48),
        borderHover = Color3.fromRGB(45, 65, 80),
        good = Color3.fromRGB(80, 230, 150),
        warn = Color3.fromRGB(255, 200, 60),
        bad = Color3.fromRGB(230, 80, 80),
    },
    green = {
        bg = Color3.fromRGB(10, 14, 10),
        surface = Color3.fromRGB(18, 26, 18),
        surfaceHover = Color3.fromRGB(26, 38, 26),
        accent = Color3.fromRGB(50, 230, 100),
        accent2 = Color3.fromRGB(100, 255, 80),
        text = Color3.fromRGB(220, 235, 220),
        textDim = Color3.fromRGB(120, 150, 120),
        border = Color3.fromRGB(30, 45, 30),
        borderHover = Color3.fromRGB(45, 70, 45),
        good = Color3.fromRGB(80, 230, 120),
        warn = Color3.fromRGB(255, 200, 60),
        bad = Color3.fromRGB(230, 80, 80),
    }
}

local T = themes.default

local screen = Instance.new('ScreenGui')
screen.Name = 'gl'
screen.DisplayOrder = 999
screen.ZIndexBehavior = 'Global'
if gethui then screen.Parent = gethui() else screen.Parent = game:GetService('CoreGui') end

local ui = {}

function ui.notify(text, dur)
    dur = dur or 2.5
    local f = Instance.new('Frame')
    f.BackgroundColor3 = T.surface
    f.BorderSizePixel = 0
    f.Position = UDim2.new(1, 20, 0.85, 0)
    f.Size = UDim2.fromOffset(220, 36)
    f.ZIndex = 5000
    f.Parent = screen

    local s = Instance.new('UIStroke')
    s.Color = T.border
    s.Thickness = 1
    s.Parent = f

    local trim = Instance.new('Frame')
    trim.BackgroundColor3 = T.accent
    trim.BorderSizePixel = 0
    trim.Size = UDim2.new(0, 3, 1, 0)
    trim.ZIndex = 5001
    trim.Parent = f

    local lbl = Instance.new('TextLabel')
    lbl.BackgroundTransparency = 1
    lbl.Position = UDim2.fromOffset(12, 0)
    lbl.Size = UDim2.new(1, -20, 1, 0)
    lbl.Text = text
    lbl.TextColor3 = T.text
    lbl.TextSize = 13
    lbl.Font = 'SourceSans'
    lbl.TextXAlignment = 'Left'
    lbl.ZIndex = 5001
    lbl.Parent = f

    tw(f, {Position = UDim2.new(1, -16, 0.85, 0)}, 0.3)
    task.delay(dur, function()
        tw(f, {Position = UDim2.new(1, 20, 0.85, 0)}, 0.25)
        task.delay(0.3, function() f:Destroy() end)
    end)
end

function ui.newLauncher(cfg)
    cfg = cfg or {}
    if cfg.theme and themes[cfg.theme] then T = themes[cfg.theme] end

    local self = {}
    self.games = {}
    self.selected = nil
    self.loading = false

    local main = Instance.new('Frame')
    main.Name = 'main'
    main.BackgroundColor3 = T.bg
    main.BorderSizePixel = 0
    main.Position = UDim2.new(0.5, -200, 0.5, -140)
    main.Size = UDim2.fromOffset(400, 280)
    main.ZIndex = 10
    main.Parent = screen
    self.main = main

    local ms = Instance.new('UIScale')
    ms.Scale = 0.95
    ms.Parent = main
    tw(ms, {Scale = 1}, 0.35)

    local stroke = Instance.new('UIStroke')
    stroke.Color = T.border
    stroke.Thickness = 1
    stroke.Parent = main

    local top = Instance.new('Frame')
    top.Name = 'top'
    top.BackgroundColor3 = T.surface
    top.BorderSizePixel = 0
    top.Size = UDim2.new(1, 0, 0, 28)
    top.ZIndex = 11
    top.Parent = main

    local topStroke = Instance.new('UIStroke')
    topStroke.Color = T.border
    topStroke.Thickness = 1
    topStroke.Parent = top

    local title = Instance.new('TextLabel')
    title.BackgroundTransparency = 1
    title.Position = UDim2.fromOffset(10, 0)
    title.Size = UDim2.new(1, -60, 1, 0)
    title.Text = cfg.title or 'loader'
    title.TextColor3 = T.text
    title.TextSize = 14
    title.Font = 'SourceSansBold'
    title.TextXAlignment = 'Left'
    title.ZIndex = 12
    title.Parent = top

    local close = Instance.new('TextButton')
    close.Name = 'close'
    close.BackgroundTransparency = 1
    close.Position = UDim2.new(1, -28, 0, 4)
    close.Size = UDim2.fromOffset(20, 20)
    close.Text = 'x'
    close.TextColor3 = T.textDim
    close.TextSize = 16
    close.Font = 'SourceSansBold'
    close.ZIndex = 12
    close.Parent = top

    close.MouseEnter:Connect(function() tw(close, {TextColor3 = T.bad}, 0.15) end)
    close.MouseLeave:Connect(function() tw(close, {TextColor3 = T.textDim}, 0.15) end)
    close.MouseButton1Click:Connect(function() self:kill() end)

    local drag, dragStart, startPos
    top.InputBegan:Connect(function(io)
        if io.UserInputType == Enum.UserInputType.MouseButton1 then
            drag = true
            dragStart = Vector2.new(io.Position.X, io.Position.Y)
            startPos = main.Position
        end
    end)
    inputService.InputChanged:Connect(function(io)
        if drag and io.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = Vector2.new(io.Position.X, io.Position.Y) - dragStart
            main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    inputService.InputEnded:Connect(function(io)
        if io.UserInputType == Enum.UserInputType.MouseButton1 then drag = false end
    end)

    local content = Instance.new('Frame')
    content.Name = 'content'
    content.BackgroundTransparency = 1
    content.Position = UDim2.fromOffset(0, 28)
    content.Size = UDim2.new(1, 0, 1, -28)
    content.ZIndex = 11
    content.Parent = main

    local listPage = Instance.new('ScrollingFrame')
    listPage.Name = 'list'
    listPage.BackgroundTransparency = 1
    listPage.BorderSizePixel = 0
    listPage.Size = UDim2.fromScale(1, 1)
    listPage.CanvasSize = UDim2.fromOffset(0, 0)
    listPage.AutomaticCanvasSize = 'Y'
    listPage.ScrollBarThickness = 2
    listPage.ScrollBarImageColor3 = T.accent
    listPage.ZIndex = 12
    listPage.Parent = content
    self.listPage = listPage

    local listLayout = Instance.new('UIListLayout')
    listLayout.Padding = UDim.new(0, 6)
    listLayout.HorizontalAlignment = 'Center'
    listLayout.SortOrder = 'LayoutOrder'
    listLayout.Parent = listPage

    local listPad = Instance.new('UIPadding')
    listPad.PaddingTop = UDim.new(0, 8)
    listPad.PaddingBottom = UDim.new(0, 8)
    listPad.PaddingLeft = UDim.new(0, 8)
    listPad.PaddingRight = UDim.new(0, 8)
    listPad.Parent = listPage

    local loadPage = Instance.new('Frame')
    loadPage.Name = 'load'
    loadPage.BackgroundTransparency = 1
    loadPage.Size = UDim2.fromScale(1, 1)
    loadPage.Visible = false
    loadPage.ZIndex = 12
    loadPage.Parent = content
    self.loadPage = loadPage

    local loadCenter = Instance.new('Frame')
    loadCenter.BackgroundTransparency = 1
    loadCenter.AnchorPoint = Vector2.new(0.5, 0.5)
    loadCenter.Position = UDim2.fromScale(0.5, 0.45)
    loadCenter.Size = UDim2.fromOffset(200, 80)
    loadCenter.ZIndex = 13
    loadCenter.Parent = loadPage

    local loadText = Instance.new('TextLabel')
    loadText.BackgroundTransparency = 1
    loadText.Size = UDim2.new(1, 0, 0, 20)
    loadText.Text = 'loading...'
    loadText.TextColor3 = T.text
    loadText.TextSize = 14
    loadText.Font = 'SourceSans'
    loadText.ZIndex = 14
    loadText.Parent = loadCenter
    self.loadText = loadText

    local barBg = Instance.new('Frame')
    barBg.BackgroundColor3 = T.surface
    barBg.BorderSizePixel = 0
    barBg.Position = UDim2.fromOffset(20, 32)
    barBg.Size = UDim2.new(1, -40, 0, 4)
    barBg.ZIndex = 14
    barBg.Parent = loadCenter

    local barFill = Instance.new('Frame')
    barFill.BackgroundColor3 = T.accent
    barFill.BorderSizePixel = 0
    barFill.Size = UDim2.fromScale(0, 1)
    barFill.ZIndex = 15
    barFill.Parent = barBg
    self.barFill = barFill

    local loadSub = Instance.new('TextLabel')
    loadSub.BackgroundTransparency = 1
    loadSub.Position = UDim2.fromOffset(0, 44)
    loadSub.Size = UDim2.new(1, 0, 0, 16)
    loadSub.Text = ''
    loadSub.TextColor3 = T.textDim
    loadSub.TextSize = 12
    loadSub.Font = 'SourceSans'
    loadSub.ZIndex = 14
    loadSub.Parent = loadCenter
    self.loadSub = loadSub

    local bottom = Instance.new('Frame')
    bottom.Name = 'bottom'
    bottom.BackgroundColor3 = T.surface
    bottom.BorderSizePixel = 0
    bottom.Position = UDim2.new(0, 0, 1, -24)
    bottom.Size = UDim2.new(1, 0, 0, 24)
    bottom.ZIndex = 11
    bottom.Parent = main

    local botStroke = Instance.new('UIStroke')
    botStroke.Color = T.border
    botStroke.Thickness = 1
    botStroke.Parent = bottom

    local themeBtn = Instance.new('TextButton')
    themeBtn.BackgroundTransparency = 1
    themeBtn.Position = UDim2.fromOffset(8, 2)
    themeBtn.Size = UDim2.fromOffset(50, 20)
    themeBtn.Text = 'theme'
    themeBtn.TextColor3 = T.textDim
    themeBtn.TextSize = 12
    themeBtn.Font = 'SourceSans'
    themeBtn.ZIndex = 12
    themeBtn.Parent = bottom

    local themeList = Instance.new('Frame')
    themeList.BackgroundColor3 = T.surface
    themeList.BorderSizePixel = 0
    themeList.Position = UDim2.fromOffset(8, -100)
    themeList.Size = UDim2.fromOffset(80, 96)
    themeList.Visible = false
    themeList.ZIndex = 100
    themeList.Parent = bottom

    local themeStroke = Instance.new('UIStroke')
    themeStroke.Color = T.border
    themeStroke.Thickness = 1
    themeStroke.Parent = themeList

    local themeLayout = Instance.new('UIListLayout')
    themeLayout.Padding = UDim.new(0, 2)
    themeLayout.Parent = themeList

    local themePad = Instance.new('UIPadding')
    themePad.PaddingTop = UDim.new(0, 4)
    themePad.PaddingLeft = UDim.new(0, 4)
    themePad.PaddingRight = UDim.new(0, 4)
    themePad.PaddingBottom = UDim.new(0, 4)
    themePad.Parent = themeList

    for name, _ in pairs(themes) do
        local btn = Instance.new('TextButton')
        btn.BackgroundColor3 = T.bg
        btn.BorderSizePixel = 0
        btn.Size = UDim2.new(1, 0, 0, 20)
        btn.Text = name
        btn.TextColor3 = T.text
        btn.TextSize = 12
        btn.Font = 'SourceSans'
        btn.ZIndex = 101
        btn.Parent = themeList
        btn.MouseEnter:Connect(function() tw(btn, {BackgroundColor3 = T.surfaceHover}, 0.15) end)
        btn.MouseLeave:Connect(function() tw(btn, {BackgroundColor3 = T.bg}, 0.15) end)
        btn.MouseButton1Click:Connect(function()
            self:setTheme(name)
            themeList.Visible = false
        end)
    end

    themeBtn.MouseButton1Click:Connect(function()
        themeList.Visible = not themeList.Visible
    end)

    local ver = Instance.new('TextLabel')
    ver.BackgroundTransparency = 1
    ver.Position = UDim2.new(1, -80, 0, 2)
    ver.Size = UDim2.fromOffset(72, 20)
    ver.Text = cfg.version or 'v1.0'
    ver.TextColor3 = T.textDim
    ver.TextSize = 11
    ver.Font = 'SourceSans'
    ver.TextXAlignment = 'Right'
    ver.ZIndex = 12
    ver.Parent = bottom

    function self:addGame(data)
        table.insert(self.games, data)
        self:buildCard(data)
    end

    function self:buildCard(data)
        local card = Instance.new('TextButton')
        card.Name = data.name
        card.BackgroundColor3 = T.surface
        card.BorderSizePixel = 0
        card.Size = UDim2.new(1, -4, 0, 48)
        card.Text = ''
        card.ZIndex = 13
        card.Parent = self.listPage

        local cs = Instance.new('UIStroke')
        cs.Color = T.border
        cs.Thickness = 1
        cs.Parent = card

        local dot = Instance.new('Frame')
        dot.BackgroundColor3 = data.status == 'up' and T.good or data.status == 'down' and T.bad or T.warn
        dot.BorderSizePixel = 0
        dot.Position = UDim2.fromOffset(12, 19)
        dot.Size = UDim2.fromOffset(6, 6)
        dot.ZIndex = 14
        dot.Parent = card
        Instance.new('UICorner', dot).CornerRadius = UDim.new(1, 0)

        local name = Instance.new('TextLabel')
        name.BackgroundTransparency = 1
        name.Position = UDim2.fromOffset(26, 4)
        name.Size = UDim2.new(1, -36, 0, 20)
        name.Text = data.name
        name.TextColor3 = T.text
        name.TextSize = 14
        name.Font = 'SourceSansBold'
        name.TextXAlignment = 'Left'
        name.ZIndex = 14
        name.Parent = card

        local status = Instance.new('TextLabel')
        status.BackgroundTransparency = 1
        status.Position = UDim2.fromOffset(26, 24)
        status.Size = UDim2.new(1, -36, 0, 16)
        status.Text = data.status or 'unknown'
        status.TextColor3 = data.status == 'up' and T.good or data.status == 'down' and T.bad or T.warn
        status.TextSize = 11
        status.Font = 'SourceSans'
        status.TextXAlignment = 'Left'
        status.ZIndex = 14
        status.Parent = card

        local arrow = Instance.new('TextLabel')
        arrow.BackgroundTransparency = 1
        arrow.Position = UDim2.new(1, -24, 0, 14)
        arrow.Size = UDim2.fromOffset(16, 20)
        arrow.Text = '>'
        arrow.TextColor3 = T.textDim
        arrow.TextSize = 14
        arrow.Font = 'SourceSansBold'
        arrow.ZIndex = 14
        arrow.Parent = card

        card.MouseEnter:Connect(function()
            tw(card, {BackgroundColor3 = T.surfaceHover}, 0.15)
            tw(cs, {Color = T.borderHover}, 0.15)
            tw(arrow, {TextColor3 = T.accent}, 0.15)
        end)
        card.MouseLeave:Connect(function()
            tw(card, {BackgroundColor3 = T.surface}, 0.15)
            tw(cs, {Color = T.border}, 0.15)
            tw(arrow, {TextColor3 = T.textDim}, 0.15)
        end)
        card.MouseButton1Click:Connect(function()
            self:selectGame(data)
        end)
    end

    function self:selectGame(data)
        self.selected = data
        self:showLoad(data)
    end

    function self:showLoad(data)
        self.loading = true
        self.listPage.Visible = false
        self.loadPage.Visible = true
        self.loadText.Text = 'loading...'
        self.loadSub.Text = ''
        self.barFill.Size = UDim2.fromScale(0, 1)

        local steps = {'connecting', 'fetching assets', 'finalizing'}

        for i, step in ipairs(steps) do
            if not self.loading then return end
            task.wait(0.4 + math.random() * 0.3)
            if not self.loading then return end
            self.loadSub.Text = step .. '...'
            tw(self.barFill, {Size = UDim2.fromScale(i / #steps, 1)}, 0.3)
        end

        task.wait(0.3)
        if not self.loading then return end

        tw(self.barFill, {Size = UDim2.fromScale(1, 1)}, 0.2)

        task.wait(0.5)
        if not self.loading then return end

        self:fire('loaded', data)
        self.loading = false
    end

    function self:showList()
        self.listPage.Visible = true
        self.loadPage.Visible = false
    end

    function self:setTheme(name)
        if not themes[name] then return end
        T = themes[name]
        local oldGames = {}
        for _, g in ipairs(self.games) do table.insert(oldGames, g) end
        self:kill(false)
        local new = ui.newLauncher({theme = name, title = cfg.title, version = cfg.version})
        for _, g in ipairs(oldGames) do new:addGame(g) end
        return new
    end

    function self:fire(event, ...)
        if self._binds and self._binds[event] then
            task.spawn(self._binds[event], ...)
        end
    end

    function self:bind(event, fn)
        self._binds = self._binds or {}
        self._binds[event] = fn
    end

    function self:kill(animate)
        animate = animate ~= false
        if not self.main then return end
        if animate then
            tw(self.main:FindFirstChildOfClass('UIScale'), {Scale = 0.9}, 0.2)
            local con = renderService.RenderStepped:Connect(function(dt)
                for _, v in ipairs(self.main:GetDescendants()) do
                    if v:IsA('GuiObject') then
                        v.BackgroundTransparency = math.min(1, v.BackgroundTransparency + dt * 6)
                        if v:IsA('TextLabel') or v:IsA('TextButton') then
                            v.TextTransparency = math.min(1, v.TextTransparency + dt * 6)
                        end
                        if v:IsA('ImageLabel') then
                            v.ImageTransparency = math.min(1, v.ImageTransparency + dt * 6)
                        end
                    end
                end
            end)
            task.delay(0.4, function()
                con:Disconnect()
                self.main:Destroy()
            end)
        else
            self.main:Destroy()
        end
    end

    return self
end

return ui
