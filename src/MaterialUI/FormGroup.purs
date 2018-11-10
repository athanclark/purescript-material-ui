module MaterialUI.FormGroup
  ( formGroup, FormGroupProps, FormGroupPropsO, FormGroupClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import React (ReactClass, unsafeCreateElement, ReactElement)
import Row.Class (class SubRow)
import Unsafe.Coerce (unsafeCoerce)


foreign import formGroupImpl :: forall props. ReactClass props


type FormGroupProps o =
  {
  | o }


type FormGroupPropsO =
  ( classes :: Classes
  , row :: Boolean -- ^ Default: `false`
  )

type FormGroupClasses =
  ( root :: Styles
  , row :: Styles
  )

createClasses :: forall classes
               . SubRow classes FormGroupClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


formGroup :: forall o
           . SubRow o FormGroupPropsO
          => FormGroupProps o -> Array ReactElement -> ReactElement
formGroup = unsafeCreateElement formGroupImpl
