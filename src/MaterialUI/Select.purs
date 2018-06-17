module MaterialUI.Select
  ( select, SelectProps, SelectPropsO, SelectClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)
import MaterialUI.Input (InputPropsO, Value)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Data.Argonaut (Json)
import Control.Monad.Eff.Uncurried (EffFn1)
import Unsafe.Coerce (unsafeCoerce)


foreign import selectImpl :: forall props. ReactClass props


type SelectProps o =
  {
  | o }


type SelectPropsO eff menuProps iconComponentProps selectDisplayProps =
  ( autoWidth :: Boolean
  , children :: Array ReactElement
  -- , classes :: Classes
  , displayEmpty :: Boolean
  , "IconComponent" :: ReactClass iconComponentProps
  , input :: ReactElement
  -- , inputProps :: inputProps
  , "MenuProps" :: menuProps
  , multiple :: Boolean
  , native :: Boolean
  -- , onChange :: EffFn2 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event (Nullable ReactElement) Unit
  , onClose :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onOpen :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , open :: Boolean
  , renderValue :: Value -> ReactElement
  , "SelectDisplayProps" :: selectDisplayProps
  -- , value :: Value
  )

type SelectClasses =
  ( root :: Styles
  , select :: Styles
  , selectMenu :: Styles
  , disabled :: Styles
  , icon :: Styles
  )

createClasses :: forall classes
               . Subrow classes SelectClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


select :: forall o menuProps iconComponentProps selectDisplayProps eff inputProps inputProps' inputComponentProps both
         . Union (SelectPropsO eff menuProps iconComponentProps selectDisplayProps) (InputPropsO eff inputComponentProps inputProps inputProps') both
        => Subrow o both
        => SelectProps o -> Array ReactElement -> ReactElement
select = createElement selectImpl
