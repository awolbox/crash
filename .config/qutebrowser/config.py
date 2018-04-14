import yaml

with (config.configdir / 'colors.yml').open() as f:
    yaml_data = yaml.load(f)

def dict_attrs(obj, path=''):
    if isinstance(obj, dict):
        for k, v in obj.items():
            yield from dict_attrs(v, '{}.{}'.format(path, k) if path else k)
    else:
        yield path, obj

for k, v in dict_attrs(yaml_data):
    config.set(k, v)


# config.load_autoconfig()

# misc
c.aliases = {'w': 'session-save', 'q': 'quit', 'wq': 'quit --save'}
#c.colors.webpage.bg = '#282A2E'
c.qt.args = ['ppapi-widevine-path=/usr/lib/qt/plugins/ppapi/libwidevinecdmadapter.so']
c.content.webgl = False
#c.spellcheck.languages = [en-US]
c.url.start_pages = 'https://duckduckgo.com/?key=d4eecf26f40cdb2635f4e1c8e7aa1cb07eac53a87260909edc4f9ceaf32a7303b3ca00c6cb55f43e3e493a4b859d261a63810ff4b879acc628c239675ccb96a2'
c.url.searchengines = {'DEFAULT': 'https://duckduckgo.com/?q={}', 'aw': 'https://wiki.archlinux.org/?search={}'}

# fonts
c.fonts.completion.category = 'bold 8pt "DejaVu Sans Mono"'
c.fonts.completion.entry = '8pt "DejaVu Sans Mono"'
c.fonts.debug_console = '8pt "DejaVu Sans Mono"'
c.fonts.downloads = '8pt "DejaVu Sans Mono"'
c.fonts.hints = 'bold 10pt "DejaVu Sans Mono"'
c.fonts.keyhint = '8pt "DejaVu Sans Mono"'
c.fonts.messages.error = '8pt "DejaVu Sans Mono"'
c.fonts.messages.info = '8pt "DejaVu Sans Mono"'
c.fonts.messages.warning = '8pt "DejaVu Sans Mono"'
c.fonts.statusbar = 'bold 8pt "DejaVu Sans Mono"'
c.fonts.tabs = '8pt "DejaVu Sans Mono"'
c.fonts.monospace = '"xos4 Terminus", Terminus, Monospace, "DejaVu Sans Mono", Monaco, "Bitstream Vera Sans Mono", "Andale Mono", "Courier New", Courier, "Liberation Mono", monospace, Fixed, Consolas, Terminal'

# status bar
c.statusbar.padding = {'top': 5, 'bottom': 5, 'left': 5, 'right': 5}

# tabs
c.tabs.favicons.scale = 1.0
c.tabs.indicator.padding = {'top': 0, 'bottom': 0, 'left': 0, 'right': 5}
c.tabs.indicator.width = 0
c.tabs.padding = {'top': 5, 'bottom': 5, 'left': 5, 'right': 5}
c.tabs.select_on_remove = 'next'
c.tabs.title.alignment = 'center'
c.tabs.title.format = '{title}'
#css = '~/.config/qutebrowser/stylesheets/new.css' 
#c.content.user_stylesheets = [ '~/.config/qutebrowser/stylesheets/new.css' ]
config.bind(',n', 'config-cycle content.user_stylesheets ~/.config/qutebrowser/stylesheets/global-dark.css "" ;; reload')

