module MaterialUI.Chip
  ( chip, ChipProps, ChipPropsO, ChipClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)
import Unsafe.Coerce (unsafeCoerce)


foreign import chipImpl :: forall props. ReactClass props


type ChipProps o =
  {
  | o }


type ChipPropsO eff =
  ( avatar :: ReactElement
  , classes :: Classes
  , deleteIcon :: ReactElement
  , label :: ReactElement
  , onDelete :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onClick :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
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

createClasses :: forall classes
               . Subrow classes ChipClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


chip :: forall o eff classes
         . Subrow o (ChipPropsO eff)
        => ChipProps o -> ReactElement
chip p = createElement chipImpl p []
