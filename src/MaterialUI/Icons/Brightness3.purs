module MaterialUI.Icons.Brightness3 where

import Prelude (unit)
import React (ReactElement, ReactClass, createElement)


foreign import brightness3IconImpl :: forall props. ReactClass props


brightness3Icon :: ReactElement
brightness3Icon = createElement brightness3IconImpl unit []
