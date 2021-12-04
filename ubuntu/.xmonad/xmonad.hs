import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import XMonad.Hooks.DynamicLog (xmobar)
import XMonad.Hooks.ManageDocks
import qualified XMonad.StackSet as W
import Text.Read
-- import XMonad.Actions.MouseGestures

--------

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

myTerminal = "gnome-terminal" -- "terminator" -- "guake" -- "urxvt"
myMod = mod1Mask  -- 1|->altL, 3|->altR, 4|->cmdL

myBorderWidth = 4
-- myNormalBorderColor = "#000000"
-- myFocusedBorderColor = "#551a8b"
myNormalBorderColor = "#551a8b"
myFocusedBorderColor = "#FFFFFF" -- "#966dbd"

-- run commands at startup:
-- myStartupHook = spawn "compton --backend glx --vsync opengl"
-- 				>> spawn "unclutter"
-- 				>> spawn "feh --bg-scale /usr/share/backgrounds/black.jpg"
-- 				>> spawn "/usr/bin/redshift"

myConfig = def
  { modMask     = myMod
  , terminal    = myTerminal 
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
      ((myMod                     , xK_n), spawn "/usr/bin/google-chrome"),
      ((myMod .|. shiftMask       , xK_n), spawn "/usr/bin/google-chrome --incognito") --,
      -- ((myMod .|. shiftMask       , xK_s), saveCurrentWorkspace)
      -- ((myMod .|. shiftMask       , xK_s), saveCurrentXState),
      -- ((myMod .|. shiftMask       , xK_l), loadCurrentXState)
      ]

main = xmonad $ do myConfig

--------

getLayout :: X (Layout Window)
getLayout = gets $ W.layout . W.workspace . W.current . windowset

-- setLayout :: Layout Window -> X ()
-- defined in XMonad

saveCurrentWorkspace :: X ()
saveCurrentWorkspace = do
  Layout x <- getLayout
  liftIO $ writeFile "currentLayout" (show x)

loadCurrentWorkspace :: X ()
loadCurrentWorkspace = do
  string <- liftIO $ readFile "currentLayout"
  Layout xProxy <- getLayout
  case readMaybe string of
    Just x -> setLayout (Layout (x `asTypeOf` xProxy))
    Nothing -> return () -- or complain that loadWorkspace is failing to parse the currentLayout file

-- getXState :: X (XState)
-- getXState = windowset

saveCurrentXState :: X ()
saveCurrentXState = do
  x <- XMonad.get
  liftIO $ writeFile "currentXState" (show $ windowset x)

-- loadCurrentXState :: X ()
-- loadCurrentXState = do
--   string <- liftIO $ readFile "currentXState"
--   xProxy <- XMonad.get
--   case readMaybe string of
--     Just x -> (XMonad.put $ xProxy { windowset = x })
--     Nothing -> return () -- or complain that loadWorkspace is failing to parse the currentLayout file
