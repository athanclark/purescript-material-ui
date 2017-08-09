module MaterialUI.MuiThemeProvider
  ( muiThemeProvider', MuiThemeProviderProps, Theme, createMuiTheme
  ) where


import Prelude
import React (ReactClass, createElement, ReactElement)
import Unsafe.Coerce (unsafeCoerce)


foreign import muiThemeProviderImpl :: forall props. ReactClass props

foreign import data Theme :: Type

foreign import data CreateThemeParams :: Type

-- foreign import darkBaseTheme :: GetThemeParams
-- foreign import lightBaseTheme :: GetThemeParams

foreign import createMuiTheme :: Unit -> Theme


type MuiThemeProviderProps =
  { theme :: Theme
  }



muiThemeProvider' :: MuiThemeProviderProps -> ReactElement -> ReactElement
muiThemeProvider' props = createElement muiThemeProviderImpl props <<< unsafeCoerce
