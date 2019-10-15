-- Register Hammerspoon API manual: Open Hammerspoon manual in default browser
hsman_keys = hsman_keys or {"ctrl", "H"}
if #hsman_keys > 1 then
    spoon.ModalMgr.supervisor:bind(
        hsman_keys[1], hsman_keys[2], "Read Hammerspoon Manual", function()
            hs.doc.hsdocs.forceExternalBrowser(true)
            hs.doc.hsdocs.moduleEntitiesInSidebar(true)
            hs.doc.hsdocs.help()
        end
    )
end

----------------------------------------------------------------------------------------------------
-- register reload config
hsreload_keys = hsreload_keys or {{"cmd", "shift", "ctrl"}, "R"}
if #hsreload_keys > 1 then
    hs.hotkey.bind(
        hsreload_keys[1], hsreload_keys[2], "Reload Configuration", function()
            hs.reload()
        end
    )
end

----------------------------------------------------------------------------------------------------
-- register lock screen
hslock_keys = hslock_keys or {{"cmd", "ctrl"}, "L"}
if #hslock_keys > 1 then
    hs.hotkey.bind(
        hslock_keys[1], hslock_keys[2], "Lock Screen", function()
            hs.reload()
            hs.caffeinate.lockScreen()
        end
    )
end

----------------------------------------------------------------------------------------------------
-- Register Hammerspoon console
hsconsole_keys = hsconsole_keys or {"alt", "Z"}
if string.len(hsconsole_keys[2]) > 0 then
    spoon.ModalMgr.supervisor:bind(
        hsconsole_keys[1], hsconsole_keys[2], "Toggle Hammerspoon Console", function()
            hs.toggleConsole()
        end
    )
end
