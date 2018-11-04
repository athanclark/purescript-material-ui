module MaterialUI.Select
  ( select, SelectProps, SelectPropsO, SelectClasses
  , createClasses
  , withStyles
  ) where

import MaterialUI.Types (Styles, Classes, class CompileStyles, Theme)
import MaterialUI.Input (InputPropsO, Value)

import Prelude
import React (ReactClass, unsafeCreateElement, ReactElement, statelessComponent)
import React.SyntheticEvent (SyntheticEvent)
import Row.Class (class SubRow)
import Data.Function.Uncurried (Fn2, runFn2)
import Effect.Uncurried (EffectFn1)
import Unsafe.Coerce (unsafeCoerce)
import Type.Row (class RowToList, class ListToRow)
import Prim.Row (class Union)


foreign import selectImpl :: forall props. ReactClass props


type SelectProps o =
  {
  | o }


type SelectPropsO eff menuProps iconComponentProps selectDisplayProps =
  ( autoWidth :: Boolean
  -- , classes :: Classes
  , displayEmpty :: Boolean
  , "IconComponent" :: ReactClass iconComponentProps
  , input :: ReactElement
  -- , inputProps :: inputProps
  , "MenuProps" :: menuProps
  , multiple :: Boolean
  , native :: Boolean
  -- , onChange :: EffectFn2 SyntheticEvent (Nullable ReactElement) Unit
  , onClose :: EffectFn1 SyntheticEvent Unit
  , onOpen :: EffectFn1 SyntheticEvent Unit
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
               . SubRow classes SelectClassesCompiled
              => { | classes } -> Classes
createClasses = unsafeCoerce


select :: forall o menuProps iconComponentProps selectDisplayProps eff inputProps inputProps' inputComponentProps both
         . Union (SelectPropsO eff menuProps iconComponentProps selectDisplayProps) (InputPropsO eff inputComponentProps inputProps inputProps') both
        => SubRow o both
        => SelectProps o -> Array ReactElement -> ReactElement
select = unsafeCreateElement selectImpl


foreign import withStylesImpl :: forall styles compiledStyles a
                               . Fn2 (Theme -> { | styles }) (ReactClass {classes :: { | compiledStyles }}) (ReactClass a)

withStyles :: forall styles stylesList compiledStyles compiledStylesList
            . SubRow styles SelectClasses
            => RowToList styles stylesList
            => CompileStyles stylesList compiledStylesList
            => ListToRow compiledStylesList compiledStyles
            => (Theme -> { | styles }) -> ({classes :: { | compiledStyles }} -> ReactElement) -> ReactElement
withStyles stylesF createElem = unsafeCreateElement (runFn2 withStylesImpl stylesF (statelessComponent createElem)) {} []
