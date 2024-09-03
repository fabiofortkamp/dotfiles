import XMonad
import XMonad.Hooks.EwmhDesktops

main :: IO ()
main = xmonad $ ewmhFullscreen $ ewmh $ myConfig

myConfig = def
    { modMask     = mod4Mask -- Rebind Mod to the Windows (Super) key
    }
