module MaterialUI.Icons.ShoppingCart where

import Prelude (unit)
import React (ReactElement, ReactClass, createElement)


foreign import shoppingCartIconImpl :: forall props. ReactClass props


shoppingCartIcon :: ReactElement
shoppingCartIcon = createElement shoppingCartIconImpl unit []
