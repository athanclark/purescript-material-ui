module MaterialUI.Icons.ErrorOutline where

import Prelude (unit)
import React (ReactElement, ReactClass, createElement)


foreign import errorOutlineIconImpl :: forall props. ReactClass props


errorOutlineIcon :: ReactElement
errorOutlineIcon = createElement errorOutlineIconImpl unit []
