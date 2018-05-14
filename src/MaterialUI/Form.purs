module MaterialUI.Form
  ( formControlLabel, FormControlLabelProps, FormControlLabelPropsO, FormControlLabelClasses
  , formControl, FormControlProps, FormControlPropsO, FormControlClasses
  , formLabel, FormLabelProps, FormLabelPropsO, FormLabelClasses
  , formGroup, FormGroupProps, FormGroupPropsO, FormGroupClasses
  , Margin, none, dense, normal
  ) where

import MaterialUI.Types (Styles, Classes)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn2)
import Unsafe.Coerce (unsafeCoerce)


foreign import formControlLabelImpl :: forall props. ReactClass props


type FormControlLabelProps o =
  {
  | o }


type FormControlLabelPropsO eff =
  ( checked :: Boolean
  , classes :: Classes
  , control :: ReactElement
  , disabled :: Boolean
  , label :: ReactElement
  , name :: String
  , onChange :: EffFn2 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Boolean Unit
  , value :: String
  )

type FormControlLabelClasses =
  ( root :: Styles
  , disabled :: Styles
  , label :: Styles
  )


formControlLabel :: forall eff o
         . Subrow o (FormControlLabelPropsO eff)
        => FormControlLabelProps o -> ReactElement
formControlLabel props = createElement formControlLabelImpl props []


foreign import formGroupImpl :: forall props. ReactClass props


type FormGroupProps o =
  {
  | o }


type FormGroupPropsO =
  ( row :: Boolean
  , classes :: Classes
  , children :: Array ReactElement
  )

type FormGroupClasses =
  ( root :: Styles
  , row :: Styles
  )


formGroup :: forall o
         . Subrow o FormGroupPropsO
        => FormGroupProps o -> Array ReactElement -> ReactElement
formGroup = createElement formGroupImpl





foreign import formControlImpl :: forall props. ReactClass props


type FormControlProps o =
  {
  | o }

newtype Margin = Margin String

none = Margin "none"
dense = Margin "dense"
normal = Margin "normal"


type FormControlPropsO eff componentProps =
  ( children :: Array ReactElement
  , classes :: Classes
  , component :: ReactClass componentProps
  , disabled :: Boolean
  , error :: Boolean
  , fullWidth :: Boolean
  , margin :: Margin
  , required :: Boolean
  )

type FormControlClasses =
  ( root :: Styles
  , marginNormal :: Styles
  , marginDense :: Styles
  , fullWidth :: Styles
  )


formControl :: forall eff componentProps o
         . Subrow o (FormControlPropsO eff componentProps)
        => FormControlProps o -> Array ReactElement -> ReactElement
formControl = createElement formControlImpl



foreign import formLabelImpl :: forall props. ReactClass props


type FormLabelProps o =
  {
  | o }


type FormLabelPropsO eff componentProps =
  ( children :: Array ReactElement
  , classes :: Classes
  , component :: ReactClass componentProps
  , disabled :: Boolean
  , error :: Boolean
  , focused :: Boolean
  , required :: Boolean
  )

type FormLabelClasses =
  ( root :: Styles
  , focused :: Styles
  , error :: Styles
  , disabled :: Styles
  )


formLabel :: forall eff componentProps o
         . Subrow o (FormLabelPropsO eff componentProps)
        => FormLabelProps o -> Array ReactElement -> ReactElement
formLabel = createElement formLabelImpl
