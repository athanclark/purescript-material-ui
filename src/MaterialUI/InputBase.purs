module MaterialUI.InputBase
  ( inputBase, InputBaseProps, InputBasePropsO, InputBaseClasses
  , Value, valueInt, valueNumber, valueString, valueNull, ReadValue (..), readValue
  , Margin, dense, none
  , InputType, textType, buttonType, checkboxType, colorType, dateType, datetimeLocalType, emailType, fileType, hiddenType, imageType, monthType, numberType, passwordType, radioType, rangeType, resetType, searchType, submitType, telType, timeType, urlType, weekType
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import Prelude
import React (ReactClass, unsafeCreateElement, ReactElement, SyntheticEventHandler, ReactRef)
import React.SyntheticEvent (SyntheticEvent)
import Row.Class (class SubRow)
import Data.Either (Either)
import Data.Maybe (Maybe (Nothing))
import Data.Nullable (Nullable, toNullable)
import Foreign (readNumber, readString, readInt, readNull, unsafeToForeign, MultipleErrors)
import Control.Alternative ((<|>))
import Control.Monad.Except (runExcept)
import Unsafe.Coerce (unsafeCoerce)
import Web.DOM.Internal.Types (Node)


foreign import inputBaseImpl :: forall props. ReactClass props


type InputBaseProps o =
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


type InputBasePropsO inputProps =
  ( autoComplete :: String
  , autoFocus :: Boolean
  , classes :: Classes
  , className :: String
  , defaultValue :: Value
  , disabled :: Boolean
  , endAdornment :: Node
  , error :: Boolean
  , fullWidth :: Boolean -- ^ Default: `false`
  , id :: String
  , inputComponent :: ReactClass inputProps
  , inputProps :: inputProps
  , inputRef :: SyntheticEventHandler (Nullable ReactRef)
  , margin :: Margin
  , multiline :: Boolean -- ^ Default: `false`
  , name :: String
  , onChange :: SyntheticEventHandler SyntheticEvent
  , placeholder :: String
  , readOnly :: Boolean
  , required :: Boolean
  , rows :: Int
  , rowsMax :: Int
  , startAdornment :: Node
  , "type" :: InputType -- ^ Default: `text`
  , value :: Value
  )

type InputBaseClasses =
  ( root :: Styles
  , formControl :: Styles
  , focused :: Styles
  , disabled :: Styles
  , adornedStart :: Styles
  , adornedEnd :: Styles
  , error :: Styles
  , marginDense :: Styles
  , multiline :: Styles
  , fullWidth :: Styles
  , input :: Styles
  , inputMarginDense :: Styles
  , inputMultiline :: Styles
  , inputType :: Styles
  , inputTypeSearch :: Styles
  , inputAdornedStart :: Styles
  , inputAdornedEnd :: Styles
  )

createClasses :: forall classes
               . SubRow classes InputBaseClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


inputBase :: forall o inputProps
         . SubRow o (InputBasePropsO inputProps)
        => InputBaseProps o -> Array ReactElement -> ReactElement
inputBase = unsafeCreateElement inputBaseImpl
