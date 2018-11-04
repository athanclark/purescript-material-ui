module MaterialUI.CssBaseline
  ( cssBaseline
  ) where

import React (ReactClass, unsafeCreateElement, ReactElement)


foreign import cssBaselineImpl :: forall props. ReactClass props



cssBaseline :: ReactElement
cssBaseline = unsafeCreateElement cssBaselineImpl {} []
