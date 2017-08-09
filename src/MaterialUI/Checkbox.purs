module MaterialUI.Checkbox
  ( checkbox', CheckboxProps, CheckboxPropsO, CheckboxClasses
  ) where

import MaterialUI.Types (Styles)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn2)


foreign import checkboxImpl :: forall props. ReactClass props


type CheckboxProps o =
  {
  | o }


type CheckboxPropsO eff inputProps classes =
  ( checked :: Boolean
  , checkedClassName :: String
  , checkedIcon :: ReactElement
  , classes :: classes
  , disableRipple :: Boolean
  , disabled :: Boolean
  , disabledClassName :: String
  , icon :: ReactElement
  , indeterminate :: Boolean
  , indeterminateIcon :: ReactElement
  , inputProps :: inputProps
  , name :: String
  , onChange :: EffFn2 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite) Event Boolean Unit
  , value :: String
  )

type CheckboxClasses =
  ( "default" :: Styles
  , checked :: Styles
  , disabled :: Styles
  )


checkbox' :: forall o eff inputProps classes
         . Subrow o (CheckboxPropsO eff inputProps { | classes })
        => Subrow classes CheckboxClasses
        => CheckboxProps o -> Array ReactElement -> ReactElement
checkbox' = createElement checkboxImpl
