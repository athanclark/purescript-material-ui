module MaterialUI.Select
  ( select, SelectProps, SelectPropsO, SelectClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes, class CompileStyles, Theme)
import MaterialUI.Input (InputPropsO, Value)

import Prelude
import React (Event, ReactClass, createElement, createClassStateless, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Data.Function.Uncurried (Fn2, runFn2)
import Control.Monad.Eff.Uncurried (EffFn1)
import Unsafe.Coerce (unsafeCoerce)
import Type.Row (class RowToList, class ListToRow)


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

type SelectClassesCompiled =
  ( root :: String
  , select :: String
  , selectMenu :: String
  , disabled :: String
  , icon :: String
  )

createClasses :: forall classes
               . Subrow classes SelectClassesCompiled
              => { | classes } -> Classes
createClasses = unsafeCoerce


select :: forall o menuProps iconComponentProps selectDisplayProps eff inputProps inputProps' inputComponentProps both
         . Union (SelectPropsO eff menuProps iconComponentProps selectDisplayProps) (InputPropsO eff inputComponentProps inputProps inputProps') both
        => Subrow o both
        => SelectProps o -> Array ReactElement -> ReactElement
select = createElement selectImpl


foreign import withStylesImpl :: forall styles compiledStyles a
                               . Fn2 (Theme -> { | styles }) (ReactClass {classes :: { | compiledStyles }}) (ReactClass a)

withStyles :: forall styles stylesList compiledStyles compiledStylesList
            . Subrow styles SelectClasses
            => RowToList styles stylesList
            => CompileStyles stylesList compiledStylesList
            => ListToRow compiledStylesList compiledStyles
            => (Theme -> { | styles }) -> ({classes :: { | compiledStyles }} -> ReactElement) -> ReactElement
withStyles stylesF createElem = createElement (runFn2 withStylesImpl stylesF (createClassStateless createElem)) unit []
