module MaterialUI.Icons.PersonPin where

import Prelude (unit)
import React (ReactElement, ReactClass, createElement)


foreign import personPinIconImpl :: forall props. ReactClass props


personPinIcon :: ReactElement
personPinIcon = createElement personPinIconImpl unit []
