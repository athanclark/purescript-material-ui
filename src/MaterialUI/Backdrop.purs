module MaterialUI.Backdrop
  ( backdrop, BackdropProps, BackdropPropsO, BackdropClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import Data.Time.Duration (Milliseconds)
import Data.Nullable (Nullable)
import React (ReactClass, unsafeCreateElement, ReactElement)
import Row.Class (class SubRow)
import Unsafe.Coerce (unsafeCoerce)


foreign import backdropImpl :: forall props. ReactClass props


type BackdropProps o =
  { open :: Boolean
  | o }


type BackdropPropsO =
  ( invisible :: Boolean
  , transitionDuration :: { enter :: Nullable Milliseconds, exit :: Nullable Milliseconds }
  )


type BackdropClasses =
  ( root :: Styles
  , invisible :: Styles
  )

createClasses :: forall classes
               . SubRow classes BackdropClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


backdrop :: forall o
         . SubRow o BackdropPropsO
        => BackdropProps o -> Array ReactElement -> ReactElement
backdrop = unsafeCreateElement backdropImpl
