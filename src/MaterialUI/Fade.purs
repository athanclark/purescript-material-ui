module MaterialUI.Fade
  ( fade, FadeProps
  ) where

import React.Transition (TransitionProps)
import React (ReactClass, unsafeCreateElement, ReactElement)
import Row.Class (class SubRow)
import Type.Row (type (+))


foreign import fadeImpl :: forall props. ReactClass props


type FadeProps o =
  {
  | o }


fade :: forall o
      . SubRow o (TransitionProps + ())
     => FadeProps o -> Array ReactElement -> ReactElement
fade = unsafeCreateElement fadeImpl
