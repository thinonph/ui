local ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/thinonph/ui/refs/heads/main/loader.lua"))()

local launcher = ui.newLauncher({
    title = 'WWW /waddlers',
    version = 'v1'
})

launcher:addGame({
    name = 'Bad Business',
    status = 'up',
    url = "https://raw.githubusercontent.com/DarkNetworks/Infinite-Yield/main/latest.lua"
})

launcher:addGame({
    name = 'Arsenal',
    status = 'up',
    url = "https://raw.githubusercontent.com/thinonph/ui/refs/heads/main/arsenal.lua"
})

launcher:bind('loaded', function(data)
    if data.url then
        loadstring(game:HttpGet(data.url))()
    end
    ui.notify(data.name .. ' ready')
end)
