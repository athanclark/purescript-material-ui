module MaterialUI.Icons.Menu where

import React (ReactElement, ReactClass, unsafeCreateElement)


foreign import menuIconImpl :: forall props. ReactClass props


menuIcon :: ReactElement
menuIcon = unsafeCreateElement menuIconImpl {} []
