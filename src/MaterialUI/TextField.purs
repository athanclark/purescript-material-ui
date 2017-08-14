module MaterialUI.TextField
  ( textField, TextFieldProps, TextFieldPropsO
  , Margin, none, dense, normal
  , Value, stringValue, intValue, numberValue
  ) where

import MaterialUI.Types (Styles, Classes)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)
import Unsafe.Coerce (unsafeCoerce)


foreign import textFieldImpl :: forall props. ReactClass props


type TextFieldProps o =
  {
  | o }


newtype Margin = Margin String

none :: Margin
none = Margin "none"
dense = Margin "dense"
normal = Margin "normal"

foreign import data Value :: Type

stringValue :: String -> Value
stringValue = unsafeCoerce

intValue :: Int -> Value
intValue = unsafeCoerce

numberValue :: Number -> Value
numberValue = unsafeCoerce



type TextFieldPropsO eff formHelperTextProps inputLabelProps inputProps =
  ( "FormHelperTextProps" :: formHelperTextProps
  , "InputClassName" :: String
  , "InputLabelProps" :: inputLabelProps
  , "InputProps" :: inputProps
  , autoComplete :: String
  , autoFocus :: Boolean
  , defaultValue :: String
  , disabled :: Boolean
  , error :: Boolean
  , fullWidth :: Boolean
  , helperText :: ReactElement
  , helperTextClassName :: String
  , id :: String
  , inputClassName :: String
  , inputProps :: inputProps
  -- , inputRef FIXME
  , label :: ReactElement
  , labelClassName :: String
  , margin :: Margin
  , multiline :: Boolean
  , name :: String
  , placeholder :: String
  , required :: Boolean
  -- rootRef FIXME
  , rows :: Int
  , rowsMax :: Int
  , "type" :: String
  , value :: Value
  , onClick :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onChange :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  )


textField :: forall o eff inputProps inputLabelProps formHelperTextProps
         . Subrow o (TextFieldPropsO eff formHelperTextProps inputLabelProps inputProps)
        => TextFieldProps o -> ReactElement
textField p = createElement textFieldImpl p []
