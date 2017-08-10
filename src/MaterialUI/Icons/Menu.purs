module MaterialUI.Icons.Menu where

import Prelude (unit)
import React (ReactElement, ReactClass, createElement)


foreign import menuIconImpl :: forall props. ReactClass props


menuIcon :: ReactElement
menuIcon = createElement menuIconImpl unit []
