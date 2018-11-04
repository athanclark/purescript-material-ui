module MaterialUI.Form
  ( formControlLabel, FormControlLabelProps, FormControlLabelPropsO, FormControlLabelClasses
  , formControl, FormControlProps, FormControlPropsO, FormControlClasses
  , formLabel, FormLabelProps, FormLabelPropsO, FormLabelClasses
  , formGroup, FormGroupProps, FormGroupPropsO, FormGroupClasses
  , Margin, none, dense, normal
  ) where

import MaterialUI.Types (Styles, Classes, class CompileStyles, Theme)

import Prelude
import React (ReactClass, unsafeCreateElement, ReactElement, statelessComponent)
import React.SyntheticEvent (SyntheticEvent)
import Row.Class (class SubRow)
import Data.Function.Uncurried (Fn2, runFn2)
import Effect.Uncurried (EffectFn2)
import Type.Row (class RowToList, class ListToRow)


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
  , onChange :: EffectFn2 SyntheticEvent Boolean Unit
  , value :: String
  )

type FormControlLabelClasses =
  ( root :: Styles
  , disabled :: Styles
  , label :: Styles
  )


formControlLabel :: forall eff o
         . SubRow o (FormControlLabelPropsO eff)
        => FormControlLabelProps o -> ReactElement
formControlLabel props = unsafeCreateElement formControlLabelImpl props []


foreign import formGroupImpl :: forall props. ReactClass props


type FormGroupProps o =
  {
  | o }


type FormGroupPropsO =
  ( row :: Boolean
  , classes :: Classes
  )

type FormGroupClasses =
  ( root :: Styles
  , row :: Styles
  )


formGroup :: forall o
         . SubRow o FormGroupPropsO
        => FormGroupProps o -> Array ReactElement -> ReactElement
formGroup = unsafeCreateElement formGroupImpl





foreign import formControlImpl :: forall props. ReactClass props


type FormControlProps o =
  {
  | o }

newtype Margin = Margin String

none :: Margin
none = Margin "none"
dense :: Margin
dense = Margin "dense"
normal :: Margin
normal = Margin "normal"


type FormControlPropsO eff componentProps =
  ( classes :: Classes
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

type FormControlClassesCompiled =
  ( root :: String
  , marginNormal :: String
  , marginDense :: String
  , fullWidth :: String
  )


formControl :: forall eff componentProps o
         . SubRow o (FormControlPropsO eff componentProps)
        => FormControlProps o -> Array ReactElement -> ReactElement
formControl = unsafeCreateElement formControlImpl



foreign import formLabelImpl :: forall props. ReactClass props


type FormLabelProps o =
  {
  | o }


type FormLabelPropsO eff componentProps =
  ( classes :: Classes
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

type FormLabelClassesCompiled =
  ( root :: String
  , focused :: String
  , error :: String
  , disabled :: String
  )


formLabel :: forall eff componentProps o
         . SubRow o (FormLabelPropsO eff componentProps)
        => FormLabelProps o -> Array ReactElement -> ReactElement
formLabel = unsafeCreateElement formLabelImpl


foreign import withStylesImpl :: forall styles compiledStyles a
                               . Fn2 (Theme -> { | styles }) (ReactClass {classes :: { | compiledStyles }}) (ReactClass a)


withStylesFormControl :: forall styles stylesList compiledStyles compiledStylesList
            . SubRow styles FormControlClasses
            => RowToList styles stylesList
            => CompileStyles stylesList compiledStylesList
            => ListToRow compiledStylesList compiledStyles
            => (Theme -> { | styles }) -> ({classes :: { | compiledStyles }} -> ReactElement) -> ReactElement
withStylesFormControl stylesF createElem = unsafeCreateElement (runFn2 withStylesImpl stylesF (statelessComponent createElem)) {} []
