module MaterialUI.TextField
  ( textField, TextFieldProps, TextFieldPropsO
  ) where

import MaterialUI.FormControl (FormControlPropsO)
import MaterialUI.InputBase (InputType, Value)

import React (ReactClass, unsafeCreateElement, ReactElement, SyntheticEventHandler, ReactRef)
import React.SyntheticEvent (SyntheticEvent)
import Data.Nullable (Nullable)
import Row.Class (class SubRow)
import Type.Row (type (+))


foreign import textFieldImpl :: forall props. ReactClass props


type TextFieldProps o =
  {
  | o }



type TextFieldPropsO formHelperTextProps inputLabelProps inputProps selectProps r =
  ( autoComplete :: String
  , autoFocus :: Boolean
  , defaultValue :: Value
  , "FormHelperTextProps" :: formHelperTextProps
  , helperText :: ReactElement
  , id :: String
  , "InputLabelProps" :: inputLabelProps
  , "InputProps" :: inputProps
  , inputProps :: inputProps
  , inputRef :: SyntheticEventHandler (Nullable ReactRef)
  , label :: ReactElement
  , multiline :: Boolean
  , name :: String
  , onChange :: SyntheticEventHandler SyntheticEvent
  , placeholder :: String
  , rows :: Int
  , rowsMax :: Int
  , select :: Boolean
  , "SelectProps" :: selectProps
  , "type" :: InputType
  , value :: Value
  | r)


textField :: forall o inputProps inputLabelProps
             formHelperTextProps selectProps componentProps
           . SubRow o (TextFieldPropsO formHelperTextProps inputLabelProps inputProps selectProps
                       + FormControlPropsO componentProps)
          => TextFieldProps o -> Array ReactElement -> ReactElement
textField p = unsafeCreateElement textFieldImpl p
