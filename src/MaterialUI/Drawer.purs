module MaterialUI.Drawer
  ( drawer, DrawerProps, DrawerPropsO, DrawerClasses
  , Anchor, left, right, top, bottom
  , DrawerType, permanent, persistent, temporary
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)
import Unsafe.Coerce (unsafeCoerce)


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
  , style :: Styles
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

createClasses :: forall classes
               . Subrow classes DrawerClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


drawer :: forall o eff slideProps
         . Subrow o (DrawerPropsO eff slideProps)
        => DrawerProps o -> Array ReactElement -> ReactElement
drawer = createElement drawerImpl
