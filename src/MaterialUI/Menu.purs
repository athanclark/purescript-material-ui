module MaterialUI.Menu
  ( menu, MenuProps, MenuPropsO, MenuClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes, class RemoveSymbol)
import MaterialUI.Modal (ModalPropsO)
import MaterialUI.Popover (PopoverPropsO)
import MaterialUI.ListItem (ListItemPropsO)
import MaterialUI.InputBase (Value)

import Prelude
import React (ReactClass, unsafeCreateElement, ReactElement)
import React.SyntheticEvent (SyntheticEvent)
import Row.Class (class SubRow)
import Effect.Uncurried (EffectFn1)
import Web.DOM.Internal.Types (Element)
import Unsafe.Coerce (unsafeCoerce)
import Type.Row (type (+))


foreign import menuImpl :: forall props. ReactClass props


type MenuProps o =
  { open :: Boolean
  | o }


type MenuPropsO menuListProps r =
  ( classes :: Classes
  , disableAutoFocusItem :: Boolean
  , "MenuListProps" :: menuListProps
  , "PopoverClasses" :: Classes
  | r)

type MenuClasses =
  ( paper :: Styles
  )

createClasses :: forall classes
               . SubRow classes MenuClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


menu :: forall o menuListProps popoverProps modalProps backdropProps
      . SubRow o (MenuPropsO menuListProps + popoverProps)
     => RemoveSymbol "classes" (PopoverPropsO + modalProps) popoverProps
     => RemoveSymbol "classes" (ModalPropsO backdropProps) modalProps
     => MenuProps o -> Array ReactElement -> ReactElement
menu = unsafeCreateElement menuImpl
