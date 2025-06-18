local wezterm = require('wezterm')
local mux = wezterm.mux

-- Define window size configuration
local window_config = {
    width_ratio = 0.4,  -- Percentage of screen width (0.0 to 1.0)
    height_ratio = 0.4, -- Percentage of screen height (0.0 to 1.0)
    min_width = 2200,   -- Minimum window width in pixels
    min_height = 1400   -- Minimum window height in pixels
}

wezterm.on('gui-startup', function(cmd)
    -- local tab, pane, window = mux.spawn_window(cmd or {})
    -- local gui_window = window:gui_window()
    -- gui_window:maximize()
   
    -- Get active screen dimensions
    local screen = wezterm.gui.screens().active
    
    -- Calculate window dimensions with minimum size constraints
    local width = math.max(screen.width * window_config.width_ratio, window_config.min_width)
    local height = math.max(screen.height * window_config.height_ratio, window_config.min_height)
    
    -- Spawn window with centered position
    local tab, pane, window = mux.spawn_window {
        position = {
            x = (screen.width - width) / 2,
            y = ((screen.height - height) / 2) - 100,
            origin = 'ActiveScreen'
        }
    }
    
    -- Set window size
    window:gui_window():set_inner_size(width, height)
end)

return {
    native_macos_fullscreen_mode = true,
}
