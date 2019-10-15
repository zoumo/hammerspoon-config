-- global config
hs.hotkey.alertDuration = 0
hs.hints.showTitleThresh = 0
hs.window.animationDuration = 0

-- load spoons
hs.loadSpoon("ModalMgr")

hspoon_list = {"WinWin"}
for _, v in pairs(hspoon_list) do
    hs.loadSpoon(v)
end

-- load modules
local function ends_with(str, ending)
    return ending == "" or str:sub(-#ending) == ending
end

local iterFn, dirObj = hs.fs.dir(hs.fs.pathToAbsolute("~/.hammerspoon/modules"))
if iterFn then
    for file in iterFn, dirObj do
        if ends_with(file, '.lua') then
            local moduleName = file:sub(1, -(#".lua" + 1))
            require("modules/" .. moduleName)
        end
    end
else
    print(string.format("The following error occurred: %s", dirObj))
    os.exit(1)
end

-- Finally we initialize ModalMgr supervisor
spoon.ModalMgr.supervisor:enter()
