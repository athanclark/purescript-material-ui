module MaterialUI.Icons.Search where

import React (ReactElement, ReactClass, unsafeCreateElement)


foreign import searchIconImpl :: forall props. ReactClass props


searchIcon :: ReactElement
searchIcon = unsafeCreateElement searchIconImpl {} []
