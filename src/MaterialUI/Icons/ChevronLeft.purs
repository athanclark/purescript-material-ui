module MaterialUI.Icons.ChevronLeft where

import React (ReactElement, ReactClass, unsafeCreateElement)


foreign import chevronLeftIconImpl :: forall props. ReactClass props


chevronLeftIcon :: ReactElement
chevronLeftIcon = unsafeCreateElement chevronLeftIconImpl {} []
