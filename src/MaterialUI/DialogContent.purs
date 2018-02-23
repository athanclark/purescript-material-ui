module MaterialUI.DialogContent
  ( dialogContent, DialogContentProps, DialogContentPropsO, DialogContentClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)
import Unsafe.Coerce (unsafeCoerce)


foreign import dialogContentImpl :: forall props. ReactClass props


type DialogContentProps o =
  {
  | o }


type DialogContentPropsO =
  ( children :: Array ReactElement
  , classes :: Classes
  , style :: Styles
  )

type DialogContentClasses =
  ( root :: Styles
  )

createClasses :: forall classes
               . Subrow classes DialogContentClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


dialogContent :: forall o
         . Subrow o DialogContentPropsO
        => DialogContentProps o -> Array ReactElement -> ReactElement
dialogContent = createElement dialogContentImpl
