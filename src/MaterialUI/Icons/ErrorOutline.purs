module MaterialUI.Icons.ErrorOutline where

import React (ReactElement, ReactClass, unsafeCreateElement)


foreign import errorOutlineIconImpl :: forall props. ReactClass props


errorOutlineIcon :: ReactElement
errorOutlineIcon = unsafeCreateElement errorOutlineIconImpl {} []
