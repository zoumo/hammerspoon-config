-- global config
hs.hotkey.alertDuration = 0
hs.hints.showTitleThresh = 0
hs.window.animationDuration = 0

local function ends_with(str, ending)
    return ending == "" or str:sub(-#ending) == ending
end

local function walkAndLoad(path, suffix, loadFn)
    local iterFn, dirObj = hs.fs.dir(hs.fs.pathToAbsolute(path))
    if iterFn then
        for file in iterFn, dirObj do
            if ends_with(file, suffix) then
                local name = file:sub(1, -(#suffix + 1))
                loadFn(name)
            end
        end
    else
        print(string.format("The following error occurred: %s", dirObj))
        os.exit(1)
    end
end 

-- load spoons
hs.loadSpoon("ModalMgr")

walkAndLoad(
    "~/.hammerspoon/Spoons", 
    ".spoon", 
    function(name)
        if name ~= "ModalMgr" then
            hs.loadSpoon(name)
        end
    end
)

-- load modules
walkAndLoad(
    "~/.hammerspoon/modules", 
    ".lua", 
    function(name)
        require("modules/" .. name)
    end
)

-- Finally we initialize ModalMgr supervisor
spoon.ModalMgr.supervisor:enter()

-- start volume scroll
-- spoon.VolumeScroll:init()
-- spoon.VolumeScroll:start()
