import Xmonad

main :: IO ()
main = xmonad def
    { terminal    = "wezterm"
    , modMask     = mod4Mask -- Rebind Mod to the Windows (Super) key
    , borderWidth = 2
    , normalBorderColor = "#000000"
    , focusedBorderColor = "#ff0000"
    }
