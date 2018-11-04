module MaterialUI.Icons.Notifications where

import React (ReactElement, ReactClass, unsafeCreateElement)


foreign import notificationsIconImpl :: forall props. ReactClass props


notificationsIcon :: ReactElement
notificationsIcon = unsafeCreateElement notificationsIconImpl {} []
