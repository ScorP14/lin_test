# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

import os
import subprocess        


mod = "mod4"
terminal = guess_terminal()


## АВТОЗАПУСК ----------------------------------------------------------------------
@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])


## СДЕЛАТЬ ДИАЛОГОВЫЕ ОКНА ПЛАВАЮЩИМИ ----------------------------------------------
@hook.subscribe.client_new
def floating_dialogs(window):
    dialog = window.window.get_wm_type() == 'dialog'
    transient = window.window.get_wm_transient_for()
    if dialog or transient:
        window.floating = True















keys = [

    Key([mod], "d", lazy.spawn('rofi -show drun'), desc="Move focus to right"),




    Key([mod], "left", lazy.layout.left(), desc="Move focus to left"), # Фокус влево
    Key([mod], "right", lazy.layout.right(), desc="Move focus to right"), # Фокус вправо
    Key([mod], "down", lazy.layout.down(), desc="Move focus down"), # Фокус вниз
    Key([mod], "up", lazy.layout.up(), desc="Move focus up"), # Фокус вверх
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"), # Переключить фокус

    # Перемещение окон
    Key([mod, "shift"], "left", lazy.layout.shuffle_left(), desc="Move window to the left"), # Переместить окно влево
    Key([mod, "shift"], "right", lazy.layout.shuffle_right(), desc="Move window to the right"), # Переместить окно вправо
    Key([mod, "shift"], "down", lazy.layout.shuffle_down(), desc="Move window down"), # Переместить окно вниз
    Key([mod, "shift"], "up", lazy.layout.shuffle_up(), desc="Move window up"), # Переместить окно вверх

    # Изменение размера окна
    Key([mod, "control"], "left", lazy.layout.grow_left(), desc="Grow window to the left"), # Увеличить окно влево
    Key([mod, "control"], "right", lazy.layout.grow_right(), desc="Grow window to the right"), # Увеличить окно вправо
    Key([mod, "control"], "down", lazy.layout.grow_down(), desc="Grow window down"), # Увеличить окно вниз
    Key([mod, "control"], "up", lazy.layout.grow_up(), desc="Grow window up"), # Увеличить окно вверх
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"), # Вернуть все взад
    
    # Запуск приложений
    Key([mod], "e", lazy.spawn("thunar")),











    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
]





groups = [Group(i) for i in "123456789"]




groups = [                                                                 
    Group("1", label = ""),
    Group("2", label = ""),
    Group("3", label = '"', matches=[Match(wm_class=["firefox"])]),
    Group("4", label = ""),
    Group("5", label = ""),
    Group("6", label = ""),
    Group("7", label = ""),
    Group("8", label = ""),
    Group("9", label = ""),
]                                                        

for i in groups:
    keys.extend(
        [
            # mod + номер вокспейса = переход на этот воркспейс
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod + shift + номер воркспейса = перенос окна на этот воркспейс
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
        ]
    )


layouts = [
    # layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=4),
    # layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    layout.MonadTall(border_focus="#f9f9f9", border_normal="#263238", border_width=1, margin=10),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

## ОБЩИЕ ПАРАМЕТРЫ ВИДЖЕТОВ НА ПАНЕЛИ ----------------------------------------------
widget_defaults = dict(
    font="JetBrainsMono",
    fontsize=12,
    padding=8,
)
extension_defaults = widget_defaults.copy()


screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.TextBox("[ScorP14]", name="default", foreground="#ffffff"),
                # widget.Spacer(length=10), # Виджет пробела

                widget.GroupBox(
                    borderwidth=5, # Толщина рамки
                    highlight_method='block', # Метод выделения активного воркспейса
                    block_highlight_text_color='#263238',# Цвет текста активного воркспейса
                    this_current_screen_border="#f9f9f9", # Цвет фона активного воркспейса
                    rounded=True,
                ),
                widget.Prompt(), # Виджет выполнения команд

                widget.WindowName(),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
                # widget.StatusNotifier(),
                widget.Systray(),
                widget.KeyboardLayout(
                    configured_keyboards=['us', 'ru'],
                    update_interval=1
                ),
                widget.Clock(format="%Y-%m-%d %a %I:%M %p"),
                widget.QuickExit(
                    default_text='',
                    countdown_format='[{}]'
                ),
            ],
                    
        24, # Высота панели
        # border_width=[5, 50, 5, 50],  # Толщина рамок панели
        # border_color=["263238", "263238", "263238", "263238"],  # Цвет рамок панели
        margin=5, # Гапсы бара
        background="#263238" # Цвет фона панели
        #opacity=0,5 # Прозрачность бара
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
