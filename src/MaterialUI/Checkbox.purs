module MaterialUI.Checkbox
  ( checkbox, CheckboxProps, CheckboxPropsO, CheckboxClasses
  , Color, primary, secondary, default
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import Prelude
import Data.Nullable (Nullable)
import React (ReactClass, unsafeCreateElement, ReactElement, SyntheticEventHandler, ReactRef)
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
  , checkedIcon :: ReactElement
  , classes :: Classes
  , color :: Color
  , disabled :: Boolean
  , disableRipple :: Boolean
  , icon :: ReactElement
  , id :: String
  , indeterminate :: Boolean -- ^ Default: `false`
  , indeterminateIcon :: ReactElement
  , inputProps :: inputProps
  , inputRef :: SyntheticEventHandler (Nullable ReactRef)
  , onChange :: EffectFn2 SyntheticEvent Boolean Unit
  , "type" :: String -- ^ Input type
  , value :: String
  )

newtype Color = Color String

primary :: Color
primary = Color "primary"

secondary :: Color
secondary = Color "secondary"

default :: Color
default = Color "default"

type CheckboxClasses =
  ( root :: Styles
  , checked :: Styles
  , disabled :: Styles
  , indeterminate :: Styles
  , colorPrimary :: Styles
  , colorSecondary :: Styles
  )

createClasses :: forall classes
               . SubRow classes CheckboxClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


checkbox :: forall o eff inputProps
         . SubRow o (CheckboxPropsO eff inputProps)
        => CheckboxProps o -> Array ReactElement -> ReactElement
checkbox = unsafeCreateElement checkboxImpl
