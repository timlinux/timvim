# Copilot Statusline Indicator Design

**Date:** 2026-04-18
**Status:** Approved

## Summary

Add a persistent Copilot status indicator to the lualine statusline showing whether Copilot is enabled or disabled.

## Requirements

1. Display " Copilot ON" with green background when Copilot is enabled
2. Display " Copilot OFF" with gray/muted background when Copilot is disabled
3. Position as the first item in `lualine_x` section (before Recording indicator)
4. Update automatically when Copilot is toggled via `:Copilot enable` / `:Copilot disable`

## Design

### Visual Layout

```
lualine_x: [ Copilot ON] [Recording @a] [Yanked @a] [encoding] [fileformat] [filetype]
              green          red           green        gray        gray         gray
```

### Colors

Using existing Kartoza theme colors from `lualine.nix`:

| State | Background | Foreground | Style |
|-------|------------|------------|-------|
| ON    | `colors.green` (#8ad384) | `colors.bg` (#1e2020) | bold |
| OFF   | `colors.bg` (#1e2020) | `colors.fg` (#f1f1f1) | normal |

### Implementation

Add a new lualine component as the first item in `lualine_x`:

```lua
{
  function()
    local ok, copilot_client = pcall(require, 'copilot.client')
    if ok and copilot_client then
      if copilot_client.is_disabled() then
        return " Copilot OFF"
      else
        return " Copilot ON"
      end
    end
    return ""
  end,
  color = function()
    local ok, copilot_client = pcall(require, 'copilot.client')
    if ok and copilot_client and not copilot_client.is_disabled() then
      return { fg = colors.bg, bg = colors.green, gui = 'bold' }
    else
      return { fg = colors.fg, bg = colors.bg }
    end
  end,
},
```

### File Changes

**Modified:** `config/plugins/lualine.nix`
- Add Copilot status component to `lualine_x` section (lines 98-99)

## Testing

1. Open Neovim - verify " Copilot ON" appears in green
2. Run `:Copilot disable` - verify changes to " Copilot OFF" in muted style
3. Run `:Copilot enable` - verify returns to " Copilot ON" in green
4. Verify Recording and Yanked indicators still work correctly
