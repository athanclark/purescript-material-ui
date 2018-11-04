module MaterialUI.Icons.ChevronRight where

import React (ReactElement, ReactClass, unsafeCreateElement)


foreign import chevronRightIconImpl :: forall props. ReactClass props


chevronRightIcon :: ReactElement
chevronRightIcon = unsafeCreateElement chevronRightIconImpl {} []
