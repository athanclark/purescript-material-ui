module MaterialUI.Icons.LocalShipping where

import React (ReactElement, ReactClass, unsafeCreateElement)


foreign import localShippingIconImpl :: forall props. ReactClass props


localShippingIcon :: ReactElement
localShippingIcon = unsafeCreateElement localShippingIconImpl {} []
