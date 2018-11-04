module MaterialUI.Dialog
  ( dialog, DialogProps, DialogPropsO, DialogClasses
  , MaxWidth, xs, sm, md
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import Prelude
import React (ReactClass, unsafeCreateElement, ReactElement)
import React.SyntheticEvent (SyntheticEvent)
import Row.Class (class SubRow)
import Effect.Uncurried (EffectFn1)
import Unsafe.Coerce (unsafeCoerce)


foreign import dialogImpl :: forall props. ReactClass props


type DialogProps o =
  { open :: Boolean
  | o }


newtype MaxWidth = MaxWidth String

xs :: MaxWidth
xs = MaxWidth "xs"

sm :: MaxWidth
sm = MaxWidth "sm"

md :: MaxWidth
md = MaxWidth "md"


type DialogPropsO eff containerProps transitionProps =
  ( classes                 :: Classes
  , disableBackdropClick    :: Boolean
  , disableEscapeKeyDown    :: Boolean
  , fullScreen              :: Boolean
  , fullWidth               :: Boolean
  , maxWidth                :: MaxWidth
  , container               :: ReactClass containerProps
  , onBackdropClick         :: EffectFn1 SyntheticEvent Unit
  , onClose                 :: EffectFn1 SyntheticEvent Unit
  , onEnter                 :: EffectFn1 SyntheticEvent Unit
  , onEntered               :: EffectFn1 SyntheticEvent Unit
  , onEntering              :: EffectFn1 SyntheticEvent Unit
  , onEscapeKeyDown         :: EffectFn1 SyntheticEvent Unit
  , onExit                  :: EffectFn1 SyntheticEvent Unit
  , onExited                :: EffectFn1 SyntheticEvent Unit
  , onExiting               :: EffectFn1 SyntheticEvent Unit
  , transitionDuration      :: Number
  , transition              :: ReactClass transitionProps
  )


type DialogClasses =
  ( root :: Styles
  , paper :: Styles
  , paperWidthXs :: Styles
  , paperWidthSm :: Styles
  , paperWidthMd :: Styles
  , fullScreen :: Styles
  , fullWidth :: Styles
  )


createClasses :: forall classes
               . SubRow classes DialogClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


dialog :: forall eff o containerProps transitionProps
         . SubRow o (DialogPropsO eff containerProps transitionProps)
        => DialogProps o -> Array ReactElement -> ReactElement
dialog = unsafeCreateElement dialogImpl
