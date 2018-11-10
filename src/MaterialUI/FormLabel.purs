module MaterialUI.FormLabel
  ( formLabel, FormLabelProps, FormLabelPropsO, FormLabelClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import React (ReactClass, unsafeCreateElement, ReactElement)
import Row.Class (class SubRow)
import Unsafe.Coerce (unsafeCoerce)


foreign import formLabelImpl :: forall props. ReactClass props


type FormLabelProps o =
  {
  | o }


type FormLabelPropsO componentProps =
  ( classes :: Classes
  , component :: ReactClass componentProps -- ^ Default: `React.DOM.label`
  , disabled :: Boolean
  , error :: Boolean
  , filled :: Boolean
  , focused :: Boolean
  , required :: Boolean
  )

type FormLabelClasses =
  ( root :: Styles
  , focused :: Styles
  , disabled :: Styles
  , error :: Styles
  , filled :: Styles
  , required :: Styles
  )

createClasses :: forall classes
               . SubRow classes FormLabelClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


formLabel :: forall o componentProps
           . SubRow o (FormLabelPropsO componentProps)
          => FormLabelProps o -> Array ReactElement -> ReactElement
formLabel = unsafeCreateElement formLabelImpl
