module MaterialUI.DialogContentText
  ( dialogContentText', DialogContentTextProps, DialogContentTextPropsO, DialogContentTextClasses
  ) where

import MaterialUI.Types (Styles)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)


foreign import dialogContentTextImpl :: forall props. ReactClass props


type DialogContentTextProps o =
  {
  | o }


type DialogContentTextPropsO classes =
  ( children :: Array ReactElement
  , classes :: classes
  )

type DialogContentTextClasses =
  ( root :: Styles
  )


dialogContentText' :: forall o classes
         . Subrow o (DialogContentTextPropsO { | classes })
        => Subrow classes DialogContentTextClasses
        => DialogContentTextProps o -> Array ReactElement -> ReactElement
dialogContentText' = createElement dialogContentTextImpl
