module MaterialUI.Input
  ( input, InputProps, InputPropsO, InputClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes, class RemoveSymbol)
import MaterialUI.InputBase (InputBasePropsO)

import Prelude
import React (ReactClass, unsafeCreateElement, ReactElement)
import React.SyntheticEvent (SyntheticEvent)
import Row.Class (class SubRow)
import Data.Either (Either)
import Data.Maybe (Maybe (Nothing))
import Foreign (readNumber, readString, readInt, readNull, unsafeToForeign, MultipleErrors)
import Data.Nullable (toNullable)
import Control.Alternative ((<|>))
import Control.Monad.Except (runExcept)
import Effect.Uncurried (EffectFn1)
import Unsafe.Coerce (unsafeCoerce)
import Web.DOM.Internal.Types (Node)
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
