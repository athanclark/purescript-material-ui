module MaterialUI.Select
  ( select, SelectProps, SelectPropsO, SelectClasses
  , withStyles
  ) where

import MaterialUI.Types (Styles, Classes, class CompileStyles, Theme, class RemoveSymbol)
import MaterialUI.Input (InputPropsO)
import MaterialUI.InputBase (Value, InputBasePropsO)

import Prelude
import React (ReactClass, unsafeCreateElement, ReactElement, statelessComponent, SyntheticEventHandler)
import React.SyntheticEvent (SyntheticEvent)
import Row.Class (class SubRow)
import Data.Function.Uncurried (Fn2, runFn2)
import Data.Nullable (Nullable)
import Effect.Uncurried (EffectFn2)
import Unsafe.Coerce (unsafeCoerce)
import Type.Row (class RowToList, class ListToRow, type (+))


foreign import selectImpl :: forall props. ReactClass props


type SelectProps o =
  {
  | o }


type SelectPropsO iconComponentProps menuProps selectDisplayProps r =
  ( autoWidth :: Boolean -- ^ Default: `false`
  , classes :: Classes
  , displayEmpty :: Boolean -- ^ Default: `false`
  , "IconComponent" :: ReactClass iconComponentProps -- ^ Default: `ArrowDropDownIcon`
  , input :: ReactElement -- ^ Default: `Input`
  , "MenuProps" :: menuProps
  , multiple :: Boolean -- ^ Default: `false`
  , native :: Boolean -- ^ Default: `false`
  , onChange :: EffectFn2 SyntheticEvent (Nullable ReactElement) Unit
  , onClose :: SyntheticEventHandler SyntheticEvent
  , onOpen :: SyntheticEventHandler SyntheticEvent
  , open :: Boolean
  , renderValue :: Value -> ReactElement
  , "SelectDisplayProps" :: selectDisplayProps
  | r)

type SelectClasses =
  ( root :: Styles
  , select :: Styles
  , filled :: Styles
  , outlined :: Styles
  , selectMenu :: Styles
  , disabled :: Styles
  , icon :: Styles
  )


select :: forall o menuProps iconComponentProps selectDisplayProps inputProps inputProps'
          inputBaseProps inputBaseProps'
        . SubRow o (SelectPropsO iconComponentProps menuProps selectDisplayProps + inputProps')
       => RemoveSymbol "classes" (InputBasePropsO inputProps) inputBaseProps'
       => RemoveSymbol "onChange" inputBaseProps' inputBaseProps
       => RemoveSymbol "classes" (InputPropsO + inputBaseProps) inputProps'
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
