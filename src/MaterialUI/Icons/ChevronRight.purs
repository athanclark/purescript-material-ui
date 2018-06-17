module MaterialUI.Icons.ChevronRight where

import Prelude (unit)
import React (ReactElement, ReactClass, createElement)


foreign import chevronRightIconImpl :: forall props. ReactClass props


chevronRightIcon :: ReactElement
chevronRightIcon = createElement chevronRightIconImpl unit []
