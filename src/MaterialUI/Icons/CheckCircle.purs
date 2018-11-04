module MaterialUI.Icons.CheckCircle where

import React (ReactElement, ReactClass, unsafeCreateElement)


foreign import checkCircleIconImpl :: forall props. ReactClass props


checkCircleIcon :: ReactElement
checkCircleIcon = unsafeCreateElement checkCircleIconImpl {} []
