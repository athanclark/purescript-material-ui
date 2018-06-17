module MaterialUI.Icons.People where

import Prelude (unit)
import React (ReactElement, ReactClass, createElement)


foreign import peopleIconImpl :: forall props. ReactClass props


peopleIcon :: ReactElement
peopleIcon = createElement peopleIconImpl unit []
