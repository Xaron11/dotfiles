-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local menubar = require("menubar")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

local error_manager = require("error_manager")

error_manager.handle_errors()

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
--beautiful.init(gears.filesystem.get_themes_dir() .. "zenburn/theme.lua")
local theme_path = string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), "holo")
local fallback_theme_path = string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), "holo")
local theme = beautiful.init(theme_path)
if not beautiful.init(theme_path) then
    beautiful.init(fallback_theme_path) -- a known good fallback
end
-- This is used later as the default terminal and editor to run.
terminal = os.getenv("TERM") or "alacritty"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

local layout_manager = require("layout_manager")

layout_manager.init()


-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it

local wallpaper = require("wallpaper")

local menu_manager = require("menu_manager")
local mymainmenu = menu_manager.create_menu()

local wibar_manager = require("wibar_manager")

package.path = package.path .. ";" .. theme_path
local theme = require("themes.halo.theme")

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    wallpaper.set_wallpaper(s)

    print("Setting up screen:", s.index)

    -- Print screen properties
    print("Screen geometry:", s.geometry.width, s.geometry.height)
    print("Screen position:", s.geometry.x, s.geometry.y)

    -- Example: Print tags assigned to each screen
    print("Tags for screen:", s.index)
    for _, tag in ipairs(s.tags) do
        print("- Tag:", tag.name)
    end

    -- Each screen has its own tag table.
    awful.tag({ "1", "2", "3", "4", "5" }, s, awful.layout.layouts[1])

    wibar_manager.create_wibar(s, mymainmenu)
    -- beautiful.get().at_screen_connect(s)
    -- theme.at_screen_connect(s)
end)
-- }}}



local button_manager = require("button_manager")
local key_manager = require("key_manager")

button_manager.init(mymainmenu)
key_manager.init()

local clientbuttons = button_manager.get_client_buttons()
local clientkeys = key_manager.get_client_keys()

local rules_manager = require("rules_manager")
rules_manager.init(clientkeys, clientbuttons)

-- {{{ Signals
-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", wallpaper.set_wallpaper)

local client_signals_manager = require("client_signals_manager")

client_signals_manager.init()

gears.timer.start_new(1.0, function()
    local current_layout = awful.layout.getname(awful.layout.get(awful.screen.focused()))
    -- local layout_file = io.open("~/.config/polybar/outputs/layout", "w")
    -- layout_file:write(current_layout)
    -- layout_file:close()
end)

awful.spawn.with_shell(
    'if (xrdb -query | grep -q "^awesome\\.started:\\s*true$"); then exit; fi;' ..
    'xrdb -merge <<< "awesome.started:true";' ..
    -- list each of your autostart commands, followed by ; inside single quotes, followed by ..
    'dex --environment Awesome --autostart'
)

awful.spawn.with_shell("~/.config/awesome/autorun.sh")
