module MaterialUI.DialogContent
  ( dialogContent', DialogContentProps, DialogContentPropsO, DialogContentClasses
  ) where

import MaterialUI.Types (Styles)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)


foreign import dialogContentImpl :: forall props. ReactClass props


type DialogContentProps o =
  {
  | o }


type DialogContentPropsO classes =
  ( children :: Array ReactElement
  , classes :: classes
  )

type DialogContentClasses =
  ( root :: Styles
  )


dialogContent' :: forall o classes
         . Subrow o (DialogContentPropsO { | classes })
        => Subrow classes DialogContentClasses
        => DialogContentProps o -> Array ReactElement -> ReactElement
dialogContent' = createElement dialogContentImpl
