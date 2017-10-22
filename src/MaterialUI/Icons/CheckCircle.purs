module MaterialUI.Icons.CheckCircle where

import Prelude (unit)
import React (ReactElement, ReactClass, createElement)


foreign import checkCircleIconImpl :: forall props. ReactClass props


checkCircleIcon :: ReactElement
checkCircleIcon = createElement checkCircleIconImpl unit []
