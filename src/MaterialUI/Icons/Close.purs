module MaterialUI.Icons.Close where

import Prelude (unit)
import React (ReactElement, ReactClass, createElement)


foreign import closeIconImpl :: forall props. ReactClass props


closeIcon :: ReactElement
closeIcon = createElement closeIconImpl unit []
