module MaterialUI.Icons.Refresh where

import React (ReactElement, ReactClass, unsafeCreateElement)


foreign import refreshIconImpl :: forall props. ReactClass props


refreshIcon :: ReactElement
refreshIcon = unsafeCreateElement refreshIconImpl {} []
