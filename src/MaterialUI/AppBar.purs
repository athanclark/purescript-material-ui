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

createClasses :: forall classes classesList compiledClasses compiledClassesList
               . Subrow classes AppBarClasses
              => RowToList classes classesList
              => CompileStyles classesList compiledClassesList
              => ListToRow compiledClassesList compiledClasses
              => { | compiledClasses } -> Classes
createClasses = unsafeCoerce


appBar :: forall o
         . Subrow o AppBarPropsO
        => AppBarProps o -> Array ReactElement -> ReactElement
appBar = createElement appBarImpl


foreign import withStylesImpl :: forall styles stylesList compiledStyles compiledStylesList a
                               . Subrow styles AppBarClasses
                              => RowToList styles stylesList
                              => CompileStyles stylesList compiledStylesList
                              => ListToRow compiledStylesList compiledStyles
                              => (Theme -> { | styles }) -> ReactClass { | compiledStyles } -> ReactClass a

withStyles :: forall styles stylesList compiledStyles compiledStylesList a
            . Subrow styles AppBarClasses
            => RowToList styles stylesList
            => CompileStyles stylesList compiledStylesList
            => ListToRow compiledStylesList compiledStyles
            => (Theme -> { | styles }) -> ({ | compiledStyles } -> ReactElement) -> ReactElement
withStyles stylesF createElem = createElement (withStylesImpl stylesF (createClassStateless createElem)) unit []
