module MaterialUI.Icons.Close where

import React (ReactElement, ReactClass, unsafeCreateElement)


foreign import closeIconImpl :: forall props. ReactClass props


closeIcon :: ReactElement
closeIcon = unsafeCreateElement closeIconImpl {} []
