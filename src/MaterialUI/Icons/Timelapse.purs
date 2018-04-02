module MaterialUI.Icons.Timelapse where

import Prelude (unit)
import React (ReactElement, ReactClass, createElement)


foreign import timelapseIconImpl :: forall props. ReactClass props


timelapseIcon :: ReactElement
timelapseIcon = createElement timelapseIconImpl unit []
