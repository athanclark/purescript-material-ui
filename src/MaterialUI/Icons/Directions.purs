module MaterialUI.Icons.Directions where

import React (ReactElement, ReactClass, unsafeCreateElement)


foreign import directionsIconImpl :: forall props. ReactClass props


directionsIcon :: ReactElement
directionsIcon = unsafeCreateElement directionsIconImpl {} []
