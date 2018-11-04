module MaterialUI.Icons.AccountBox where

import React (ReactElement, ReactClass, unsafeCreateElement)


foreign import accountBoxIconImpl :: forall props. ReactClass props


accountBoxIcon :: ReactElement
accountBoxIcon = unsafeCreateElement accountBoxIconImpl {} []
