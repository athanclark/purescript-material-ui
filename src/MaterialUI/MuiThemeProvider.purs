module MaterialUI.MuiThemeProvider
  ( muiThemeProvider, MuiThemeProviderProps, Theme, defaultMuiTheme, createMuiTheme, CreateThemeOpts, ColorPalette, PaletteOpts
  ) where


import Prelude
import Data.Record.Class (class Subrow)
import React (ReactClass, createElement, ReactElement)
import Unsafe.Coerce (unsafeCoerce)


foreign import muiThemeProviderImpl :: forall props. ReactClass props

foreign import data Theme :: Type

-- foreign import darkBaseTheme :: GetThemeParams
-- foreign import lightBaseTheme :: GetThemeParams

foreign import defaultMuiTheme :: Theme

foreign import createMuiThemeImpl :: forall x. x -> Theme


type CreateThemeOpts palette =
  ( palette :: { | palette }
  )

type ColorPalette =
  { light :: String
  , main :: String
  , dark :: String
  , contrastText :: String
  }

type PaletteOpts =
  ( primary :: ColorPalette
  , secondary :: ColorPalette
  )


createMuiTheme :: forall x palette
                . Subrow x (CreateThemeOpts palette)
               => Subrow palette PaletteOpts
               => { | x } -> Theme
createMuiTheme = createMuiThemeImpl


type MuiThemeProviderProps =
  { theme :: Theme
  }



muiThemeProvider :: MuiThemeProviderProps -> ReactElement -> ReactElement
muiThemeProvider props = createElement muiThemeProviderImpl props <<< unsafeCoerce
