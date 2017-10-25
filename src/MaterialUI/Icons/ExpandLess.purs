module MaterialUI.Icons.ExpandLess where

import Prelude (unit)
import React (ReactElement, ReactClass, createElement)


foreign import expandLessIconImpl :: forall props. ReactClass props


expandLessIcon :: ReactElement
expandLessIcon = createElement expandLessIconImpl unit []
