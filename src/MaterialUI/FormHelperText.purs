module MaterialUI.FormHelperText
  ( formHelperText, FormHelperTextProps, FormHelperTextPropsO, FormHelperTextClasses
  , Margin, dense
  , Variant, standard, outlined, filled
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import React (ReactClass, unsafeCreateElement, ReactElement)
import Row.Class (class SubRow)
import Unsafe.Coerce (unsafeCoerce)


foreign import formHelperTextImpl :: forall props. ReactClass props


type FormHelperTextProps o =
  {
  | o }


newtype Margin = Margin String

dense :: Margin
dense = Margin "dense"

newtype Variant = Variant String

standard :: Variant
standard = Variant "standard"

outlined :: Variant
outlined = Variant "outlined"

filled :: Variant
filled = Variant "filled"


type FormHelperTextPropsO componentProps =
  ( classes :: Classes
  , component :: ReactClass componentProps -- ^ Default: `React.DOM.p`
  , disabled :: Boolean
  , error :: Boolean
  , filled :: Boolean
  , focused :: Boolean
  , margin :: Margin
  , required :: Boolean
  , variant :: Variant
  )

type FormHelperTextClasses =
  ( root :: Styles
  , error :: Styles
  , disabled :: Styles
  , marginDense :: Styles
  , contained :: Styles
  , focused :: Styles
  , filled :: Styles
  , required :: Styles
  )

createClasses :: forall classes
               . SubRow classes FormHelperTextClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


formHelperText :: forall o componentProps
                . SubRow o (FormHelperTextPropsO componentProps)
               => FormHelperTextProps o -> Array ReactElement -> ReactElement
formHelperText = unsafeCreateElement formHelperTextImpl
