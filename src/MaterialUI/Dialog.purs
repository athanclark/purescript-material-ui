module MaterialUI.Dialog
  ( dialog, DialogProps, DialogPropsO, DialogClasses
  , MaxWidth, xs, sm, md
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)
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


type DialogPropsO eff transitionProps =
  ( children                :: Array ReactElement
  , classes                 :: Classes
  , disableBackdropClick    :: Boolean
  , disableEscapeKeyDown    :: Boolean
  , fullScreen              :: Boolean
  , fullWidth               :: Boolean
  , maxWidth                :: MaxWidth
  , onBackdropClick         :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onClose                 :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onEnter                 :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onEntered               :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onEntering              :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onEscapeKeyDown         :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onExit                  :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onExited                :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onExiting               :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
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
               . Subrow classes DialogClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


dialog :: forall eff o transitionProps
         . Subrow o (DialogPropsO eff transitionProps)
        => DialogProps o -> Array ReactElement -> ReactElement
dialog = createElement dialogImpl
