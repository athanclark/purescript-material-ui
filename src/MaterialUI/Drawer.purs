module MaterialUI.Drawer
  ( drawer, DrawerProps, DrawerPropsO, DrawerClasses, DrawerClassesCompiled
  , Anchor, left, right, top, bottom
  , DrawerType, permanent, persistent, temporary
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


foreign import drawerImpl :: forall props. ReactClass props


type DrawerProps o =
  {
  | o }

newtype Anchor = Anchor String

left :: Anchor
left = Anchor "left"

right :: Anchor
right = Anchor "right"

top :: Anchor
top = Anchor "top"

bottom :: Anchor
bottom = Anchor "bottom"


newtype DrawerType = DrawerType String

permanent :: DrawerType
permanent = DrawerType "permanent"

persistent :: DrawerType
persistent = DrawerType "persistent"

temporary :: DrawerType
temporary = DrawerType "temporary"


type DrawerPropsO eff slideProps =
  ( "SlideProps" :: slideProps
  , anchor :: Anchor
  , children :: Array ReactElement
  , classes :: Classes
  , elevation :: Int
  , onRequestClose :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , open :: Boolean
  , transitionDuration :: Number
  , "type" :: DrawerType
  )

type DrawerClasses =
  ( paper :: Styles
  , paperAnchorLeft :: Styles
  , paperAnchorRight :: Styles
  , paperAnchorDockedLeft :: Styles
  , paperAnchorDockedRight :: Styles
  , paperAnchorTop :: Styles
  , paperAnchorBottom :: Styles
  , docked :: Styles
  , modal :: Styles
  )

type DrawerClassesCompiled =
  ( paper :: String
  , paperAnchorLeft :: String
  , paperAnchorRight :: String
  , paperAnchorDockedLeft :: String
  , paperAnchorDockedRight :: String
  , paperAnchorTop :: String
  , paperAnchorBottom :: String
  , docked :: String
  , modal :: String
  )

createClasses :: forall classes
               . Subrow classes DrawerClassesCompiled
              => { | classes } -> Classes
createClasses = unsafeCoerce


drawer :: forall o eff slideProps
         . Subrow o (DrawerPropsO eff slideProps)
        => DrawerProps o -> Array ReactElement -> ReactElement
drawer = createElement drawerImpl


foreign import withStylesImpl :: forall styles compiledStyles a
                               . Fn2 (Theme -> { | styles }) (ReactClass {classes :: { | compiledStyles }}) (ReactClass a)

withStyles :: forall styles stylesList compiledStyles compiledStylesList a
            . Subrow styles DrawerClasses
            => RowToList styles stylesList
            => CompileStyles stylesList compiledStylesList
            => ListToRow compiledStylesList compiledStyles
            => (Theme -> { | styles }) -> ({classes :: { | compiledStyles }} -> ReactElement) -> ReactElement
withStyles stylesF createElem = createElement (runFn2 withStylesImpl stylesF (createClassStateless createElem)) unit []
