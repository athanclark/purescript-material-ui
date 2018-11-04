module MaterialUI.Snackbar
  ( snackbar, SnackbarProps, SnackbarPropsO, SnackbarClasses
  , VerticalOrigin, HorizontalOrigin, left,right,vCenter,bottom,top,hCenter
  , CloseReason, timeout, clickaway
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import Prelude
import React (ReactClass, unsafeCreateElement, ReactElement)
import React.SyntheticEvent (SyntheticEvent)
import Row.Class (class SubRow)
import Data.Time.Duration (Milliseconds)
import Data.Nullable (Nullable)
import Effect.Uncurried (EffectFn1, EffectFn2)
import Unsafe.Coerce (unsafeCoerce)


foreign import snackbarImpl :: forall props. ReactClass props


type SnackbarProps o =
  { open :: Boolean
  | o }

newtype VerticalOrigin = VerticalOrigin String

left :: HorizontalOrigin
left = HorizontalOrigin "left"

right :: HorizontalOrigin
right = HorizontalOrigin "right"

vCenter :: VerticalOrigin
vCenter = VerticalOrigin "center"

newtype HorizontalOrigin = HorizontalOrigin String

bottom :: VerticalOrigin
bottom = VerticalOrigin "bottom"

top :: VerticalOrigin
top = VerticalOrigin "top"

hCenter :: HorizontalOrigin
hCenter = HorizontalOrigin "center"

newtype CloseReason = CloseReason String

instance eqCloseReason :: Eq CloseReason where
  eq (CloseReason x) (CloseReason y) = eq x y

timeout :: CloseReason
timeout = CloseReason "timeout"

clickaway :: CloseReason
clickaway = CloseReason "clickaway"

type SnackbarPropsO eff =
  ( raised :: Boolean
  , anchorOrigin :: {vertical :: VerticalOrigin, horizontal :: HorizontalOrigin}
  , autoHideDuration :: Nullable Milliseconds
  , resumeHideDuration :: Nullable Milliseconds
  , disableWindowBlurListener :: Boolean
  , classes :: Classes
  , key :: String
  , action :: Array ReactElement
  , message :: ReactElement
  , onEnter :: EffectFn1 SyntheticEvent Unit
  , onEntered :: EffectFn1 SyntheticEvent Unit
  , onEntering :: EffectFn1 SyntheticEvent Unit
  , onExit :: EffectFn1 SyntheticEvent Unit
  , onExited :: EffectFn1 SyntheticEvent Unit
  , onExiting :: EffectFn1 SyntheticEvent Unit
  , onClose :: EffectFn2 SyntheticEvent CloseReason Unit
  )

type SnackbarClasses =
  ( root :: Styles
  )

createClasses :: forall classes
               . SubRow classes SnackbarClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


snackbar :: forall o eff
         . SubRow o (SnackbarPropsO eff)
        => SnackbarProps o -> ReactElement
snackbar p = unsafeCreateElement snackbarImpl p []
