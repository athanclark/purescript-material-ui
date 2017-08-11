module Main where

import MaterialUI.InjectTapEvent (INJECT_TAP_EVENT, injectTapEvent)
import MaterialUI.MuiThemeProvider (muiThemeProvider', createMuiTheme)
import MaterialUI.AppBar (appBar')
import MaterialUI.AppBar as AppBar
import MaterialUI.Toolbar (toolbar')
import MaterialUI.Typography (typography')
import MaterialUI.Typography as Typography
import MaterialUI.IconButton (iconButton')
import MaterialUI.IconButton as IconButton
import MaterialUI.Drawer (drawer')
import MaterialUI.Drawer as Drawer
import MaterialUI.List (list')
import MaterialUI.ListItem (listItem')
import MaterialUI.ListItemIcon (listItemIcon')
import MaterialUI.ListItemText (listItemText')
import MaterialUI.Icons.Menu (menuIcon)
import MaterialUI.Icons.ChevronLeft (chevronLeftIcon)

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Uncurried (mkEffFn1)
import Control.Monad.Eff.Console (CONSOLE, log)

import Thermite as T
import React as R
import React.DOM as R
import React.DOM.Props as RP
import DOM (DOM)


type State =
  { drawerOpen :: Boolean
  }

initialState :: State
initialState =
  { drawerOpen: false
  }

data Action
  = OpenDrawer
  | CloseDrawer

spec :: T.Spec _ State _ Action
spec = T.simpleSpec performAction render
  where
    performAction :: T.PerformAction _ State _ Action
    performAction action props state = case action of
      OpenDrawer  -> void $ T.cotransform $ _ { drawerOpen = true }
      CloseDrawer -> void $ T.cotransform $ _ { drawerOpen = false }

    render :: T.Render State _ Action
    render dispatch props state children =
      [ muiThemeProvider' {theme: createMuiTheme unit} $ R.div []
        [ appBar' { position: AppBar.static
                  , color: AppBar.primary
                  , classes: {}
                  }
          [ toolbar' {classes: {}}
            [ iconButton'
                { classes: {}
                , color: IconButton.contrast
                , onTouchTap: mkEffFn1 \_ -> dispatch OpenDrawer
                }
                [ menuIcon
                ]
            , typography'
                { "type": Typography.title
                , color: Typography.inheritColor
                , classes: {}
                } [R.text "bar"]
            ]
          ]
        , drawer'
            { classes: {}
            , open: state.drawerOpen
            , onRequestClose: mkEffFn1 \_ -> dispatch CloseDrawer
            }
            [ list' {classes: {}, disablePadding: true}
              [ listItem' {classes: {}, button: true}
                [ listItemIcon' {classes: {}} chevronLeftIcon
                , listItemText' {classes: {}, primary: "Test", secondary: "nother test"}
                ]
              ]
            ]
        , R.text "Yo!"
        ]
      ]



main :: forall eff
      . Eff ( console        :: CONSOLE
            , dom            :: DOM
            , injectTapEvent :: INJECT_TAP_EVENT
            | eff) Unit
main = do
  log "Hello sailor!"

  injectTapEvent

  T.defaultMain spec initialState unit
