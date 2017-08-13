module MaterialUI.Checkbox
  ( checkbox, CheckboxProps, CheckboxPropsO, CheckboxClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn2)
import Unsafe.Coerce (unsafeCoerce)


foreign import checkboxImpl :: forall props. ReactClass props


type CheckboxProps o =
  {
  | o }


type CheckboxPropsO eff inputProps =
  ( checked :: Boolean
  , checkedClassName :: String
  , checkedIcon :: ReactElement
  , classes :: Classes
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

createClasses :: forall classes
               . Subrow classes CheckboxClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


checkbox :: forall o eff inputProps classes
         . Subrow o (CheckboxPropsO eff inputProps)
        => CheckboxProps o -> Array ReactElement -> ReactElement
checkbox = createElement checkboxImpl
