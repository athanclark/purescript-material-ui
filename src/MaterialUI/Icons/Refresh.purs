module MaterialUI.Icons.Refresh where

import Prelude (unit)
import React (ReactElement, ReactClass, createElement)


foreign import refreshIconImpl :: forall props. ReactClass props


refreshIcon :: ReactElement
refreshIcon = createElement refreshIconImpl unit []
