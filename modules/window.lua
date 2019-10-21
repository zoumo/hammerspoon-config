function mouseFollowsFocusedWindow()
    local cwin = hs.window.focusedWindow()
    local f = cwin:frame()
    hs.mouse.setAbsolutePosition({x = (f.x + (f.w / 2)), y = (f.y + (f.h / 2))})
end

if spoon.WinWin then
    spoon.ModalMgr:new("resizeM")
    local cmodal = spoon.ModalMgr.modal_list["resizeM"]
    local deactivate = function()
        spoon.ModalMgr:deactivate({"resizeM"})
    end

    cmodal:bind('', 'escape', 'Deactivate resizeM', deactivate)
    cmodal:bind('', 'Q', 'Deactivate resizeM', deactivate)
    cmodal:bind(
        '', 'tab', 'Toggle Cheatsheet', function()
            spoon.ModalMgr:toggleCheatsheet()
        end
    )
    cmodal:bind(
        '', 'H', 'Lefthalf of Screen', function()
            spoon.WinWin:moveAndResize("halfleft")
        end, deactivate
    )
    cmodal:bind(
        '', 'L', 'Righthalf of Screen', function()
            spoon.WinWin:moveAndResize("halfright")
        end, deactivate
    )
    cmodal:bind(
        '', 'K', 'Uphalf of Screen', function()
            spoon.WinWin:moveAndResize("halfup")
        end, deactivate
    )
    cmodal:bind(
        '', 'J', 'Downhalf of Screen', function()
            spoon.WinWin:moveAndResize("halfdown")
        end, deactivate
    )
    cmodal:bind(
        '', 'F', 'Fullscreen', function()
            spoon.WinWin:moveAndResize("maximize")
        end, deactivate
    )
    cmodal:bind(
        '', 'C', 'Center Window', function()
            spoon.WinWin:moveAndResize("center")
        end
    )
    cmodal:bind(
        '', '=', 'Stretch Outward', function()
            spoon.WinWin:moveAndResize("expand")
        end, nil, function()
            spoon.WinWin:moveAndResize("expand")
        end
    )
    cmodal:bind(
        '', '-', 'Shrink Inward', function()
            spoon.WinWin:moveAndResize("shrink")
        end, nil, function()
            spoon.WinWin:moveAndResize("shrink")
        end
    )
    cmodal:bind(
        '', 'space', 'Move to Next Monitor', function()
            spoon.WinWin:moveToScreen("next")
            mouseFollowsFocusedWindow()
        end, deactivate
    )

    -- Register resizeM with modal supervisor
    hsresizeM_keys = hsresizeM_keys or {"ctrl", "R"}
    if #hsresizeM_keys > 0 then
        spoon.ModalMgr.supervisor:bind(
            hsresizeM_keys[1], hsresizeM_keys[2], "Enter window resize Environment", function()
                -- Deactivate some modal environments or not before activating a new one
                spoon.ModalMgr:deactivateAll()
                -- Show an status indicator so we know we're in some modal environment now
                spoon.ModalMgr:activate({"resizeM"}, "#B22222")
            end
        )
    end
end
