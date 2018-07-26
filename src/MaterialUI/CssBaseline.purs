module MaterialUI.CssBaseline
  ( cssBaseline
  ) where

import React (ReactClass, createElement, ReactElement)


foreign import cssBaselineImpl :: forall props. ReactClass props



cssBaseline :: ReactElement
cssBaseline = createElement cssBaselineImpl {} []
