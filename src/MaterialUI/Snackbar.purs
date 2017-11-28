module MaterialUI.Snackbar
  ( snackbar, SnackbarProps, SnackbarPropsO, SnackbarClasses
  , VerticalOrigin, HorizontalOrigin, left,right,vCenter,bottom,top,hCenter
  , CloseReason, timeout, clickaway
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Data.Time.Duration (Milliseconds)
import Control.Monad.Eff.Uncurried (EffFn1, EffFn2)
import Unsafe.Coerce (unsafeCoerce)


foreign import snackbarImpl :: forall props. ReactClass props


type SnackbarProps o =
  { open :: Boolean
  | o }

newtype VerticalOrigin = VerticalOrigin String

left :: VerticalOrigin
left = VerticalOrigin "left"

right :: VerticalOrigin
right = VerticalOrigin "right"

vCenter :: VerticalOrigin
vCenter = VerticalOrigin "center"

newtype HorizontalOrigin = HorizontalOrigin String

bottom :: HorizontalOrigin
bottom = HorizontalOrigin "bottom"

top :: HorizontalOrigin
top = HorizontalOrigin "top"

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
  , autoHideDuration :: Milliseconds
  , resumeHideDuration :: Milliseconds
  , children :: Array ReactElement
  , classes :: Classes
  , key :: String
  , action :: Array ReactElement
  , message :: ReactElement
  , onEnter :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onEntered :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onEntering :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onExit :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onExited :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onExiting :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onRequestClose :: EffFn2 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event CloseReason Unit
  )

type SnackbarClasses =
  ( root :: Styles
  )

createClasses :: forall classes
               . Subrow classes SnackbarClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


snackbar :: forall o eff
         . Subrow o (SnackbarPropsO eff)
        => SnackbarProps o -> ReactElement
snackbar p = createElement snackbarImpl p []
