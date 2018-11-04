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
import React (ReactClass, unsafeCreateElement, ReactElement)
import React.SyntheticEvent (SyntheticEvent)
import Row.Class (class SubRow)
import Effect.Uncurried (EffectFn1)
import Web.DOM.Internal.Types (Element)
import Unsafe.Coerce (unsafeCoerce)
import Prim.Row (class Union)


foreign import menuImpl :: forall props. ReactClass props


type MenuProps o =
  {
  | o }


type MenuPropsO eff menuListProps =
  ( "MenuListProps" :: menuListProps
  , anchorEl :: Element
  , classes :: Classes
  , onEnter :: EffectFn1 SyntheticEvent Unit
  , onEntered :: EffectFn1 SyntheticEvent Unit
  , onEntering :: EffectFn1 SyntheticEvent Unit
  , onExit :: EffectFn1 SyntheticEvent Unit
  , onExited :: EffectFn1 SyntheticEvent Unit
  , onExiting :: EffectFn1 SyntheticEvent Unit
  , onRequestClose :: EffectFn1 SyntheticEvent Unit
  , open :: Boolean
  , transitionDuration :: Number
  )

type MenuClasses =
  ( root :: Styles
  )

createClasses :: forall classes
               . SubRow classes MenuClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


menu :: forall o eff menuListProps
         . SubRow o (MenuPropsO eff menuListProps)
        => MenuProps o -> Array ReactElement -> ReactElement
menu = unsafeCreateElement menuImpl

-----------------------------------------------------------------------------------------

foreign import menuItemImpl :: forall props. ReactClass props


type MenuItemProps o =
  {
  | o }


type MenuItemPropsO componentProps =
  ( classes :: Classes
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
               . SubRow classes MenuItemClasses
              => { | classes } -> Classes
createClassesItem = unsafeCoerce


menuItem :: forall o eff both componentProps
         . SubRow o both
        => Union (MenuItemPropsO componentProps) (ListItemPropsO eff componentProps) both
        => MenuItemProps o -> Array ReactElement -> ReactElement
menuItem = unsafeCreateElement menuItemImpl
