-- vim: ts=4 sw=4 noet ai cindent syntax=lua
--[[
Conky, a system monitor, based on torsmo

Any original torsmo code is licensed under the BSD license

All code written since the fork of torsmo is licensed under the GPL

Please see COPYING for details

Copyright (c) 2004, Hannu Saransaari and Lauri Hakkarainen
Copyright (c) 2005-2012 Brenden Matthews, Philip Kovacs, et. al. (see AUTHORS)
All rights reserved.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
]]

conky.config = {
    use_xft = true,
    xftalpha = 0.8,
    update_interval = 1.0,
    total_run_times = 0,
    own_window = true,
    own_window_transparent = true,
    own_window_argb_visual = true,
    own_window_type = 'normal',
    own_window_class = 'conky-semi',
    own_window_hints = 'undecorated,below,sticky,skip_taskbar,skip_pager',
    background = false,
    double_buffer = true,
    imlib_cache_size = 0,
    no_buffers = true,
    uppercase = false,
    cpu_avg_samples = 2,
    override_utf8_locale = true,
 
    -- placement
    alignment = 'top_left',
    gap_x = 0,
    gap_y = 0,
 
    -- default drawing
    draw_shades = false,
    draw_outline = false,
    draw_borders = false,
    draw_graph_borders = true,
    default_bar_width = 375, default_bar_height = 5,
    default_graph_width = 150, default_graph_height = 12,
    default_gauge_width = 20, default_gauge_height = 20,
 
    -- colors
    font = 'Liberation Mono:size=10',
    default_color = 'EEEEEE',
    color1 = 'AABBFF',
    color2 = 'FF993D',
    color3 = 'AAAAAA',
 
    -- layouting
    template0 = [[${font Arial :size=10}]],
    template1 = [[${color1}\1]],
    template2 = [[${goto 150}${color}]],
    template3 = [[${goto 180}${color}${alignr}]],
};
 
conky.text = [[
${if_running deadbeef-main}
${template0}${template2}${color2}${execi 30 whoami}
${template2}${color 3399FF}deadbeef audio is playing :
${template2}${color FFFFFF}Artist${goto 200}:${goto 220}${exec deadbeef --nowplaying "%a"} 
${template2}${color FFFFFF}Title${goto 200}:${goto 220}${exec deadbeef --nowplaying "%t"}
${template2}${color FFFFFF}Album${goto 200}:${goto 220}${exec deadbeef --nowplaying "%b"} 

${template2}${color 3399FF}${exec deadbeef --nowplaying "%e"}${offset 2} / ${exec deadbeef --nowplaying "%l"}${image ~/.config/Conky/logo.jpg -p 5,5 -s 125x125}${color 3399FF}
${goto 10}${execbar bash ~/.config/Conky/myscript.sh}

${goto 10}${color1}CPU    ${goto 75}:   ${color2}${freq_g}GHz              ${goto 200}${color3}${cpu}%            ${goto 230}${color1}${cpubar 4, 124}
${goto 10}${color1}RAM    ${goto 75}:   ${color2}$mem/$memmax              ${goto 200}${color3}$memperc%          ${goto 230}${color1}${membar 4, 124}  
${goto 10}${color1}Swap   ${goto 75}:   ${color2}$swap/$swapmax            ${goto 200}${color3}$swapperc%         ${goto 230}${color1}${swapbar 4, 124}  
${goto 10}${color1}Disk   ${goto 75}:   ${color2}${fs_used /}/${fs_size /} ${goto 200}${color3}${fs_used_perc /}% ${goto 230}${color1}${fs_bar 4, 124}

${goto 10}${color1}Distro ${goto 75}:   ${color2}${execi 30 cat /etc/os-release|grep "PRETTY_NAME"|cut -d "=" -f 2|sed 's/"//g'|sed 's/\r//g'}
${goto 10}${color1}Kernel ${goto 75}:   ${color2}${execi 30 uname -r}
${goto 10}${color1}DE     ${goto 75}:   ${color2}${execi 30 gnome-shell --version}
${goto 10}${color1}Uptime ${goto 75}:   ${color2}${uptime_short}

      

${else}
${template0}${template2}${color2}${execi 30 whoami}
${template2}${color 3399FF}${hr 2} 
${template2}${color FFFFFF}Distro   ${goto 200}:${goto 220}    ${color2}${execi 30 cat /etc/os-release|grep "PRETTY_NAME"|cut -d "=" -f 2|sed 's/"//g'|sed 's/\r//g'}
${template2}${color FFFFFF}Kernel   ${goto 200}:${goto 220}    ${color2}${execi 30 uname -r}
${template2}${color FFFFFF}DE       ${goto 200}:${goto 220}    ${color2}${execi 30 gnome-shell --version}
${template2}${color FFFFFF}Uptime   ${goto 200}:${goto 220}    ${color2}${uptime_short}
${image ~/.config/Conky/logo.jpg -p 5,5 -s 125x125}${color 3399FF}
${hr 2}

${goto 10}${color1}CPU    ${goto 75}:   ${color2}${freq_g}GHz              ${goto 200}${color3}${cpu}%            ${goto 230}${color1}${cpubar 4, 124}
${goto 10}${color1}RAM    ${goto 75}:   ${color2}$mem/$memmax              ${goto 200}${color3}$memperc%          ${goto 230}${color1}${membar 4, 124}  
${goto 10}${color1}Swap   ${goto 75}:   ${color2}$swap/$swapmax            ${goto 200}${color3}$swapperc%         ${goto 230}${color1}${swapbar 4, 124}  
${goto 10}${color1}Disk   ${goto 75}:   ${color2}${fs_used /}/${fs_size /} ${goto 200}${color3}${fs_used_perc /}% ${goto 230}${color1}${fs_bar 4, 124}
${endif}
]];
