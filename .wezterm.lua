-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()


local act = wezterm.action

wezterm.on('augment-command-palette', function(window, pane)
    return {
        {
            brief = 'Select Workspace site',
            icon = 'md_reorder', -- Optional: use a suitable icon
            action = act.SpawnCommandInNewTab {
                args = { 'python', '-m', 'alphawrx.pe.sites.select' },
            },
        },
        -- You can add more custom commands here
    {
      brief = 'Run PE script',
      icon = 'md_speedometer',
      action = wezterm.action_callback(function(window, pane)
        -- This sends the text and a carriage return to the active pane
        pane:send_text("python3 -m alphawrx.pe.runs.run\n")
      end),
    },
    }
end)

-- Finally, return the configuration to wezterm:
return config
