local gears = require("gears")
local awful = require("awful")

local button_manager = {}

function button_manager.init(mymainmenu)
    -- {{{ Mouse bindings
    root.buttons(gears.table.join(
        awful.button({}, 3, function() mymainmenu:toggle() end),
        awful.button({}, 4, awful.tag.viewnext),
        awful.button({}, 5, awful.tag.viewprev)
    ))
    -- }}}
end

function button_manager.get_client_buttons()
    local clientbuttons = gears.table.join(
        awful.button({}, 1, function(c)
            c:emit_signal("request::activate", "mouse_click", { raise = true })
        end),
        awful.button({ modkey }, 1, function(c)
            c:emit_signal("request::activate", "mouse_click", { raise = true })
            awful.mouse.client.move(c)
        end),
        awful.button({ modkey }, 3, function(c)
            c:emit_signal("request::activate", "mouse_click", { raise = true })
            awful.mouse.client.resize(c)
        end)
    )
    return clientbuttons
end

return button_manager
