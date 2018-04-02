module MaterialUI.Icons.LocalShipping where

import Prelude (unit)
import React (ReactElement, ReactClass, createElement)


foreign import localShippingIconImpl :: forall props. ReactClass props


localShippingIcon :: ReactElement
localShippingIcon = createElement localShippingIconImpl unit []
