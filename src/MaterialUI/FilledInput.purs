module MaterialUI.FilledInput
  ( filledInput, FilledInputProps, FilledInputPropsO, FilledInputClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes, class RemoveSymbol)
import MaterialUI.InputBase (InputBasePropsO)

import React (ReactClass, unsafeCreateElement, ReactElement)
import Row.Class (class SubRow)
import Unsafe.Coerce (unsafeCoerce)
import Type.Row (type (+))


foreign import filledInputImpl :: forall props. ReactClass props


type FilledInputProps o =
  {
  | o }


type FilledInputPropsO r =
  ( classes :: Classes
  | r)

type FilledInputClasses =
  ( root :: Styles
  , underline :: Styles
  , focused :: Styles
  , disabled :: Styles
  , adornedStart :: Styles
  , adornedEnd :: Styles
  , error :: Styles
  , multiline :: Styles
  , input :: Styles
  , inputMarginDense :: Styles
  , inputMultiline :: Styles
  , inputAdornedStart :: Styles
  , inputAdornedEnd :: Styles
  )

createClasses :: forall classes
               . SubRow classes FilledInputClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


filledInput :: forall o inputProps inputBaseProps
             . SubRow o (FilledInputPropsO + inputBaseProps)
            => RemoveSymbol "classes" (InputBasePropsO inputProps) inputBaseProps
            => FilledInputProps o -> Array ReactElement -> ReactElement
filledInput = unsafeCreateElement filledInputImpl
