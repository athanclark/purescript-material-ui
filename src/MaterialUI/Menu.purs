module MaterialUI.Menu
  ( menu, MenuProps, MenuPropsO, MenuClasses
  , createClasses
  , menuItem, MenuItemProps, MenuItemPropsO, MenuItemClasses
  , createClassesItem
  ) where

import MaterialUI.Types (Styles, Classes)
import MaterialUI.ListItem (ListItemPropsO)
import MaterialUI.Input (Value)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)
import DOM.Node.Types (Element)
import Unsafe.Coerce (unsafeCoerce)


foreign import menuImpl :: forall props. ReactClass props


type MenuProps o =
  {
  | o }


type MenuPropsO eff menuListProps =
  ( "MenuListProps" :: menuListProps
  , anchorEl :: Element
  , children :: Array ReactElement
  , classes :: Classes
  , onEnter :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onEntered :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onEntering :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onExit :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onExited :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onExiting :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onRequestClose :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , open :: Boolean
  , transitionDuration :: Number
  )

type MenuClasses =
  ( root :: Styles
  )

createClasses :: forall classes
               . Subrow classes MenuClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


menu :: forall o eff menuListProps
         . Subrow o (MenuPropsO eff menuListProps)
        => MenuProps o -> Array ReactElement -> ReactElement
menu = createElement menuImpl

-----------------------------------------------------------------------------------------

foreign import menuItemImpl :: forall props. ReactClass props


type MenuItemProps o =
  {
  | o }


type MenuItemPropsO componentProps =
  ( children :: Array ReactElement
  , classes :: Classes
  , component :: ReactClass componentProps
  , selected :: Boolean
  , key :: String
  , value :: Value
  )

type MenuItemClasses =
  ( root :: Styles
  , selected :: Styles
  )

createClassesItem :: forall classes
               . Subrow classes MenuItemClasses
              => { | classes } -> Classes
createClassesItem = unsafeCoerce


menuItem :: forall o eff both componentProps
         . Subrow o both
        => Union (MenuItemPropsO componentProps) (ListItemPropsO eff componentProps) both
        => MenuItemProps o -> Array ReactElement -> ReactElement
menuItem = createElement menuItemImpl
