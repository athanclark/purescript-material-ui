module MaterialUI.Chip
  ( chip, ChipProps, ChipPropsO, ChipClasses
  , createClasses, withStyles
  ) where

import MaterialUI.Types (Styles, Classes, class CompileStyles, Theme)

import Prelude
import React (ReactClass, unsafeCreateElement, ReactElement, statelessComponent)
import React.SyntheticEvent (SyntheticEvent)
import Row.Class (class SubRow)
import Data.Function.Uncurried (Fn2, runFn2)
import Effect.Uncurried (EffectFn1)
import Unsafe.Coerce (unsafeCoerce)
import Type.Row (class RowToList, class ListToRow)


foreign import chipImpl :: forall props. ReactClass props


type ChipProps o =
  {
  | o }


type ChipPropsO eff =
  ( avatar :: ReactElement
  , classes :: Classes
  , deleteIcon :: ReactElement
  , label :: ReactElement
  , onDelete :: EffectFn1 SyntheticEvent Unit
  , onClick :: EffectFn1 SyntheticEvent Unit
  )

type ChipClasses =
  ( root :: Styles
  , clickable :: Styles
  , deletable :: Styles
  , avatar :: Styles
  , avatarChildren :: Styles
  , label :: Styles
  , deleteIcon :: Styles
  )

type ChipClassesCompiled =
  ( root :: String
  , clickable :: String
  , deletable :: String
  , avatar :: String
  , avatarChildren :: String
  , label :: String
  , deleteIcon :: String
  )

createClasses :: forall classes
               . SubRow classes ChipClassesCompiled
              => { | classes } -> Classes
createClasses = unsafeCoerce


chip :: forall o eff
         . SubRow o (ChipPropsO eff)
        => ChipProps o -> ReactElement
chip p = unsafeCreateElement chipImpl p []



foreign import withStylesImpl :: forall styles compiledStyles a
                               . Fn2 (Theme -> { | styles }) (ReactClass {classes :: { | compiledStyles }}) (ReactClass a)

withStyles :: forall styles stylesList compiledStyles compiledStylesList
            . SubRow styles ChipClasses
            => RowToList styles stylesList
            => CompileStyles stylesList compiledStylesList
            => ListToRow compiledStylesList compiledStyles
            => (Theme -> { | styles }) -> ({classes :: { | compiledStyles }} -> ReactElement) -> ReactElement
withStyles stylesF createElem = unsafeCreateElement (runFn2 withStylesImpl stylesF (statelessComponent createElem)) {} []
