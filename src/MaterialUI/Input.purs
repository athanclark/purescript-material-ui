module MaterialUI.Input
  ( input, InputProps, InputPropsO, InputClasses
  , Value, valueInt, valueNumber, valueString, valueNull, ReadValue (..), readValue
  , Margin, dense, none
  , InputType, textType, buttonType, checkboxType, colorType, dateType, datetimeLocalType, emailType, fileType, hiddenType, imageType, monthType, numberType, passwordType, radioType, rangeType, resetType, searchType, submitType, telType, timeType, urlType, weekType
  , createClasses
  , inputLabel, InputLabelProps, InputLabelPropsO, InputLabelClasses
  , createClassesLabel
  , inputAdornment, InputAdornmentProps, InputAdornmentPropsO, InputAdornmentClasses
  , Position, start, end
  , createClassesAdornment
  ) where

import MaterialUI.Types (Styles, Classes)

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


foreign import inputImpl :: forall props. ReactClass props


type InputProps o =
  {
  | o }


foreign import data Value :: Type

valueInt :: Int -> Value
valueInt = unsafeCoerce

valueNumber :: Number -> Value
valueNumber = unsafeCoerce

valueString :: String -> Value
valueString = unsafeCoerce

valueNull :: Value
valueNull = unsafeCoerce (toNullable Nothing)

data ReadValue
  = ValueInt Int
  | ValueNumber Number
  | ValueString String
  | ValueNull

readValue :: Value -> Either MultipleErrors ReadValue
readValue v = runExcept $ do
  let v' = unsafeToForeign v
  (ValueInt <$> readInt v')
    <|> (ValueNumber <$> readNumber v')
    <|> (ValueString <$> readString v')
    <|> (ValueNull <$ readNull v')

newtype Margin = Margin String

dense :: Margin
dense = Margin "dense"

none :: Margin
none = Margin "none"

newtype InputType = InputType String

textType :: InputType
textType = InputType "text"

buttonType :: InputType
buttonType = InputType "button"

checkboxType :: InputType
checkboxType = InputType "checkbox"

colorType :: InputType
colorType = InputType "color"

dateType :: InputType
dateType = InputType "date"

datetimeLocalType :: InputType
datetimeLocalType = InputType "datetime-local"

emailType :: InputType
emailType = InputType "email"

fileType :: InputType
fileType = InputType "file"

hiddenType :: InputType
hiddenType = InputType "hidden"

imageType :: InputType
imageType = InputType "image"

monthType :: InputType
monthType = InputType "month"

numberType :: InputType
numberType = InputType "number"

passwordType :: InputType
passwordType = InputType "password"

radioType :: InputType
radioType = InputType "radio"

rangeType :: InputType
rangeType = InputType "range"

resetType :: InputType
resetType = InputType "reset"

searchType :: InputType
searchType = InputType "search"

submitType :: InputType
submitType = InputType "submit"

telType :: InputType
telType = InputType "tel"

timeType :: InputType
timeType = InputType "time"

urlType :: InputType
urlType = InputType "url"

weekType :: InputType
weekType = InputType "week"


type InputPropsO eff inputComponentProps inputProps inputProps' =
  ( autoComplete :: String
  , autoFocus :: Boolean
  , className :: String
  , classes :: Classes
  , style :: Styles
  , defaultValue :: Value
  , disableUnderline :: Boolean
  , disabled :: Boolean
  , startAdornment :: Node
  , endAdornment :: Node
  , error :: Boolean
  , fullWidth :: Boolean
  , id :: String
  , inputComponent :: ReactClass inputComponentProps
  , inputProps :: inputProps
  , "InputProps" :: inputProps'
  , margin :: Margin
  , multiline :: Boolean
  , name :: String
  , onChange :: EffectFn1 SyntheticEvent Unit
  , onFocus :: EffectFn1 SyntheticEvent Unit
  , onBlur :: EffectFn1 SyntheticEvent Unit
  , placeholder :: String
  , rows :: Int
  , rowsMax :: Int
  , "type" :: InputType
  , value :: Value
  )

type InputClasses =
  ( root :: Styles
  , formControl :: Styles
  , inkbar :: Styles
  , error :: Styles
  , input :: Styles
  , inputAdorned :: Styles
  , inputDense :: Styles
  , inputDisabled :: Styles
  , inputSingleline :: Styles
  , inputSearch :: Styles
  , inputMultiline :: Styles
  , disabled :: Styles
  , focused :: Styles
  , underline :: Styles
  , multiline :: Styles
  , fullWidth :: Styles
  )

createClasses :: forall classes
               . SubRow classes InputClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


input :: forall o eff inputProps inputProps' inputComponentProps
         . SubRow o (InputPropsO eff inputComponentProps inputProps inputProps')
        => InputProps o -> Array ReactElement -> ReactElement
input = unsafeCreateElement inputImpl

-------------------------------------------------------------------------------------


foreign import inputLabelImpl :: forall props. ReactClass props


type InputLabelProps o =
  {
  | o }

type InputLabelPropsO =
  ( classes :: Classes
  , disableAnimation :: Boolean
  , disabled :: Boolean
  , error :: Boolean
  , focused :: Boolean
  , required :: Boolean
  , shrink :: Boolean
  , htmlFor :: String
  )

type InputLabelClasses =
  ( root :: Styles
  , formControl :: Styles
  , labelDense :: Styles
  , shrink :: Styles
  , animated :: Styles
  , disabled :: Styles
  )


createClassesLabel :: forall classes
               . SubRow classes InputLabelClasses
              => { | classes } -> Classes
createClassesLabel = unsafeCoerce


inputLabel :: forall o
         . SubRow o InputLabelPropsO
        => InputLabelProps o -> Array ReactElement -> ReactElement
inputLabel = unsafeCreateElement inputLabelImpl


----------------------------------------------------------------




foreign import inputAdornmentImpl :: forall props. ReactClass props


type InputAdornmentProps o =
  {
  | o }


newtype Position = Position String

start :: Position
start = Position "start"

end :: Position
end = Position "end"


type InputAdornmentPropsO eff componentProps =
  ( classes :: Classes
  , component :: ReactClass componentProps
  , disableTypography :: Boolean
  , position :: Position
  )

type InputAdornmentClasses =
  ( root :: Styles
  , positionStart :: Styles
  , positionEnd :: Styles
  )

createClassesAdornment :: forall classes
               . SubRow classes InputAdornmentClasses
              => { | classes } -> Classes
createClassesAdornment = unsafeCoerce


inputAdornment :: forall o eff inputAdornmentListProps
         . SubRow o (InputAdornmentPropsO eff inputAdornmentListProps)
        => InputAdornmentProps o -> ReactElement -> ReactElement
inputAdornment p x = unsafeCreateElement inputAdornmentImpl p [x]
