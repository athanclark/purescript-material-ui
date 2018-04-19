module MaterialUI.TextField
  ( textField, TextFieldProps, TextFieldPropsO
  ) where

import MaterialUI.Types (Styles, Classes)
import MaterialUI.Input (InputPropsO)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)
import Unsafe.Coerce (unsafeCoerce)


foreign import textFieldImpl :: forall props. ReactClass props


type TextFieldProps o =
  {
  | o }




type TextFieldPropsO eff formHelperTextProps inputLabelProps selectProps =
  ( "FormHelperTextProps" :: formHelperTextProps
  , "InputClassName" :: String
  , "InputLabelProps" :: inputLabelProps
  , "SelectProps" :: selectProps
  , helperText :: ReactElement
  , helperTextClassName :: String
  , inputClassName :: String
  -- , inputRef FIXME
  , label :: ReactElement
  , labelClassName :: String
  , required :: Boolean
  , select :: Boolean
  -- rootRef FIXME
  , onClick :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  )


textField :: forall o eff both inputProps inputComponentProps inputLabelProps formHelperTextProps selectProps
         . Subrow o both
        => Union (TextFieldPropsO eff formHelperTextProps inputLabelProps selectProps) (InputPropsO eff inputComponentProps inputProps) both
        => TextFieldProps o -> Array ReactElement -> ReactElement
textField p = createElement textFieldImpl p
