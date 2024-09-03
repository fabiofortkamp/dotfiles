import XMonad
import XMonad.Hooks.EwmhDesktops

main :: IO ()
main = xmonad $ ewmhFullscreen $ ewmh $ myConfig

myConfig = def
    { terminal    = "wezterm"
    , modMask     = mod4Mask -- Rebind Mod to the Windows (Super) key
    , borderWidth = 2
    , normalBorderColor = "#000000"
    , focusedBorderColor = "#ff0000"
    }
