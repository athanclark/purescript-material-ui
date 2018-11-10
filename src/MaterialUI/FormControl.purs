module MaterialUI.FormControl
  ( formControl, FormControlProps, FormControlPropsO, FormControlClasses
  , Margin, none, dense, normal
  , Variant, standard, outlined, filled
  ) where

import MaterialUI.Types (Styles, Classes, class CompileStyles, Theme)

import Prelude
import React (ReactClass, unsafeCreateElement, ReactElement, statelessComponent)
import React.SyntheticEvent (SyntheticEvent)
import Row.Class (class SubRow)
import Data.Function.Uncurried (Fn2, runFn2)
import Effect.Uncurried (EffectFn2)
import Type.Row (class RowToList, class ListToRow)


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

newtype Variant = Variant String

standard :: Variant
standard = Variant "standard"
outlined :: Variant
outlined = Variant "outlined"
filled :: Variant
filled = Variant "filled"


type FormControlPropsO componentProps =
  ( classes :: Classes
  , component :: ReactClass componentProps -- ^ Default: `div`
  , disabled :: Boolean -- ^ Default: `false`
  , error :: Boolean -- ^ Default: `false`
  , fullWidth :: Boolean -- ^ Default: `false`
  , margin :: Margin -- ^ Default: `none`
  , required :: Boolean -- ^ Default: `false`
  , variant :: Variant -- ^ Default: `standard`
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


formControl :: forall componentProps o
             . SubRow o (FormControlPropsO componentProps)
            => FormControlProps o -> Array ReactElement -> ReactElement
formControl = unsafeCreateElement formControlImpl


