local awful = require("awful")
local beautiful = require("beautiful")

local rules_manager = {}

function rules_manager.init(clientkeys, clientbuttons)
    -- {{{ Rules
    -- Rules to apply to new clients (through the "manage" signal).
    awful.rules.rules = {
        -- All clients will match this rule.
        {
            rule = {},
            properties = {
                border_width = beautiful.border_width,
                border_color = beautiful.border_normal,
                focus = awful.client.focus.filter,
                raise = true,
                keys = clientkeys,
                buttons = clientbuttons,
                screen = awful.screen.preferred,
                placement = awful.placement.no_overlap + awful.placement.no_offscreen
            }
        },
        -- Polybar
        {
            rule = { class = "Polybar" },
            properties = {
                border_width = 0,
                sticky = true,
                ontop = true,
                floating = true,
                focusable = false
            }
        },

        {
            rule = { class = "Brave-browser" },
            properties = {
                floating = false,
                maximized = false, 
        }

        },
        -- Floating clients.
        {
            rule_any = {
                instance = {
                    "DTA",   -- Firefox addon DownThemAll.
                    "copyq", -- Includes session name in class.
                    "pinentry",
                    "spectacle",
                },
                class = {
                    "Arandr",
                    "Blueman-manager",
                    "Gpick",
                    "Kruler",
                    "MessageWin",  -- kalarm.
                    "Sxiv",
                    "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
                    "Wpa_gui",
                    "veromix",
                    "xtightvncviewer",
                    "spectacle",
                },

                -- Note that the name property shown in xprop might be set slightly after creation of the client
                -- and the name shown there might not match defined rules here.
                name = {
                    "Event Tester", -- xev.
                    "spectacle",
                },
                role = {
                    "AlarmWindow",   -- Thunderbird's calendar.
                    "ConfigManager", -- Thunderbird's about:config.
                    "pop-up",        -- e.g. Google Chrome's (detached) Developer Tools.
                    "spectacle"
                }
            },
            properties = { floating = true }
        },

        -- Add titlebars to normal clients and dialogs
        {
            rule_any = { type = { "normal", "dialog" }
            },
            properties = { titlebars_enabled = false }
        },

        -- Set Firefox to always map on the tag named "2" on screen 1.
        -- { rule = { class = "Firefox" },
        --   properties = { screen = 1, tag = "2" } },
    }
    -- }}}
end

return rules_manager
