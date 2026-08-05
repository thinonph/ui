local inputService = game:GetService('UserInputService')
local renderService = game:GetService('RunService')
local tweenService = game:GetService('TweenService')
local guiService = game:GetService('GuiService')

-- tween helper
local function tween(object, shit, duration, style) 
    local styleEnum = Enum.EasingStyle
    local dirEnum = Enum.EasingDirection
    local direction = dirEnum.Out
    local styles = {styleEnum.Exponential, styleEnum.Linear}
    local tweenInfo = TweenInfo.new(duration, styles[style or 1], direction)
    local t = tweenService:Create(object, tweenInfo, shit)
    t:Play()
    return t 
end

-- themes
local themes = {
    default = {
        Primary = Color3.fromRGB(38, 233, 195);
        Secondary = Color3.fromRGB(233, 38, 115);
        Window1 = Color3.fromRGB(30, 30, 35);
        Window2 = Color3.fromRGB(20, 20, 25);
        Window3 = Color3.fromRGB(25, 25, 30);
        Button1 = Color3.fromRGB(35, 35, 40);
        Button2 = Color3.fromRGB(45, 45, 50);
        Button3 = Color3.fromRGB(65, 65, 70);
        Button4 = Color3.fromRGB(75, 75, 80);
        Stroke = Color3.fromRGB(50, 50, 55);
        StrokeHover = Color3.fromRGB(70, 70, 75);
        Inset1 = Color3.fromRGB(20, 20, 25);
        Inset2 = Color3.fromRGB(10, 10, 15);
        Inset3 = Color3.fromRGB(15, 15, 20);
        TextPrimary = Color3.fromRGB(255, 255, 255);
        TextStroke = Color3.fromRGB(0, 0, 0);
        TextDim = Color3.fromRGB(164, 164, 164);
    },
    cherry = {
        Primary = Color3.fromRGB(249, 22, 52);
        Secondary = Color3.fromRGB(247, 22, 149);
        Window1 = Color3.fromRGB(11, 11, 11);
        Window2 = Color3.fromRGB(5, 5, 5);
        Window3 = Color3.fromRGB(8, 8, 8);
        Button1 = Color3.fromRGB(12, 12, 12);
        Button2 = Color3.fromRGB(15, 15, 15);
        Button3 = Color3.fromRGB(21, 21, 21);
        Button4 = Color3.fromRGB(24, 24, 24);
        Stroke = Color3.fromRGB(30, 30, 30);
        StrokeHover = Color3.fromRGB(83, 23, 31);
        Inset1 = Color3.fromRGB(3, 3, 3);
        Inset2 = Color3.fromRGB(1, 1, 1);
        Inset3 = Color3.fromRGB(2, 2, 2);
        TextPrimary = Color3.fromRGB(255, 255, 255);
        TextStroke = Color3.fromRGB(0, 0, 0);
        TextDim = Color3.fromRGB(164, 164, 164);
    },
    orange = {
        Primary = Color3.fromRGB(244, 148, 22);
        Secondary = Color3.fromRGB(247, 37, 22);
        Window1 = Color3.fromRGB(20, 20, 22);
        Window2 = Color3.fromRGB(10, 10, 12);
        Window3 = Color3.fromRGB(15, 15, 17);
        Button1 = Color3.fromRGB(18, 18, 20);
        Button2 = Color3.fromRGB(20, 20, 22);
        Button3 = Color3.fromRGB(28, 28, 30);
        Button4 = Color3.fromRGB(30, 30, 32);
        Stroke = Color3.fromRGB(60, 60, 60);
        StrokeHover = Color3.fromRGB(110, 110, 110);
        Inset1 = Color3.fromRGB(10, 10, 12);
        Inset2 = Color3.fromRGB(0, 0, 2);
        Inset3 = Color3.fromRGB(5, 5, 7);
        TextPrimary = Color3.fromRGB(255, 255, 255);
        TextStroke = Color3.fromRGB(0, 0, 0);
        TextDim = Color3.fromRGB(192, 192, 192);
    },
    lemon = {
        Primary = Color3.fromRGB(220, 255, 66);
        Secondary = Color3.fromRGB(232, 173, 25);
        Window1 = Color3.fromRGB(30, 30, 30);
        Window2 = Color3.fromRGB(20, 20, 20);
        Window3 = Color3.fromRGB(25, 25, 25);
        Button1 = Color3.fromRGB(35, 35, 35);
        Button2 = Color3.fromRGB(40, 40, 40);
        Button3 = Color3.fromRGB(50, 50, 50);
        Button4 = Color3.fromRGB(55, 55, 55);
        Stroke = Color3.fromRGB(55, 55, 55);
        StrokeHover = Color3.fromRGB(80, 80, 80);
        Inset1 = Color3.fromRGB(18, 18, 18);
        Inset2 = Color3.fromRGB(8, 8, 8);
        Inset3 = Color3.fromRGB(13, 13, 13);
        TextPrimary = Color3.fromRGB(255, 255, 255);
        TextStroke = Color3.fromRGB(0, 0, 0);
        TextDim = Color3.fromRGB(192, 192, 192);
    },
    lime = {
        Primary = Color3.fromRGB(33, 255, 120);
        Secondary = Color3.fromRGB(120, 255, 33);
        Window1 = Color3.fromRGB(30, 30, 32);
        Window2 = Color3.fromRGB(24, 24, 26);
        Window3 = Color3.fromRGB(28, 28, 30);
        Button1 = Color3.fromRGB(36, 36, 38);
        Button2 = Color3.fromRGB(40, 40, 42);
        Button3 = Color3.fromRGB(46, 46, 48);
        Button4 = Color3.fromRGB(50, 50, 52);
        Stroke = Color3.fromRGB(60, 60, 60);
        StrokeHover = Color3.fromRGB(110, 110, 110);
        Inset1 = Color3.fromRGB(20, 20, 22);
        Inset2 = Color3.fromRGB(14, 14, 16);
        Inset3 = Color3.fromRGB(18, 18, 20);
        TextPrimary = Color3.fromRGB(255, 255, 255);
        TextStroke = Color3.fromRGB(0, 0, 0);
        TextDim = Color3.fromRGB(192, 192, 192);
    },
    raspberry = {
        Primary = Color3.fromRGB(0, 190, 255);
        Secondary = Color3.fromRGB(0, 255, 190);
        Window1 = Color3.fromRGB(25, 25, 27);
        Window2 = Color3.fromRGB(19, 19, 21);
        Window3 = Color3.fromRGB(23, 23, 25);
        Button1 = Color3.fromRGB(24, 24, 26);
        Button2 = Color3.fromRGB(28, 28, 30);
        Button3 = Color3.fromRGB(34, 40, 42);
        Button4 = Color3.fromRGB(38, 44, 46);
        Stroke = Color3.fromRGB(60, 60, 60);
        StrokeHover = Color3.fromRGB(110, 110, 110);
        Inset1 = Color3.fromRGB(20, 20, 22);
        Inset2 = Color3.fromRGB(14, 14, 16);
        Inset3 = Color3.fromRGB(18, 18, 20);
        TextPrimary = Color3.fromRGB(255, 255, 255);
        TextStroke = Color3.fromRGB(0, 0, 0);
        TextDim = Color3.fromRGB(192, 192, 192);
    },
    blueberry = {
        Primary = Color3.fromRGB(91, 77, 249);
        Secondary = Color3.fromRGB(130, 76, 247);
        Window1 = Color3.fromRGB(20, 20, 23);
        Window2 = Color3.fromRGB(12, 12, 15);
        Window3 = Color3.fromRGB(15, 15, 18);
        Button1 = Color3.fromRGB(18, 18, 21);
        Button2 = Color3.fromRGB(21, 21, 24);
        Button3 = Color3.fromRGB(38, 38, 41);
        Button4 = Color3.fromRGB(41, 41, 44);
        Stroke = Color3.fromRGB(50, 50, 53);
        StrokeHover = Color3.fromRGB(60, 60, 63);
        Inset1 = Color3.fromRGB(15, 15, 18);
        Inset2 = Color3.fromRGB(7, 7, 10);
        Inset3 = Color3.fromRGB(13, 13, 16);
        TextPrimary = Color3.fromRGB(255, 255, 255);
        TextStroke = Color3.fromRGB(0, 0, 0);
        TextDim = Color3.fromRGB(168, 168, 168);
    },
    grape = {
        Primary = Color3.fromRGB(134, 53, 255);
        Secondary = Color3.fromRGB(211, 53, 255);
        Window1 = Color3.fromRGB(20, 20, 20);
        Window2 = Color3.fromRGB(10, 10, 10);
        Window3 = Color3.fromRGB(15, 15, 15);
        Button1 = Color3.fromRGB(15, 15, 15);
        Button2 = Color3.fromRGB(20, 20, 20);
        Button3 = Color3.fromRGB(35, 35, 35);
        Button4 = Color3.fromRGB(40, 40, 40);
        Stroke = Color3.fromRGB(34, 34, 34);
        StrokeHover = Color3.fromRGB(89, 49, 150);
        Inset1 = Color3.fromRGB(5, 5, 5);
        Inset2 = Color3.fromRGB(0, 0, 0);
        Inset3 = Color3.fromRGB(3, 3, 3);
        TextPrimary = Color3.fromRGB(255, 255, 255);
        TextStroke = Color3.fromRGB(0, 0, 0);
        TextDim = Color3.fromRGB(74, 42, 122);
    }
}

local theme = themes.default

local function setTheme(name)
    if themes[name] then
        theme = themes[name]
    end
end

-- screen gui
local uiScreen = Instance.new('ScreenGui')
uiScreen.OnTopOfCoreBlur = true
uiScreen.DisplayOrder = 9e9
uiScreen.ZIndexBehavior = 'Global'
uiScreen.Name = 'GameLauncherUI'
if gethui then
    uiScreen.Parent = gethui()
else
    uiScreen.Parent = game:GetService('CoreGui')
end

-- base element
local baseElement = {}
baseElement.__index = baseElement
baseElement.bindToEvent = function(self, event, callback) 
    self.binds[event] = callback
    return self
end
baseElement.fireEvent = function(self, event, ...) 
    local t = self.binds[event]
    if t then task.spawn(t, ...) end
    return self
end
baseElement.name = ''

-- main launcher
local launcher = {}
launcher.__index = launcher
setmetatable(launcher, baseElement)

function launcher:init()
    self.instances = {}
    self.games = self.games or {}
    self.selectedGame = nil
    self.currentPage = 'games'
    self._dragging = false

    local instances = self.instances

    -- main frame
    local mainFrame = Instance.new('Frame')
    mainFrame.BackgroundColor3 = theme.Window2
    mainFrame.BorderSizePixel = 0
    mainFrame.Name = '#main'
    mainFrame.Position = UDim2.fromScale(0.5, 0.5)
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.Size = UDim2.fromOffset(700, 450)
    mainFrame.Visible = true
    mainFrame.ZIndex = 5
    mainFrame.Parent = uiScreen
    instances.mainFrame = mainFrame

    local scale = Instance.new('UIScale')
    scale.Scale = 1
    scale.Name = '#scale'
    scale.Parent = mainFrame
    instances.scale = scale

    local stroke = Instance.new('UIStroke')
    stroke.ApplyStrokeMode = 'Border'
    stroke.Color = theme.Stroke
    stroke.LineJoinMode = 'Round'
    stroke.Thickness = 1
    stroke.Parent = mainFrame

    local shadow = Instance.new('ImageLabel')
    shadow.AnchorPoint = Vector2.new(0.5, 0.5)
    shadow.BackgroundTransparency = 1
    shadow.BorderSizePixel = 0
    shadow.Image = 'rbxassetid://7331400934'
    shadow.ImageColor3 = Color3.fromRGB(0, 0, 5)
    shadow.Position = UDim2.fromScale(0.5, 0.5)
    shadow.ScaleType = 'Slice'
    shadow.Size = UDim2.new(1, 50, 1, 50)
    shadow.SliceCenter = Rect.new(40, 40, 260, 260)
    shadow.SliceScale = 1
    shadow.ZIndex = 4
    shadow.Parent = mainFrame

    -- top trim
    local trim = Instance.new('Frame')
    trim.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    trim.BorderSizePixel = 0
    trim.Position = UDim2.fromOffset(0, -1)
    trim.Size = UDim2.new(1, 0, 0, 2)
    trim.ZIndex = 64
    trim.Parent = mainFrame
    local trimGradient = Instance.new('UIGradient')
    trimGradient.Color = ColorSequence.new(theme.Primary, theme.Secondary)
    trimGradient.Parent = trim
    instances.trimGradient = trimGradient

    -- title bar
    local titleBar = Instance.new('Frame')
    titleBar.Active = true
    titleBar.BackgroundColor3 = theme.Window1
    titleBar.BorderColor3 = theme.Inset1
    titleBar.BorderMode = 'Inset'
    titleBar.BorderSizePixel = 1
    titleBar.ClipsDescendants = true
    titleBar.Size = UDim2.new(1, 0, 0, 32)
    titleBar.ZIndex = 50
    titleBar.Parent = mainFrame
    instances.titleBar = titleBar

    local titleStroke = Instance.new('UIStroke')
    titleStroke.ApplyStrokeMode = 'Border'
    titleStroke.Color = theme.Stroke
    titleStroke.LineJoinMode = 'Round'
    titleStroke.Thickness = 1
    titleStroke.Parent = titleBar

    -- close button
    local buttonClose = Instance.new('TextButton')
    buttonClose.AnchorPoint = Vector2.new(1, 0)
    buttonClose.AutoButtonColor = false
    buttonClose.BackgroundColor3 = theme.Button1
    buttonClose.BorderSizePixel = 0
    buttonClose.Position = UDim2.new(1, -4, 0, 4)
    buttonClose.Size = UDim2.fromOffset(24, 24)
    buttonClose.Text = ''
    buttonClose.ZIndex = 52
    buttonClose.Parent = titleBar
    local closeRound = Instance.new('UICorner')
    closeRound.CornerRadius = UDim.new(0, 4)
    closeRound.Parent = buttonClose
    local closeStroke = Instance.new('UIStroke')
    closeStroke.ApplyStrokeMode = 'Border'
    closeStroke.Color = theme.Stroke
    closeStroke.Parent = buttonClose
    local closeIcon = Instance.new('ImageLabel')
    closeIcon.BackgroundTransparency = 1
    closeIcon.Image = 'rbxassetid://9801460300'
    closeIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
    closeIcon.Size = UDim2.fromScale(1, 1)
    closeIcon.ZIndex = 52
    closeIcon.Parent = buttonClose

    buttonClose.MouseEnter:Connect(function()
        tween(buttonClose, {BackgroundColor3 = theme.Button2}, 0.2, 1)
        tween(closeStroke, {Color = theme.StrokeHover}, 0.2, 1)
    end)
    buttonClose.MouseLeave:Connect(function()
        tween(buttonClose, {BackgroundColor3 = theme.Button1}, 0.2, 1)
        tween(closeStroke, {Color = theme.Stroke}, 0.2, 1)
    end)
    buttonClose.MouseButton1Click:Connect(function()
        self:destroy()
    end)

    -- title
    local title = Instance.new('TextLabel')
    title.BackgroundTransparency = 1
    title.Font = 'RobotoCondensed'
    title.Position = UDim2.fromOffset(12, 0)
    title.Size = UDim2.new(1, -80, 1, 0)
    title.Text = 'Game Launcher'
    title.TextColor3 = theme.TextPrimary
    title.TextSize = 18
    title.TextStrokeColor3 = theme.TextStroke
    title.TextStrokeTransparency = 0.8
    title.TextXAlignment = 'Left'
    title.TextYAlignment = 'Center'
    title.ZIndex = 52
    title.Parent = titleBar
    instances.title = title

    -- sidebar
    local sideBar = Instance.new('Frame')
    sideBar.BackgroundColor3 = theme.Window3
    sideBar.BorderColor3 = theme.Inset3
    sideBar.BorderMode = 'Inset'
    sideBar.BorderSizePixel = 1
    sideBar.Position = UDim2.fromOffset(0, 32)
    sideBar.Size = UDim2.new(0, 140, 1, -32)
    sideBar.ZIndex = 50
    sideBar.Parent = mainFrame

    local sideStroke = Instance.new('UIStroke')
    sideStroke.ApplyStrokeMode = 'Border'
    sideStroke.Color = theme.Stroke
    sideStroke.Parent = sideBar

    -- sidebar buttons container
    local sideMenu = Instance.new('ScrollingFrame')
    sideMenu.AutomaticCanvasSize = 'Y'
    sideMenu.BackgroundTransparency = 1
    sideMenu.BorderSizePixel = 0
    sideMenu.Position = UDim2.fromOffset(4, 4)
    sideMenu.Size = UDim2.new(1, -8, 1, -8)
    sideMenu.ScrollBarThickness = 0
    sideMenu.ZIndex = 51
    sideMenu.Parent = sideBar

    local sideLayout = Instance.new('UIListLayout')
    sideLayout.FillDirection = 'Vertical'
    sideLayout.Padding = UDim.new(0, 6)
    sideLayout.SortOrder = 'LayoutOrder'
    sideLayout.Parent = sideMenu

    -- page region
    local pageRegion = Instance.new('Frame')
    pageRegion.BackgroundColor3 = theme.Window2
    pageRegion.BorderColor3 = theme.Inset2
    pageRegion.BorderMode = 'Inset'
    pageRegion.BorderSizePixel = 1
    pageRegion.ClipsDescendants = true
    pageRegion.Position = UDim2.new(0, 140, 0, 32)
    pageRegion.Size = UDim2.new(1, -140, 1, -32)
    pageRegion.ZIndex = 30
    pageRegion.Parent = mainFrame
    instances.pageRegion = pageRegion

    -- pages container
    local pages = Instance.new('Frame')
    pages.Name = '#pages'
    pages.BackgroundTransparency = 1
    pages.Size = UDim2.fromScale(1, 1)
    pages.Parent = pageRegion
    instances.pages = pages

    -- GAMES PAGE
    local gamesPage = Instance.new('ScrollingFrame')
    gamesPage.Name = 'Games'
    gamesPage.BackgroundTransparency = 1
    gamesPage.BorderSizePixel = 0
    gamesPage.Position = UDim2.fromOffset(0, 0)
    gamesPage.Size = UDim2.fromScale(1, 1)
    gamesPage.CanvasSize = UDim2.fromOffset(0, 0)
    gamesPage.AutomaticCanvasSize = 'Y'
    gamesPage.ScrollBarThickness = 2
    gamesPage.ScrollBarImageColor3 = theme.Primary
    gamesPage.ZIndex = 31
    gamesPage.Parent = pages

    local gamesLayout = Instance.new('UIGridLayout')
    gamesLayout.CellSize = UDim2.fromOffset(200, 120)
    gamesLayout.CellPadding = UDim2.fromOffset(12, 12)
    gamesLayout.FillDirection = 'Horizontal'
    gamesLayout.HorizontalAlignment = 'Center'
    gamesLayout.SortOrder = 'LayoutOrder'
    gamesLayout.StartCorner = 'TopLeft'
    gamesLayout.Parent = gamesPage

    local gamesPadding = Instance.new('UIPadding')
    gamesPadding.PaddingTop = UDim.new(0, 12)
    gamesPadding.PaddingBottom = UDim.new(0, 12)
    gamesPadding.PaddingLeft = UDim.new(0, 12)
    gamesPadding.PaddingRight = UDim.new(0, 12)
    gamesPadding.Parent = gamesPage

    instances.gamesPage = gamesPage
    instances.gamesLayout = gamesLayout

    -- GAME DETAILS PAGE
    local detailsPage = Instance.new('Frame')
    detailsPage.Name = 'Details'
    detailsPage.BackgroundTransparency = 1
    detailsPage.Size = UDim2.fromScale(1, 1)
    detailsPage.Visible = false
    detailsPage.ZIndex = 31
    detailsPage.Parent = pages
    instances.detailsPage = detailsPage

    local detailsContent = Instance.new('Frame')
    detailsContent.Name = '#content'
    detailsContent.BackgroundTransparency = 1
    detailsContent.Size = UDim2.new(1, -24, 1, -24)
    detailsContent.Position = UDim2.fromOffset(12, 12)
    detailsContent.ZIndex = 32
    detailsContent.Parent = detailsPage
    instances.detailsContent = detailsContent

    -- back button
    local backBtn = Instance.new('TextButton')
    backBtn.Name = '#back'
    backBtn.AutoButtonColor = false
    backBtn.BackgroundColor3 = theme.Button1
    backBtn.BorderSizePixel = 0
    backBtn.Size = UDim2.fromOffset(80, 28)
    backBtn.Text = '< Back'
    backBtn.TextColor3 = theme.TextPrimary
    backBtn.TextSize = 14
    backBtn.Font = 'SourceSans'
    backBtn.ZIndex = 33
    backBtn.Parent = detailsContent
    local backRound = Instance.new('UICorner')
    backRound.CornerRadius = UDim.new(0, 4)
    backRound.Parent = backBtn
    local backStroke = Instance.new('UIStroke')
    backStroke.Color = theme.Stroke
    backStroke.Parent = backBtn

    backBtn.MouseEnter:Connect(function()
        tween(backBtn, {BackgroundColor3 = theme.Button2}, 0.2, 1)
        tween(backStroke, {Color = theme.StrokeHover}, 0.2, 1)
    end)
    backBtn.MouseLeave:Connect(function()
        tween(backBtn, {BackgroundColor3 = theme.Button1}, 0.2, 1)
        tween(backStroke, {Color = theme.Stroke}, 0.2, 1)
    end)
    backBtn.MouseButton1Click:Connect(function()
        self:showPage('games')
    end)

    -- game title in details
    local detailTitle = Instance.new('TextLabel')
    detailTitle.Name = '#title'
    detailTitle.BackgroundTransparency = 1
    detailTitle.Position = UDim2.fromOffset(0, 36)
    detailTitle.Size = UDim2.new(1, 0, 0, 28)
    detailTitle.Text = 'Select a Game'
    detailTitle.TextColor3 = theme.TextPrimary
    detailTitle.TextSize = 22
    detailTitle.Font = 'RobotoCondensed'
    detailTitle.TextXAlignment = 'Left'
    detailTitle.ZIndex = 33
    detailTitle.Parent = detailsContent
    instances.detailTitle = detailTitle

    -- game status label
    local detailStatus = Instance.new('TextLabel')
    detailStatus.Name = '#status'
    detailStatus.BackgroundTransparency = 1
    detailStatus.Position = UDim2.fromOffset(0, 64)
    detailStatus.Size = UDim2.new(1, 0, 0, 20)
    detailStatus.Text = ''
    detailStatus.TextColor3 = theme.TextDim
    detailStatus.TextSize = 14
    detailStatus.TextXAlignment = 'Left'
    detailStatus.ZIndex = 33
    detailStatus.Parent = detailsContent
    instances.detailStatus = detailStatus

    -- game description
    local detailDesc = Instance.new('TextLabel')
    detailDesc.Name = '#desc'
    detailDesc.BackgroundTransparency = 1
    detailDesc.Position = UDim2.fromOffset(0, 90)
    detailDesc.Size = UDim2.new(1, 0, 0, 60)
    detailDesc.Text = ''
    detailDesc.TextColor3 = theme.TextPrimary
    detailDesc.TextSize = 14
    detailDesc.TextWrapped = true
    detailDesc.TextXAlignment = 'Left'
    detailDesc.TextYAlignment = 'Top'
    detailDesc.ZIndex = 33
    detailDesc.Parent = detailsContent
    instances.detailDesc = detailDesc

    -- start button
    local startBtn = Instance.new('TextButton')
    startBtn.Name = '#start'
    startBtn.AutoButtonColor = false
    startBtn.BackgroundColor3 = theme.Button3
    startBtn.BorderSizePixel = 0
    startBtn.Position = UDim2.new(0, 0, 1, -48)
    startBtn.Size = UDim2.new(1, 0, 0, 44)
    startBtn.Text = 'START GAME'
    startBtn.TextColor3 = theme.TextPrimary
    startBtn.TextSize = 16
    startBtn.Font = 'RobotoCondensed'
    startBtn.ZIndex = 33
    startBtn.Parent = detailsContent
    local startRound = Instance.new('UICorner')
    startRound.CornerRadius = UDim.new(0, 6)
    startRound.Parent = startBtn
    local startStroke = Instance.new('UIStroke')
    startStroke.Color = theme.Stroke
    startStroke.Thickness = 1
    startStroke.Parent = startBtn

    local startTrim = Instance.new('Frame')
    startTrim.BackgroundColor3 = theme.Primary
    startTrim.BorderSizePixel = 0
    startTrim.Position = UDim2.fromOffset(0, 0)
    startTrim.Size = UDim2.new(0, 0, 0, 2)
    startTrim.ZIndex = 34
    startTrim.Parent = startBtn
    instances.startTrim = startTrim

    startBtn.MouseEnter:Connect(function()
        tween(startBtn, {BackgroundColor3 = theme.Button4}, 0.2, 1)
        tween(startStroke, {Color = theme.StrokeHover}, 0.2, 1)
        tween(startTrim, {Size = UDim2.new(1, 0, 0, 2)}, 0.3, 1)
    end)
    startBtn.MouseLeave:Connect(function()
        tween(startBtn, {BackgroundColor3 = theme.Button3}, 0.2, 1)
        tween(startStroke, {Color = theme.Stroke}, 0.2, 1)
        tween(startTrim, {Size = UDim2.new(0, 0, 0, 2)}, 0.3, 1)
    end)
    startBtn.MouseButton1Click:Connect(function()
        if self.selectedGame then
            self:fireEvent('onStart', self.selectedGame)
        end
    end)
    instances.startBtn = startBtn

    -- THEME PAGE
    local themePage = Instance.new('ScrollingFrame')
    themePage.Name = 'Themes'
    themePage.BackgroundTransparency = 1
    themePage.BorderSizePixel = 0
    themePage.Size = UDim2.fromScale(1, 1)
    themePage.CanvasSize = UDim2.fromOffset(0, 0)
    themePage.AutomaticCanvasSize = 'Y'
    themePage.ScrollBarThickness = 2
    themePage.ScrollBarImageColor3 = theme.Primary
    themePage.ZIndex = 31
    themePage.Visible = false
    themePage.Parent = pages

    local themeLayout = Instance.new('UIListLayout')
    themeLayout.FillDirection = 'Vertical'
    themeLayout.Padding = UDim.new(0, 8)
    themeLayout.HorizontalAlignment = 'Center'
    themeLayout.SortOrder = 'LayoutOrder'
    themeLayout.Parent = themePage

    local themePadding = Instance.new('UIPadding')
    themePadding.PaddingTop = UDim.new(0, 12)
    themePadding.PaddingLeft = UDim.new(0, 12)
    themePadding.PaddingRight = UDim.new(0, 12)
    themePadding.Parent = themePage

    instances.themePage = themePage

    -- SETTINGS PAGE
    local settingsPage = Instance.new('ScrollingFrame')
    settingsPage.Name = 'Settings'
    settingsPage.BackgroundTransparency = 1
    settingsPage.BorderSizePixel = 0
    settingsPage.Size = UDim2.fromScale(1, 1)
    settingsPage.CanvasSize = UDim2.fromOffset(0, 0)
    settingsPage.AutomaticCanvasSize = 'Y'
    settingsPage.ScrollBarThickness = 2
    settingsPage.ScrollBarImageColor3 = theme.Primary
    settingsPage.ZIndex = 31
    settingsPage.Visible = false
    settingsPage.Parent = pages

    local settingsLayout = Instance.new('UIListLayout')
    settingsLayout.FillDirection = 'Vertical'
    settingsLayout.Padding = UDim.new(0, 8)
    settingsLayout.HorizontalAlignment = 'Center'
    settingsLayout.SortOrder = 'LayoutOrder'
    settingsLayout.Parent = settingsPage

    local settingsPadding = Instance.new('UIPadding')
    settingsPadding.PaddingTop = UDim.new(0, 12)
    settingsPadding.PaddingLeft = UDim.new(0, 12)
    settingsPadding.PaddingRight = UDim.new(0, 12)
    settingsPadding.Parent = settingsPage

    instances.settingsPage = settingsPage

    self:buildSidebar(sideMenu)
    self:buildThemeButtons()

    -- dragging
    local dCon, aCon
    local targetPos

    titleBar.InputBegan:Connect(function(io) 
        if io.UserInputType == Enum.UserInputType.MouseButton1 then
            self._dragging = true
            local rootPos = mainFrame.AbsolutePosition
            local startPos = Vector2.new(io.Position.X, io.Position.Y)
            targetPos = UDim2.fromOffset(rootPos.X, rootPos.Y)
            aCon = renderService.RenderStepped:Connect(function(dt) 
                if not self._dragging then return end
                mainFrame.Position = mainFrame.Position:lerp(targetPos, 1 - 1e-12^dt)
            end)
            dCon = inputService.InputChanged:Connect(function(io) 
                if io.UserInputType == Enum.UserInputType.MouseMovement and self._dragging then
                    local curPos = Vector2.new(io.Position.X, io.Position.Y)
                    local dest = rootPos + (curPos - startPos)
                    targetPos = UDim2.fromOffset(dest.X, dest.Y)
                end
            end)
        end
    end)

    local function endDrag()
        if self._dragging then
            self._dragging = false
            if dCon then dCon:Disconnect() end
            if aCon then aCon:Disconnect() end
            tween(mainFrame, {Position = targetPos}, 0.2, 1)
        end
    end

    titleBar.InputEnded:Connect(function(io)
        if io.UserInputType == Enum.UserInputType.MouseButton1 then
            endDrag()
        end
    end)

    -- open anim
    mainFrame.Size = UDim2.fromOffset(700, 40)
    tween(mainFrame, {Size = UDim2.fromOffset(700, 450)}, 0.5, 1)

    return self
end

function launcher:buildSidebar(container)
    self._sidebarButtons = {}
    local buttons = {
        {text = 'Games', page = 'games'},
        {text = 'Themes', page = 'themes'},
        {text = 'Settings', page = 'settings'}
    }

    for idx, btnData in ipairs(buttons) do
        local btn = Instance.new('TextButton')
        btn.Name = btnData.text
        btn.AutoButtonColor = false
        btn.BackgroundColor3 = idx == 1 and theme.Button3 or theme.Button1
        btn.BorderSizePixel = 0
        btn.Size = UDim2.new(1, -8, 0, 32)
        btn.Text = ''
        btn.ZIndex = 52
        btn.Parent = container

        local round = Instance.new('UICorner')
        round.CornerRadius = UDim.new(0, 4)
        round.Parent = btn

        local stroke = Instance.new('UIStroke')
        stroke.Color = idx == 1 and theme.Primary or theme.Stroke
        stroke.Parent = btn

        local label = Instance.new('TextLabel')
        label.BackgroundTransparency = 1
        label.Position = UDim2.fromOffset(10, 0)
        label.Size = UDim2.new(1, -20, 1, 0)
        label.Text = btnData.text
        label.TextColor3 = idx == 1 and theme.Primary or theme.TextPrimary
        label.TextSize = 15
        label.Font = 'SourceSans'
        label.TextXAlignment = 'Left'
        label.TextYAlignment = 'Center'
        label.ZIndex = 53
        label.Parent = btn

        table.insert(self._sidebarButtons, {button = btn, stroke = stroke, label = label, page = btnData.page})

        btn.MouseEnter:Connect(function()
            tween(btn, {BackgroundColor3 = theme.Button2}, 0.2, 1)
            tween(stroke, {Color = theme.StrokeHover}, 0.2, 1)
            tween(label, {TextColor3 = theme.Primary}, 0.2, 1)
        end)
        btn.MouseLeave:Connect(function()
            if self.currentPage ~= btnData.page then
                tween(btn, {BackgroundColor3 = theme.Button1}, 0.2, 1)
                tween(stroke, {Color = theme.Stroke}, 0.2, 1)
                tween(label, {TextColor3 = theme.TextPrimary}, 0.2, 1)
            end
        end)
        btn.MouseButton1Click:Connect(function()
            self:showPage(btnData.page)
        end)
    end
end

function launcher:updateSidebarActive()
    if not self._sidebarButtons then return end
    for _, data in ipairs(self._sidebarButtons) do
        if data.page == self.currentPage then
            tween(data.button, {BackgroundColor3 = theme.Button3}, 0.2, 1)
            tween(data.stroke, {Color = theme.Primary}, 0.2, 1)
            tween(data.label, {TextColor3 = theme.Primary}, 0.2, 1)
        else
            tween(data.button, {BackgroundColor3 = theme.Button1}, 0.2, 1)
            tween(data.stroke, {Color = theme.Stroke}, 0.2, 1)
            tween(data.label, {TextColor3 = theme.TextPrimary}, 0.2, 1)
        end
    end
end

function launcher:buildThemeButtons()
    local container = self.instances.themePage
    for name, th in pairs(themes) do
        local btn = Instance.new('TextButton')
        btn.Name = name
        btn.AutoButtonColor = false
        btn.BackgroundColor3 = theme.Button1
        btn.BorderSizePixel = 0
        btn.Size = UDim2.new(1, -16, 0, 40)
        btn.Text = ''
        btn.ZIndex = 32
        btn.Parent = container

        local round = Instance.new('UICorner')
        round.CornerRadius = UDim.new(0, 4)
        round.Parent = btn

        local stroke = Instance.new('UIStroke')
        stroke.Color = theme.Stroke
        stroke.Parent = btn

        local label = Instance.new('TextLabel')
        label.BackgroundTransparency = 1
        label.Position = UDim2.fromOffset(12, 0)
        label.Size = UDim2.new(1, -52, 1, 0)
        label.Text = name:upper()
        label.TextColor3 = theme.TextPrimary
        label.TextSize = 15
        label.Font = 'SourceSans'
        label.TextXAlignment = 'Left'
        label.TextYAlignment = 'Center'
        label.ZIndex = 33
        label.Parent = btn

        local preview = Instance.new('Frame')
        preview.BackgroundColor3 = th.Primary
        preview.BorderSizePixel = 0
        preview.Position = UDim2.new(1, -36, 0, 8)
        preview.Size = UDim2.fromOffset(24, 24)
        preview.ZIndex = 33
        preview.Parent = btn
        local previewRound = Instance.new('UICorner')
        previewRound.CornerRadius = UDim.new(1, 0)
        previewRound.Parent = preview

        btn.MouseEnter:Connect(function()
            tween(btn, {BackgroundColor3 = theme.Button2}, 0.2, 1)
            tween(stroke, {Color = theme.StrokeHover}, 0.2, 1)
        end)
        btn.MouseLeave:Connect(function()
            tween(btn, {BackgroundColor3 = theme.Button1}, 0.2, 1)
            tween(stroke, {Color = theme.Stroke}, 0.2, 1)
        end)
        btn.MouseButton1Click:Connect(function()
            self:setTheme(name)
        end)
    end
end

function launcher:showPage(pageName)
    self.currentPage = pageName
    local pages = self.instances.pages
    for _, child in ipairs(pages:GetChildren()) do
        if child:IsA('GuiObject') then
            child.Visible = (child.Name:lower() == pageName:lower())
        end
    end
    self:updateSidebarActive()
end

function launcher:setTheme(name)
    if not themes[name] then return end
    setTheme(name)
    local oldGames = {}
    for _, g in ipairs(self.games) do table.insert(oldGames, g) end
    local oldSelected = self.selectedGame
    self:destroy(false)
    self:init()
    self:loadGames(oldGames)
    if oldSelected then
        for _, g in ipairs(oldGames) do
            if g.name == oldSelected.name then
                self.selectedGame = g
                break
            end
        end
    end
    self:showPage(self.currentPage or 'games')
end

function launcher:addGame(gameData)
    table.insert(self.games, gameData)
    self:buildGameCard(gameData)
end

function launcher:loadGames(gamesList)
    self.games = gamesList or {}
    if self.instances and self.instances.gamesPage then
        for _, child in ipairs(self.instances.gamesPage:GetChildren()) do
            if child:IsA('TextButton') then
                child:Destroy()
            end
        end
        for _, gameData in ipairs(self.games) do
            self:buildGameCard(gameData)
        end
    end
end

function launcher:buildGameCard(gameData)
    local card = Instance.new('TextButton')
    card.Name = gameData.name or 'Game'
    card.AutoButtonColor = false
    card.BackgroundColor3 = theme.Button1
    card.BorderSizePixel = 0
    card.Size = UDim2.fromOffset(200, 120)
    card.Text = ''
    card.ZIndex = 32
    card.LayoutOrder = #self.instances.gamesPage:GetChildren()
    card.Parent = self.instances.gamesPage

    local round = Instance.new('UICorner')
    round.CornerRadius = UDim.new(0, 6)
    round.Parent = card

    local stroke = Instance.new('UIStroke')
    stroke.Color = theme.Stroke
    stroke.Thickness = 1
    stroke.Parent = card

    local icon = Instance.new('ImageLabel')
    icon.Name = '#icon'
    icon.BackgroundColor3 = theme.Window3
    icon.BorderSizePixel = 0
    icon.Position = UDim2.fromOffset(8, 8)
    icon.Size = UDim2.fromOffset(48, 48)
    icon.Image = gameData.icon or ''
    icon.ImageColor3 = theme.TextPrimary
    icon.ZIndex = 33
    icon.Parent = card
    local iconRound = Instance.new('UICorner')
    iconRound.CornerRadius = UDim.new(0, 4)
    iconRound.Parent = icon

    local statusDot = Instance.new('Frame')
    statusDot.Name = '#dot'
    statusDot.BackgroundColor3 = gameData.status == 'OP' and Color3.fromRGB(0, 255, 100) or 
                                 gameData.status == 'Updating' and Color3.fromRGB(255, 200, 0) or
                                 Color3.fromRGB(255, 50, 50)
    statusDot.BorderSizePixel = 0
    statusDot.Position = UDim2.new(1, -16, 0, 8)
    statusDot.Size = UDim2.fromOffset(8, 8)
    statusDot.ZIndex = 34
    statusDot.Parent = card
    local dotRound = Instance.new('UICorner')
    dotRound.CornerRadius = UDim.new(1, 0)
    dotRound.Parent = statusDot

    local nameLabel = Instance.new('TextLabel')
    nameLabel.Name = '#name'
    nameLabel.BackgroundTransparency = 1
    nameLabel.Position = UDim2.fromOffset(8, 64)
    nameLabel.Size = UDim2.new(1, -16, 0, 22)
    nameLabel.Text = gameData.name or 'Unknown'
    nameLabel.TextColor3 = theme.TextPrimary
    nameLabel.TextSize = 16
    nameLabel.Font = 'RobotoCondensed'
    nameLabel.TextXAlignment = 'Left'
    nameLabel.ZIndex = 33
    nameLabel.Parent = card

    local statusLabel = Instance.new('TextLabel')
    statusLabel.Name = '#status'
    statusLabel.BackgroundTransparency = 1
    statusLabel.Position = UDim2.fromOffset(8, 86)
    statusLabel.Size = UDim2.new(1, -16, 0, 18)
    statusLabel.Text = gameData.status or 'Unknown'
    statusLabel.TextColor3 = gameData.status == 'OP' and Color3.fromRGB(0, 255, 100) or 
                            gameData.status == 'Updating' and Color3.fromRGB(255, 200, 0) or
                            theme.TextDim
    statusLabel.TextSize = 13
    statusLabel.Font = 'SourceSans'
    statusLabel.TextXAlignment = 'Left'
    statusLabel.ZIndex = 33
    statusLabel.Parent = card

    card.MouseEnter:Connect(function()
        tween(card, {BackgroundColor3 = theme.Button2}, 0.2, 1)
        tween(stroke, {Color = theme.StrokeHover}, 0.2, 1)
    end)
    card.MouseLeave:Connect(function()
        tween(card, {BackgroundColor3 = theme.Button1}, 0.2, 1)
        tween(stroke, {Color = theme.Stroke}, 0.2, 1)
    end)
    card.MouseButton1Click:Connect(function()
        self:selectGame(gameData)
    end)
end

function launcher:selectGame(gameData)
    self.selectedGame = gameData
    self.instances.detailTitle.Text = gameData.name or 'Unknown'
    self.instances.detailStatus.Text = 'Status: ' .. (gameData.status or 'Unknown')
    self.instances.detailStatus.TextColor3 = gameData.status == 'OP' and Color3.fromRGB(0, 255, 100) or 
                                             gameData.status == 'Updating' and Color3.fromRGB(255, 200, 0) or
                                             Color3.fromRGB(255, 50, 50)
    self.instances.detailDesc.Text = gameData.description or 'No description available.'
    self:showPage('details')
end

function launcher:destroy(animate)
    animate = animate ~= false
    if not self.instances or not self.instances.mainFrame then return end

    local main = self.instances.mainFrame

    if animate then
        local bg = {}
        local img = {}
        local txt = {}
        local str = {}
        local d = main:GetDescendants()
        table.insert(d, main)
        for _, v in ipairs(d) do
            if v:IsA('Frame') or v:IsA('TextButton') then table.insert(bg, v) end
            if v:IsA('ImageLabel') or v:IsA('ImageButton') then table.insert(img, v) end
            if v:IsA('TextLabel') or v:IsA('TextBox') then table.insert(txt, v) end
            if v:IsA('UIStroke') then table.insert(str, v) end
        end
        local con = renderService.RenderStepped:Connect(function(dt)
            dt = dt * 8
            for _, v in ipairs(bg) do 
                if v and v.Parent then v.BackgroundTransparency = math.min(1, v.BackgroundTransparency + dt) end
            end
            for _, v in ipairs(img) do 
                if v and v.Parent then v.ImageTransparency = math.min(1, v.ImageTransparency + dt) end
            end
            for _, v in ipairs(txt) do 
                if v and v.Parent then v.TextTransparency = math.min(1, v.TextTransparency + dt) end
            end
            for _, v in ipairs(str) do 
                if v and v.Parent then v.Transparency = math.min(1, v.Transparency + dt) end
            end
        end)
        task.delay(0.5, function()
            con:Disconnect()
            if main and main.Parent then main:Destroy() end
        end)
    else
        main:Destroy()
    end

    self.instances = nil
    self._sidebarButtons = nil
end

-- constructor
local function newLauncher(settings)
    settings = settings or {}
    local self = setmetatable({}, launcher)
    self.binds = {}
    self.games = {}
    self.selectedGame = nil
    self.currentPage = 'games'
    self.instances = {}
    if settings.theme and themes[settings.theme] then
        setTheme(settings.theme)
    end
    self:init()
    return self
end

-- notification
local function notify(title, message, duration)
    duration = duration or 3
    local notifFrame = Instance.new('Frame')
    notifFrame.AnchorPoint = Vector2.new(1, 1)
    notifFrame.BackgroundColor3 = theme.Window2
    notifFrame.BorderSizePixel = 0
    notifFrame.Position = UDim2.new(1, 20, 1, -20)
    notifFrame.Size = UDim2.fromOffset(250, 80)
    notifFrame.ZIndex = 3000
    notifFrame.Parent = uiScreen

    local notifStroke = Instance.new('UIStroke')
    notifStroke.Color = theme.Stroke
    notifStroke.Parent = notifFrame

    local notifTrim = Instance.new('Frame')
    notifTrim.BackgroundColor3 = theme.Primary
    notifTrim.BorderSizePixel = 0
    notifTrim.Size = UDim2.new(0, 0, 0, 2)
    notifTrim.ZIndex = 3001
    notifTrim.Parent = notifFrame

    local notifTitle = Instance.new('TextLabel')
    notifTitle.BackgroundTransparency = 1
    notifTitle.Position = UDim2.fromOffset(8, 6)
    notifTitle.Size = UDim2.new(1, -16, 0, 20)
    notifTitle.Text = title or 'Notification'
    notifTitle.TextColor3 = theme.TextPrimary
    notifTitle.TextSize = 15
    notifTitle.Font = 'RobotoCondensed'
    notifTitle.TextXAlignment = 'Left'
    notifTitle.ZIndex = 3001
    notifTitle.Parent = notifFrame

    local notifDesc = Instance.new('TextLabel')
    notifDesc.BackgroundTransparency = 1
    notifDesc.Position = UDim2.fromOffset(8, 28)
    notifDesc.Size = UDim2.new(1, -16, 1, -36)
    notifDesc.Text = message or ''
    notifDesc.TextColor3 = theme.TextDim
    notifDesc.TextSize = 13
    notifDesc.TextWrapped = true
    notifDesc.TextXAlignment = 'Left'
    notifDesc.TextYAlignment = 'Top'
    notifDesc.ZIndex = 3001
    notifDesc.Parent = notifFrame

    tween(notifFrame, {Position = UDim2.new(1, -20, 1, -20)}, 0.3, 1)
    tween(notifTrim, {Size = UDim2.new(1, 0, 0, 2)}, 0.5, 1)

    task.delay(duration, function()
        tween(notifFrame, {Position = UDim2.new(1, 20, 1, -20)}, 0.3, 1)
        task.delay(0.3, function()
            notifFrame:Destroy()
        end)
    end)
end

-- export
local ui = {}
ui.newLauncher = newLauncher
ui.notify = notify
ui.themes = themes
ui.setTheme = setTheme

return ui
