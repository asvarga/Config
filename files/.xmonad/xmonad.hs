import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import XMonad.Hooks.DynamicLog (xmobar)
import XMonad.Hooks.ManageDocks

-- Removes window borders if they aren't needed
import XMonad.Layout.NoBorders (smartBorders)
-- Allow gaps to be displayed around windows, for aesthetic purposes
import XMonad.Layout.Spacing

-- mySpacing = spacingRaw True             -- Only for >1 window
--                        -- The bottom edge seems to look narrower than it is
--                        (Border 0 15 10 10) -- Size of screen edge gaps
--                        True             -- Enable screen edge gaps
--                        (Border 5 5 5 5) -- Size of window gaps
--                        True             -- Enable window gaps

myTerminal = "urxvt"

myBorderWidth = 4
-- myNormalBorderColor = "#000000"
-- myFocusedBorderColor = "#551a8b"
myNormalBorderColor = "#551a8b"
myFocusedBorderColor = "#966dbd"

-- run commands at startup:
-- myStartupHook = spawn "compton --backend glx --vsync opengl"
-- 				>> spawn "unclutter"
-- 				>> spawn "feh --bg-scale /usr/share/backgrounds/black.jpg"
-- 				>> spawn "/usr/bin/redshift"

myConfig = def
  { terminal    = myTerminal
  -- , modMask     = mod4Mask -- set 'Mod' to windows key
  , borderWidth = myBorderWidth
  , focusedBorderColor = myFocusedBorderColor
  , normalBorderColor = myNormalBorderColor
  , layoutHook  = avoidStruts $ 
                  -- mySpacing $ 
                  smartBorders $ 
                  layoutHook defaultConfig
--  , startupHook = myStartupHook 
  } `additionalKeys`
    [ ((0                     , 0x1008FF11), spawn "amixer -D pulse sset Master 5%-"),
      ((0                     , 0x1008FF13), spawn "amixer -D pulse sset Master 5%+"),
      ((0                     , 0x1008FF12), spawn "amixer -D pulse set Master toggle"),
      ((0                     , 0x1008FF02), spawn "/usr/bin/light -A 10"), 
      ((0                     , 0x1008FF03), spawn "/usr/bin/light -U 10"),
      ((0                     , 0x1008FF06), spawn "/usr/bin/light -s sysfs/leds/smc::kbd_backlight -U 10"),
      ((0                     , 0x1008FF05), spawn "/usr/bin/light -s sysfs/leds/smc::kbd_backlight -A 10"),
      ((mod4Mask                     , xK_n), spawn "/usr/bin/brave-browser"),
      ((mod4Mask .|. shiftMask       , xK_n), spawn "/usr/bin/brave-browser --incognito")
      ]

main = xmonad $ do myConfig
