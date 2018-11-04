module MaterialUI.Icons.Timelapse where

import React (ReactElement, ReactClass, unsafeCreateElement)


foreign import timelapseIconImpl :: forall props. ReactClass props


timelapseIcon :: ReactElement
timelapseIcon = unsafeCreateElement timelapseIconImpl {} []
