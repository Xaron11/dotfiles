local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local deficient = require("deficient")

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
    awful.button({}, 1, function(t) t:view_only() end),
    awful.button({ modkey }, 1, function(t)
        if client.focus then
            client.focus:move_to_tag(t)
        end
    end),
    awful.button({}, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, function(t)
        if client.focus then
            client.focus:toggle_tag(t)
        end
    end),
    awful.button({}, 4, function(t) awful.tag.viewnext(t.screen) end),
    awful.button({}, 5, function(t) awful.tag.viewprev(t.screen) end)
)

local tasklist_buttons = gears.table.join(
    awful.button({}, 1, function(c)
        if c == client.focus then
            c.minimized = true
        else
            c:emit_signal(
                "request::activate",
                "tasklist",
                { raise = true }
            )
        end
    end),
    awful.button({}, 3, function()
        awful.menu.client_list({ theme = { width = 250 } })
    end),
    awful.button({}, 4, function()
        awful.client.focus.byidx(1)
    end),
    awful.button({}, 5, function()
        awful.client.focus.byidx(-1)
    end))


local wibar_manager = {}

function wibar_manager.create_wibar(s, mymainmenu)
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen          = s,
        filter          = awful.widget.tasklist.filter.currenttags,
        buttons         = tasklist_buttons,
        layout          = {
            spacing_widget = {
                {
                    forced_width  = 5,
                    forced_height = 24,
                    thickness     = 1,
                    color         = '#777777',
                    widget        = wibox.widget.separator
                },
                valign = 'center',
                halign = 'center',
                widget = wibox.container.place,
            },
            spacing        = 1,
            layout         = wibox.layout.fixed.horizontal
        },
        widget_template = {
            {
                {
                    {
                        {
                            id     = 'icon_role',
                            widget = wibox.widget.imagebox,
                        },
                        margins = 2,
                        widget  = wibox.container.margin,
                    },
                    {
                        id     = 'text_role',
                        widget = wibox.widget.textbox,
                    },
                    layout = wibox.layout.fixed.horizontal,
                },
                left   = 10,
                right  = 10,
                widget = wibox.container.margin
            },
            id     = 'background_role',
            widget = wibox.container.background,
        },
    }


    -- {{{ Wibar
    -- Create a textclock widget
    local mytextclock = wibox.widget.textclock("%d %b, %H:%M")


    -- Keyboard map indicator and switcher
    local mykeyboardlayout = awful.widget.keyboardlayout()

    -- Menu launcher
    local mylauncher = awful.widget.launcher({
        image = "/home/xaron/icons/archlinux-white.svg",
        menu = mymainmenu
    })
    
    mylauncher = wibox.widget {
        {
            image = "/home/xaron/icons/archlinux-white.svg",
            resize = true,
            widget = wibox.widget.imagebox,
        },
        margins = 4,
        widget  = wibox.container.margin
    }
    
    local function open_menu()
        mymainmenu:toggle()
        
    end

    -- Set up the launcher button to open the menu
    mylauncher:connect_signal("button::press", open_menu) 
    
    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
        awful.button({}, 1, function() awful.layout.inc(1) end),
        awful.button({}, 3, function() awful.layout.inc(-1) end),
        awful.button({}, 4, function() awful.layout.inc(1) end),
        awful.button({}, 5, function() awful.layout.inc(-1) end)))

    -- Powermenu
    local powermenu_icon = wibox.widget {
    
        {
        image  = "/usr/share/icons/Papirus-Dark/24x24@2x/panel/system-devices-panel.svg",
        resize = false,
        widget = wibox.widget.imagebox,
    
        },
    layout = wibox.container.margin(_, _, _, 4),

    }

    powermenu_icon:buttons(
    
        gears.table.join(
        
            awful.button({}, 1, function()
            
                awful.spawn.with_shell("sh ~/.config/awesome/powermenu.sh")
        
            end)
        )
    )

    -- Battery widget
    -- local battery_widget = deficient.battery_widget {
    --     ac_prefix = "󱊦 ",
    --     battery_prefix = "󱊣",
    --     widget_text = "${AC_BAT} ${percent}%"
    -- }

    -- Volume Control
    -- local volumecfg = deficient.volume_control({
    --     widget_text = {
    --         on  = '󰕾 % 3d%% ',        -- three digits, fill with leading spaces
    --         off = '󰖁 % 3d%% ',
    --     }
    -- })

    -- Systray
    local systray = wibox.widget.systray()
    systray:set_base_size(20)
    local centered_systray = wibox.container.place(systray, "center", "center")

    s.mywibox = awful.wibar({
        position = "top",
        screen = s,
        -- shape = gears.shape.rounded_rect,
        -- shape_args = { 50, },
    })
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            mylauncher,
            s.mytaglist,
            wibox.widget.separator {
                orientation = "vertical",
                forced_width = 1,
                color = "#888888",
            },
            -- s.mypromptbox,
        },
        s.mytasklist, -- Middle widget
        {             -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            spacing = 5,
            spacing_widget = wibox.widget.separator {
                orientation = "vertical",
                forced_width = 1,
                color = "#888888",
            },
        centered_systray,  -- Place the systray in the center
            {
                layout = wibox.layout.fixed.horizontal,
                -- battery_widget
            },
            {
                layout = wibox.layout.fixed.horizontal,
                mytextclock
            },

            mykeyboardlayout,
            
            s.mylayoutbox,
            {
                layout = wibox.layout.fixed.horizontal,
                powermenu_icon
            },
        },
    }
end

return wibar_manager
