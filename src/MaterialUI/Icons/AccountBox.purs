module MaterialUI.Icons.AccountBox where

import Prelude (unit)
import React (ReactElement, ReactClass, createElement)


foreign import accountBoxIconImpl :: forall props. ReactClass props


accountBoxIcon :: ReactElement
accountBoxIcon = createElement accountBoxIconImpl unit []
