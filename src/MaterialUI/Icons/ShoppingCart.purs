module MaterialUI.Icons.ShoppingCart where

import React (ReactElement, ReactClass, unsafeCreateElement)


foreign import shoppingCartIconImpl :: forall props. ReactClass props


shoppingCartIcon :: ReactElement
shoppingCartIcon = unsafeCreateElement shoppingCartIconImpl {} []
