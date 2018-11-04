module MaterialUI.Icons.ExpandLess where

import React (ReactElement, ReactClass, unsafeCreateElement)


foreign import expandLessIconImpl :: forall props. ReactClass props


expandLessIcon :: ReactElement
expandLessIcon = unsafeCreateElement expandLessIconImpl {} []
