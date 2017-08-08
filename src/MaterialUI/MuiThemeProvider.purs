module MaterialUI.MuiThemeProvider
  ( muiThemeProvider'
  ) where


import Prelude
import React (ReactClass, createElement, ReactElement)
import Unsafe.Coerce (unsafeCoerce)


foreign import muiThemeProviderImpl :: forall props. ReactClass props

muiThemeProvider' :: ReactElement -> ReactElement
muiThemeProvider' = createElement muiThemeProviderImpl unit <<< unsafeCoerce
