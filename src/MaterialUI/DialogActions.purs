module MaterialUI.DialogActions
  ( dialogActions', DialogActionsProps, DialogActionsPropsO, DialogActionsClasses
  ) where

import MaterialUI.Types (Styles)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)


foreign import dialogActionsImpl :: forall props. ReactClass props


type DialogActionsProps o =
  {
  | o }


type DialogActionsPropsO classes =
  ( children :: Array ReactElement
  , classes :: classes
  )

type DialogActionsClasses =
  ( root :: Styles
  , action :: Styles
  , button :: Styles
  )


dialogActions' :: forall o classes
         . Subrow o (DialogActionsPropsO { | classes })
        => Subrow classes DialogActionsClasses
        => DialogActionsProps o -> Array ReactElement -> ReactElement
dialogActions' = createElement dialogActionsImpl
