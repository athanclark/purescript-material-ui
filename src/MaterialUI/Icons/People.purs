module MaterialUI.Icons.People where

import React (ReactElement, ReactClass, unsafeCreateElement)


foreign import peopleIconImpl :: forall props. ReactClass props


peopleIcon :: ReactElement
peopleIcon = unsafeCreateElement peopleIconImpl {} []
