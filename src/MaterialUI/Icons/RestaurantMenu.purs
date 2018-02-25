module MaterialUI.Icons.RestaurantMenu where

import Prelude (unit)
import React (ReactElement, ReactClass, createElement)


foreign import restaurantMenuIconImpl :: forall props. ReactClass props


restaurantMenuIcon :: ReactElement
restaurantMenuIcon = createElement restaurantMenuIconImpl unit []
