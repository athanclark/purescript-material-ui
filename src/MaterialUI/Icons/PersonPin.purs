module MaterialUI.Icons.PersonPin where

import React (ReactElement, ReactClass, unsafeCreateElement)


foreign import personPinIconImpl :: forall props. ReactClass props


personPinIcon :: ReactElement
personPinIcon = unsafeCreateElement personPinIconImpl {} []
