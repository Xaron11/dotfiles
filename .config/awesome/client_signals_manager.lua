local awful = require("awful")
local beautiful = require("beautiful")

local client_signals_manager = {}

function client_signals_manager.init()
    -- Signal function to execute when a new client appears.
    client.connect_signal("manage", function(c)
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- if not awesome.startup then awful.client.setslave(c) end

        if awesome.startup
            and not c.size_hints.user_position
            and not c.size_hints.program_position then
            -- Prevent clients from being unreachable after screen count changes.
            awful.placement.no_offscreen(c)
        end
    end)

    local titlebar_manager = require("titlebar_manager")

    -- Add a titlebar if titlebars_enabled is set to true in the rules.
    client.connect_signal("request::titlebars", function(c)
        titlebar_manager.init(c)
    end)

    -- Enable sloppy focus, so that focus follows mouse.
    client.connect_signal("mouse::enter", function(c)
        c:emit_signal("request::activate", "mouse_enter", { raise = false })
    end)

    client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
    client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
    -- }}}
end

return client_signals_manager
