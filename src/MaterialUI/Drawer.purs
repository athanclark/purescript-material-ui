module MaterialUI.Drawer
  ( drawer, DrawerProps, DrawerPropsO, DrawerClasses, DrawerClassesCompiled
  , Anchor, left, right, top, bottom
  , DrawerVariant, permanent, persistent, temporary
  , createClasses
  , withStyles
  ) where

import MaterialUI.Types (Styles, Classes, class CompileStyles, Theme)

import React.Transition (Timeout)
import React (ReactClass, unsafeCreateElement, ReactElement, statelessComponent, SyntheticEventHandler)
import React.SyntheticEvent (SyntheticEvent)
import Row.Class (class SubRow)
import Data.Function.Uncurried (Fn2, runFn2)
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


type DrawerPropsO modalProps paperProps slideProps =
  ( anchor :: Anchor -- ^ Default: `left`
  , classes :: Classes
  , elevation :: Int -- ^ Default: `16`
  , "ModalProps" :: modalProps
  , onClose :: SyntheticEventHandler SyntheticEvent
  , open :: Boolean -- ^ Default: `false`
  , "PaperProps" :: paperProps
  , "SlideProps" :: slideProps
  , transitionDuration :: Timeout
  , variant :: DrawerVariant -- ^ Default: `temporary`
  )

type DrawerClasses =
  ( root :: Styles
  , docked :: Styles
  , paper :: Styles
  , paperAnchorLeft :: Styles
  , paperAnchorRight :: Styles
  , paperAnchorTop :: Styles
  , paperAnchorBottom :: Styles
  , paperAnchorDockedLeft :: Styles
  , paperAnchorDockedRight :: Styles
  , paperAnchorDockedTop :: Styles
  , paperAnchorDockedBottom :: Styles
  , modal :: Styles
  )

type DrawerClassesCompiled =
  ( root :: String
  , docked :: String
  , paper :: String
  , paperAnchorLeft :: String
  , paperAnchorRight :: String
  , paperAnchorTop :: String
  , paperAnchorBottom :: String
  , paperAnchorDockedLeft :: String
  , paperAnchorDockedRight :: String
  , paperAnchorDockedTop :: String
  , paperAnchorDockedBottom :: String
  , modal :: String
  )

createClasses :: forall classes
               . SubRow classes DrawerClassesCompiled
              => { | classes } -> Classes
createClasses = unsafeCoerce


drawer :: forall o modalProps paperProps slideProps
         . SubRow o (DrawerPropsO modalProps paperProps slideProps)
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
