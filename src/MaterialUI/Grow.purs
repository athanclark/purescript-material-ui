module MaterialUI.Grow
  ( grow, GrowProps
  ) where

import React.Transition (TransitionProps)
import React (ReactClass, unsafeCreateElement, ReactElement)
import Row.Class (class SubRow)
import Type.Row (type (+))


foreign import growImpl :: forall props. ReactClass props


type GrowProps o =
  {
  | o }


grow :: forall o
      . SubRow o (TransitionProps + ())
     => GrowProps o -> Array ReactElement -> ReactElement
grow = unsafeCreateElement growImpl
