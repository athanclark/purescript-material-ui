module MaterialUI.Icons.ChevronLeft where

import Prelude (unit)
import React (ReactElement, ReactClass, createElement)


foreign import chevronLeftIconImpl :: forall props. ReactClass props


chevronLeftIcon :: ReactElement
chevronLeftIcon = createElement chevronLeftIconImpl unit []
