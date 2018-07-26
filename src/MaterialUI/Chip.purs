module MaterialUI.Chip
  ( chip, ChipProps, ChipPropsO, ChipClasses
  , createClasses, withStyles
  ) where

import MaterialUI.Types (Styles, Classes, class CompileStyles, Theme)

import Prelude
import React (Event, ReactClass, createElement, createClassStateless, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Data.Function.Uncurried (Fn2, runFn2)
import Control.Monad.Eff.Uncurried (EffFn1)
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
  , onDelete :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onClick :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
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
               . Subrow classes ChipClassesCompiled
              => { | classes } -> Classes
createClasses = unsafeCoerce


chip :: forall o eff
         . Subrow o (ChipPropsO eff)
        => ChipProps o -> ReactElement
chip p = createElement chipImpl p []



foreign import withStylesImpl :: forall styles compiledStyles a
                               . Fn2 (Theme -> { | styles }) (ReactClass {classes :: { | compiledStyles }}) (ReactClass a)

withStyles :: forall styles stylesList compiledStyles compiledStylesList
            . Subrow styles ChipClasses
            => RowToList styles stylesList
            => CompileStyles stylesList compiledStylesList
            => ListToRow compiledStylesList compiledStyles
            => (Theme -> { | styles }) -> ({classes :: { | compiledStyles }} -> ReactElement) -> ReactElement
withStyles stylesF createElem = createElement (runFn2 withStylesImpl stylesF (createClassStateless createElem)) unit []
