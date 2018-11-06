module MaterialUI.AppBar
  ( appBar, AppBarProps, AppBarPropsO, AppBarClasses
  , Color, inherit, primary, secondary, default
  , Position, static, sticky, fixed, absolute, relative
  , createClasses
  , withStyles
  ) where

import MaterialUI.Types (Styles, Classes, class CompileStyles, Theme)

import React (ReactClass, unsafeCreateElement, ReactElement, statelessComponent)
import Row.Class (class SubRow)
import Data.Function.Uncurried (Fn2, runFn2)
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

secondary :: Color
secondary = Color "secondary"

default :: Color
default = Color "default"

newtype Position = Position String

static :: Position
static = Position "static"

sticky :: Position
sticky = Position "sticky"

fixed :: Position
fixed = Position "fixed"

absolute :: Position
absolute = Position "absolute"

relative :: Position
relative = Position "relative"


type AppBarPropsO =
  ( color :: Color
  , position :: Position
  , classes :: Classes
  )


type AppBarClasses =
  ( root :: Styles
  , positionFixed :: Styles
  , positionAbsolute :: Styles
  , positionSticky :: Styles
  , positionStatic :: Styles
  , positionRelative :: Styles
  , colorDefault :: Styles
  , colorPrimary :: Styles
  , colorSecondary :: Styles
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
               . SubRow classes AppBarClassesCompiled
              => { | classes } -> Classes
createClasses = unsafeCoerce


appBar :: forall o
         . SubRow o AppBarPropsO
        => AppBarProps o -> Array ReactElement -> ReactElement
appBar = unsafeCreateElement appBarImpl


foreign import withStylesImpl :: forall styles compiledStyles a
                               . Fn2 (Theme -> { | styles }) (ReactClass {classes :: { | compiledStyles }}) (ReactClass a)

withStyles :: forall styles stylesList compiledStyles compiledStylesList
            . SubRow styles AppBarClasses
            => RowToList styles stylesList
            => CompileStyles stylesList compiledStylesList
            => ListToRow compiledStylesList compiledStyles
            => (Theme -> { | styles }) -> ({classes :: { | compiledStyles }} -> ReactElement) -> ReactElement
withStyles stylesF createElem = unsafeCreateElement (runFn2 withStylesImpl stylesF (statelessComponent createElem)) {} []
