module MaterialUI.Icons.ExpandMore where

import Prelude (unit)
import React (ReactElement, ReactClass, createElement)


foreign import expandMoreIconImpl :: forall props. ReactClass props


expandMoreIcon :: ReactElement
expandMoreIcon = createElement expandMoreIconImpl unit []
