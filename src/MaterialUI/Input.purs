module MaterialUI.Input
  ( input, InputProps, InputPropsO, InputClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes, class RemoveSymbol)
import MaterialUI.InputBase (InputBasePropsO)

import React (ReactClass, unsafeCreateElement, ReactElement)
import Row.Class (class SubRow)
import Unsafe.Coerce (unsafeCoerce)
import Type.Row (type (+))


foreign import inputImpl :: forall props. ReactClass props


type InputProps o =
  {
  | o }


type InputPropsO r =
  ( classes :: Classes
  , disableUnderline :: Boolean
  | r)

type InputClasses =
  ( root :: Styles
  , formControl :: Styles
  , focused :: Styles
  , disabled :: Styles
  , underline :: Styles
  , error :: Styles
  , multiline :: Styles
  , fullWidth :: Styles
  , input :: Styles
  , inputMarginDense :: Styles
  , inputMultiline :: Styles
  , inputType :: Styles
  , inputTypeSearch :: Styles
  )

createClasses :: forall classes
               . SubRow classes InputClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


input :: forall o inputProps inputBaseProps
       . SubRow o (InputPropsO + inputBaseProps)
      => RemoveSymbol "classes" (InputBasePropsO inputProps) inputBaseProps
      => InputProps o -> Array ReactElement -> ReactElement
input = unsafeCreateElement inputImpl
