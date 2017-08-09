module MaterialUI.Chip
  ( chip', ChipProps, ChipPropsO, ChipClasses
  ) where

import MaterialUI.Types (Styles)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)


foreign import chipImpl :: forall props. ReactClass props


type ChipProps o =
  {
  | o }


type ChipPropsO eff classes =
  ( avatar :: ReactElement
  , classes :: classes
  , label :: ReactElement
  , onRequestDelete :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  )

type ChipClasses =
  ( root :: Styles
  , clickable :: Styles
  , deletable :: Styles
  , avatar :: Styles
  , avatarChildren :: Styles
  , label :: Styles
  , deleteIcon :: Styles
  )


chip' :: forall o eff classes
         . Subrow o (ChipPropsO eff { | classes })
        => Subrow classes ChipClasses
        => ChipProps o -> Array ReactElement -> ReactElement
chip' = createElement chipImpl
