module MaterialUI.Drawer
  ( drawer', DrawerProps, DrawerPropsO, DrawerClasses
  , Anchor, left, right, top, bottom
  ) where

import MaterialUI.Types (Styles)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)


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


type DrawerPropsO eff slideProps classes =
  ( "SlideProps" :: slideProps
  , anchor :: Anchor
  , children :: Array ReactElement
  , classes :: classes
  , docked :: Boolean
  , elevation :: Int
  , enterTransitionDuration :: Number
  , leaveTransitionDuration :: Number
  , onRequestClose :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , open :: Boolean
  )

type DrawerClasses =
  ( paper :: Styles
  , anchorLeft :: Styles
  , anchorRight :: Styles
  , anchorTop :: Styles
  , anchorBottom :: Styles
  , docked :: Styles
  , modal :: Styles
  )


drawer' :: forall o eff slideProps classes
         . Subrow o (DrawerPropsO eff slideProps { | classes })
        => Subrow classes DrawerClasses
        => DrawerProps o -> Array ReactElement -> ReactElement
drawer' = createElement drawerImpl
