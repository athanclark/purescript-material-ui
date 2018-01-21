module MaterialUI.Icons.Search where

import Prelude (unit)
import React (ReactElement, ReactClass, createElement)


foreign import searchIconImpl :: forall props. ReactClass props


searchIcon :: ReactElement
searchIcon = createElement searchIconImpl unit []
