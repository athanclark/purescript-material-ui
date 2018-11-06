module Main where

import MaterialUI.MuiThemeProvider (muiThemeProvider, defaultMuiTheme)
import MaterialUI.CssBaseline (cssBaseline)
import MaterialUI.AppBar (appBar)
import MaterialUI.AppBar as AppBar
import MaterialUI.Toolbar (toolbar)
import MaterialUI.Typography (typography)
import MaterialUI.Typography as Typography
import MaterialUI.IconButton (iconButton)
import MaterialUI.IconButton as IconButton
import MaterialUI.Drawer (drawer)
import MaterialUI.Drawer as Drawer
import MaterialUI.List (list)
import MaterialUI.ListItem (listItem)
import MaterialUI.ListItemIcon (listItemIcon)
import MaterialUI.ListItemText (listItemText)
import MaterialUI.Card (card)
import MaterialUI.CardContent (cardContent)
import MaterialUI.CardActions (cardActions)
import MaterialUI.Button (button)
import MaterialUI.Button as Button
import MaterialUI.Icons.Menu (menuIcon)
import MaterialUI.Icons.ChevronLeft (chevronLeftIcon)

import Prelude
import Effect (Effect)
import Effect.Uncurried (mkEffectFn1)
import Effect.Console (log)

import Thermite as T
import React as R
import React.DOM as R
import React.DOM.Props as RP

import Unsafe.Coerce (unsafeCoerce)



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

spec :: T.Spec State _ Action
spec = T.simpleSpec performAction render
  where
    performAction :: T.PerformAction State _ Action
    performAction action props state = case action of
      OpenDrawer  -> void $ T.cotransform $ _ { drawerOpen = true }
      CloseDrawer -> void $ T.cotransform $ _ { drawerOpen = false }

    render :: T.Render State _ Action
    render dispatch props state children = -- [R.text "yo"]
      [ muiThemeProvider {theme: defaultMuiTheme}
        [ cssBaseline
        , text "Yo"
        ]
      ]
      --   [ drawer
      --     { open: true -- state.drawerOpen
      --     -- , docked: true
      --     , variant: Drawer.permanent
      --     -- , onRequestClose: mkEffectFn1 \_ -> dispatch CloseDrawer
      --     }
      --     [ list {disablePadding: true}
      --       [ listItem {button: true}
      --         [ listItemIcon {} chevronLeftIcon
      --         , listItemText {primary: "Test", secondary: "nother test"}
      --         ]
      --       ]
      --     ]
      --   , R.div [ RP.style {marginLeft: "150px"}]
      --     [ appBar { position: AppBar.static
      --              , color: AppBar.primary
      --                -- {positionStatic: unsafeCoerce {marginLeft: "150px"}
      --                -- }
      --              }
      --       [ toolbar {}
      --         [ iconButton
      --           { color: IconButton.contrast
      --           , onTouchTap: mkEffectFn1 \_ -> dispatch OpenDrawer
      --           }
      --           menuIcon
      --         , typography
      --           { variant: Typography.title
      --           , color: Typography.inheritColor
      --           } [R.text "bar"]
      --         ]
      --       ]
      --     , card {}
      --       [ cardContent {}
      --         [ typography {variant: Typography.headline}
      --           [R.text "Headline"]
      --         , typography {variant: Typography.subheading}
      --           [R.text "Subheading"]
      --         , typography {variant: Typography.title}
      --           [R.text "Title"]
      --         , typography {variant: Typography.display1}
      --           [R.text "Display1"]
      --         , typography {variant: Typography.display2}
      --           [R.text "Display2"]
      --         , typography {variant: Typography.display3}
      --           [R.text "Display3"]
      --         , typography {variant: Typography.display4}
      --           [R.text "Display4"]
      --         , typography {variant: Typography.body1}
      --           [R.text "Body1"]
      --         , typography {variant: Typography.body2}
      --           [R.text "Body2"]
      --         , typography {variant: Typography.caption}
      --           [R.text "Caption"]
      --         ]
      --       , cardActions {}
      --         [ button
      --           { color: Button.secondary
      --           } [R.text "Button!"]
      --         ]
      --       ]
      --     ]
      --   ]
      -- ]



main :: Effect Unit
main = do
  log "Hello sailor!"

  T.defaultMain spec initialState "Demo" {}
