module MaterialUI.DialogContentText
  ( dialogContentText, DialogContentTextProps, DialogContentTextPropsO, DialogContentTextClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)
import Unsafe.Coerce (unsafeCoerce)


foreign import dialogContentTextImpl :: forall props. ReactClass props


type DialogContentTextProps o =
  {
  | o }


type DialogContentTextPropsO =
  ( children :: Array ReactElement
  , classes :: Classes
  )

type DialogContentTextClasses =
  ( root :: Styles
  )

createClasses :: forall classes
               . Subrow classes DialogContentTextClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


dialogContentText :: forall o
         . Subrow o DialogContentTextPropsO
        => DialogContentTextProps o -> Array ReactElement -> ReactElement
dialogContentText = createElement dialogContentTextImpl
