module MaterialUI.TextField
  ( textField, TextFieldProps, TextFieldPropsO
  ) where

import MaterialUI.Input (InputPropsO)

import Prelude
import React (ReactClass, unsafeCreateElement, ReactElement, SyntheticEventHandler)
import React.SyntheticEvent (SyntheticEvent)
import Row.Class (class SubRow)
import Effect.Uncurried (EffectFn1)
import Prim.Row (class Union)


foreign import textFieldImpl :: forall props. ReactClass props


type TextFieldProps o =
  {
  | o }




type TextFieldPropsO formHelperTextProps inputLabelProps selectProps =
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
  , onClick :: SyntheticEventHandler SyntheticEvent
  )


textField :: forall o eff both inputProps inputProps' inputComponentProps inputLabelProps
             formHelperTextProps selectProps
           . SubRow o both
          => Union (TextFieldPropsO formHelperTextProps inputLabelProps selectProps)
                   (InputPropsO eff inputComponentProps inputProps inputProps') both
          => TextFieldProps o -> Array ReactElement -> ReactElement
textField p = unsafeCreateElement textFieldImpl p
