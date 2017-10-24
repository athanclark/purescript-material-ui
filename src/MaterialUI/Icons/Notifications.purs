module MaterialUI.Icons.Notifications where

import Prelude (unit)
import React (ReactElement, ReactClass, createElement)


foreign import notificationsIconImpl :: forall props. ReactClass props


notificationsIcon :: ReactElement
notificationsIcon = createElement notificationsIconImpl unit []
