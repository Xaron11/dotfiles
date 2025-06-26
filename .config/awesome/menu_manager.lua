local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")
local awful = require("awful")

local menu_manager = {}

function menu_manager.create_menu()
    -- {{{ Menu
    -- Create a launcher widget and a main menu

    myawesomemenu = {
        { "hotkeys",     function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
        { "manual",      terminal .. " -e man awesome" },
        { "edit config", editor_cmd .. " " .. awesome.conffile },
        { "restart",     awesome.restart },
        { "quit",        function() awesome.quit() end },
    }

    mymainmenu = awful.menu({
        items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
            { "open terminal", terminal }
        }
    })

    return mymainmenu

    -- }}}
end

return menu_manager
