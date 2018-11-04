module MaterialUI.Icons.Brightness3 where

import React (ReactElement, ReactClass, unsafeCreateElement)


foreign import brightness3IconImpl :: forall props. ReactClass props


brightness3Icon :: ReactElement
brightness3Icon = unsafeCreateElement brightness3IconImpl {} []
