module MaterialUI.Drawer
  ( drawer, DrawerProps, DrawerPropsO, DrawerClasses, DrawerClassesCompiled
  , Anchor, left, right, top, bottom
  , DrawerVariant, permanent, persistent, temporary
  , createClasses
  , withStyles
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


newtype DrawerVariant = DrawerVariant String

permanent :: DrawerVariant
permanent = DrawerVariant "permanent"

persistent :: DrawerVariant
persistent = DrawerVariant "persistent"

temporary :: DrawerVariant
temporary = DrawerVariant "temporary"


type DrawerPropsO eff slideProps =
  ( "SlideProps" :: slideProps
  , anchor :: Anchor
  , classes :: Classes
  , elevation :: Int
  , onClose :: EffectFn1 SyntheticEvent Unit
  , open :: Boolean
  , transitionDuration :: Number
  , variant :: DrawerVariant
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
               . SubRow classes DrawerClassesCompiled
              => { | classes } -> Classes
createClasses = unsafeCoerce


drawer :: forall o eff slideProps
         . SubRow o (DrawerPropsO eff slideProps)
        => DrawerProps o -> Array ReactElement -> ReactElement
drawer = unsafeCreateElement drawerImpl


foreign import withStylesImpl :: forall styles compiledStyles a
                               . Fn2 (Theme -> { | styles }) (ReactClass {classes :: { | compiledStyles }}) (ReactClass a)

withStyles :: forall styles stylesList compiledStyles compiledStylesList
            . SubRow styles DrawerClasses
            => RowToList styles stylesList
            => CompileStyles stylesList compiledStylesList
            => ListToRow compiledStylesList compiledStyles
            => (Theme -> { | styles }) -> ({classes :: { | compiledStyles }} -> ReactElement) -> ReactElement
withStyles stylesF createElem = unsafeCreateElement (runFn2 withStylesImpl stylesF (statelessComponent createElem)) {} []
