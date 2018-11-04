module MaterialUI.Checkbox
  ( checkbox, CheckboxProps, CheckboxPropsO, CheckboxClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import Prelude
import React (ReactClass, unsafeCreateElement, ReactElement)
import React.SyntheticEvent (SyntheticEvent)
import Row.Class (class SubRow)
import Effect.Uncurried (EffectFn2)
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
  , onChange :: EffectFn2 SyntheticEvent Boolean Unit
  , value :: String
  )

type CheckboxClasses =
  ( "default" :: Styles
  , checked :: Styles
  , disabled :: Styles
  )

createClasses :: forall classes
               . SubRow classes CheckboxClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


checkbox :: forall o eff inputProps
         . SubRow o (CheckboxPropsO eff inputProps)
        => CheckboxProps o -> Array ReactElement -> ReactElement
checkbox = unsafeCreateElement checkboxImpl
