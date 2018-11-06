module MaterialUI.MuiThemeProvider
  ( muiThemeProvider, MuiThemeProviderProps, Theme, defaultMuiTheme, createMuiTheme, CreateThemeOpts, ColorPalette, PaletteOpts
  ) where


import Prelude
import Row.Class (class SubRow)
import React (ReactClass, unsafeCreateElement, ReactElement)
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
                . SubRow x (CreateThemeOpts palette)
               => SubRow palette PaletteOpts
               => { | x } -> Theme
createMuiTheme = createMuiThemeImpl


type MuiThemeProviderProps o =
  { theme :: Theme
  | o
  }


type MuiThemeProviderPropsO =
  ( disableStylesGeneration :: Boolean
  , sheetsManager :: Void -- FIXME
  )


muiThemeProvider :: forall o
                  . SubRow o MuiThemeProviderPropsO
                 => MuiThemeProviderProps o -> ReactElement -> ReactElement
muiThemeProvider props = unsafeCreateElement muiThemeProviderImpl props <<< unsafeCoerce
