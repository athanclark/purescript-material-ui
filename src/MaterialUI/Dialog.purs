module MaterialUI.Dialog
  ( dialog', DialogProps, DialogPropsO, DialogClasses
  , MaxWidth, xs, sm, md
  ) where

import MaterialUI.Types (Styles)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)


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


type DialogPropsO eff transitionProps classes =
  ( children                :: Array ReactElement
  , classes                 :: classes
  , enterTransitionDuration :: Number
  , fullscreen              :: Boolean
  , ignoreBackdropClick     :: Boolean
  , ignoreEscapeKeyUp       :: Boolean
  , leaveTransitionDuration :: Number
  , maxWidth                :: MaxWidth
  , onBackdropClick         :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onEnter                 :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onEntered               :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onEntering              :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onEscapeKeyUp           :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onExit                  :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onExited                :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onExiting               :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onRequestClose          :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , transition              :: ReactClass transitionProps
  )


type DialogClasses =
  ( root :: Styles
  , paper :: Styles
  , paperWidthXs :: Styles
  , paperWidthSm :: Styles
  , paperWidthMd :: Styles
  , fullscreen :: Styles
  )



dialog' :: forall eff o transitionProps classes
         . Subrow o (DialogPropsO eff transitionProps { | classes })
        => Subrow classes DialogClasses
        => DialogProps o -> Array ReactElement -> ReactElement
dialog' = createElement dialogImpl
