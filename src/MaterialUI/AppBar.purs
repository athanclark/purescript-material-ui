module MaterialUI.AppBar
  ( appBar, AppBarProps, AppBarPropsO, AppBarClasses
  , Color, inherit, primary, accent, default
  , Position, static, fixed, absolute
  , createClasses
  , withStyles
  ) where

import MaterialUI.Types (Styles, Classes, class CompileStyles, Theme)

import Prelude
import React (Event, ReactClass, createElement, createClassStateless, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Data.Function.Uncurried (Fn2, runFn2)
import Control.Monad.Eff.Uncurried (EffFn1)
import Unsafe.Coerce (unsafeCoerce)
import Type.Row (class RowToList, class ListToRow)


foreign import appBarImpl :: forall props. ReactClass props


type AppBarProps o =
  {
  | o }


newtype Color = Color String

inherit :: Color
inherit = Color "inherit"

primary :: Color
primary = Color "primary"

accent :: Color
accent = Color "accent"

default :: Color
default = Color "default"

newtype Position = Position String

static :: Position
static = Position "static"

fixed :: Position
fixed = Position "fixed"

absolute :: Position
absolute = Position "absolute"


type AppBarPropsO =
  ( children :: Array ReactElement
  , color :: Color
  , position :: Position
  , classes :: Classes
  , key :: String
  )


type AppBarClasses =
  ( root :: Styles
  , positionFixed :: Styles
  , positionAbsolute :: Styles
  , positionStatic :: Styles
  , colorDefault :: Styles
  , colorPrimary :: Styles
  , colorAccent :: Styles
  )


type AppBarClassesCompiled =
  ( root :: String
  , positionFixed :: String
  , positionAbsolute :: String
  , positionStatic :: String
  , colorDefault :: String
  , colorPrimary :: String
  , colorAccent :: String
  )


createClasses :: forall classes
               . Subrow classes AppBarClassesCompiled
              => { | classes } -> Classes
createClasses = unsafeCoerce


appBar :: forall o
         . Subrow o AppBarPropsO
        => AppBarProps o -> Array ReactElement -> ReactElement
appBar = createElement appBarImpl


foreign import withStylesImpl :: forall styles compiledStyles a
                               . Fn2 (Theme -> { | styles }) (ReactClass {classes :: { | compiledStyles }}) (ReactClass a)

withStyles :: forall styles stylesList compiledStyles compiledStylesList a
            . Subrow styles AppBarClasses
            => RowToList styles stylesList
            => CompileStyles stylesList compiledStylesList
            => ListToRow compiledStylesList compiledStyles
            => (Theme -> { | styles }) -> ({classes :: { | compiledStyles }} -> ReactElement) -> ReactElement
withStyles stylesF createElem = createElement (runFn2 withStylesImpl stylesF (createClassStateless createElem)) unit []
