# Change the argument to True to still load settings configured via autoconfig.yml
config.load_autoconfig(True)

# When to show a changelog after qutebrowser was upgraded.
c.changelog_after_upgrade = 'never'

c.backend = 'webengine'

config.set('content.cookies.accept', 'all', 'chrome-devtools://*')

config.set('content.cookies.accept', 'all', 'devtools://*')

config.set('content.headers.accept_language', '', 'https://matchmaker.krunker.io/*')

# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:136.0) Gecko/20100101 Firefox/139.0', 'https://accounts.google.com/*')

# Load images automatically in web pages.
# Type: Bool
config.set('content.images', True, 'chrome-devtools://*')

# Load images automatically in web pages.
# Type: Bool
config.set('content.images', True, 'devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome-devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome://*/*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'qute://*/*')

# Allow locally loaded documents to access remote URLs.
# Type: Bool
config.set('content.local_content_can_access_remote_urls', True, 'file:///home/dkaczmarzyk/.local/share/qutebrowser/userscripts/*')

# Allow locally loaded documents to access other local URLs.
# Type: Bool
config.set('content.local_content_can_access_file_urls', False, 'file:///home/dkaczmarzyk/.local/share/qutebrowser/userscripts/*')

##### CUSTOM SETTINGS #####
c.auto_save.session = True

# Scatter hint key chains (like Vimium) or not (like dwb). Ignored for
# number hints.
# Type: Bool
c.hints.scatter = True

# Enable smooth scrolling for web pages. Note smooth scrolling does not
# work with the `:scroll-px` command.
# Type: Bool
c.scrolling.smooth = True

# Dark mode settings
c.colors.webpage.darkmode.enabled = False
c.colors.webpage.preferred_color_scheme = "dark"

# PDF viewer
c.content.pdfjs = True

c.content.blocking.adblock.lists = [
    "https://easylist.to/easylist/easylist.txt",
    "https://easylist.to/easylist/easyprivacy.txt",
    "https://easylist.to/easylist/fanboy-annoyance.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/annoyances.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/resource-abuse.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/unbreak.txt",
]

config.set('content.blocking.method', 'both')

### CUSTOM KEYBINDINGS ###
config.bind('xt', 'config-cycle tabs.show always never')
config.bind('xs', 'config-cycle statusbar.show always never')
config.bind('xx', 'config-cycle tabs.show always never;; config-cycle statusbar.show always never')

# Bitwarden
config.bind('xb', 'spawn --userscript qute-bitwarden')

# Show downloads
config.bind('sd', 'spawn --userscript open_download')

# Toggle Dark mode
config.bind('xd', 'config-cycle colors.webpage.darkmode.enabled ;; reload')
# Toggle Dark mode for current domain only
config.bind('xD', ':config-cycle -p -u *://{url:host}/* colors.webpage.darkmode.enabled ;; reload')

# CUSTOM SEARCH ENGINES
c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/search?q={}",
    "g": "https://google.com/search?q={}",
    "yt": "https://youtube.com/results?search_query={}",
    "br": "https://search.brave.com/search?q={}",
    "aw": "https://wiki.archlinux.org/index.php?search={}",
}

