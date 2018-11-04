module MaterialUI.Icons.ExpandMore where

import React (ReactElement, ReactClass, unsafeCreateElement)


foreign import expandMoreIconImpl :: forall props. ReactClass props


expandMoreIcon :: ReactElement
expandMoreIcon = unsafeCreateElement expandMoreIconImpl {} []
