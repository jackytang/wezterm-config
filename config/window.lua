local wezterm = require('wezterm')
local mux = wezterm.mux

wezterm.on('gui-startup', function(cmd)
   local tab, pane, window = mux.spawn_window(cmd or {})
   local gui_window = window:gui_window()
   gui_window:maximize()
end)

return {
   native_macos_fullscreen_mode = true,
}
