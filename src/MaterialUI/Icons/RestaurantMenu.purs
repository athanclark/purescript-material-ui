module MaterialUI.Icons.RestaurantMenu where

import React (ReactElement, ReactClass, unsafeCreateElement)


foreign import restaurantMenuIconImpl :: forall props. ReactClass props


restaurantMenuIcon :: ReactElement
restaurantMenuIcon = unsafeCreateElement restaurantMenuIconImpl {} []
