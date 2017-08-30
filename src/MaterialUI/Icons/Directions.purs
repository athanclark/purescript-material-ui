module MaterialUI.Icons.Directions where

import Prelude (unit)
import React (ReactElement, ReactClass, createElement)


foreign import directionsIconImpl :: forall props. ReactClass props


directionsIcon :: ReactElement
directionsIcon = createElement directionsIconImpl unit []
