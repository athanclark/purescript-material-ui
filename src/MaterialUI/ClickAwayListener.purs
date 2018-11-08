module MaterialUI.ClickAwayListener
  ( clickAwayListener, ClickAwayListenerProps, ClickAwayListenerPropsO
  , MouseEvent, onClick, onMouseDown, onMouseUp
  , TouchEvent, onTouchStart, onTouchEnd
  ) where

import React.EventListener (EventListenerPropsO)
import React (ReactClass, unsafeCreateElement, ReactElement, SyntheticEventHandler)
import React.SyntheticEvent (SyntheticEvent)
import Row.Class (class SubRow)
import Type.Row (type (+))


foreign import clickAwayListenerImpl :: forall props. ReactClass props


type ClickAwayListenerProps o =
  { onClickAway :: SyntheticEventHandler SyntheticEvent
  | o }

type ClickAwayListenerPropsO r =
  ( mouseEvent :: Boolean
  | r)

newtype MouseEvent = MouseEvent String

onClick :: MouseEvent
onClick = MouseEvent "onClick"

onMouseDown :: MouseEvent
onMouseDown = MouseEvent "onMouseDown"

onMouseUp :: MouseEvent
onMouseUp = MouseEvent "onMouseUp"

newtype TouchEvent = TouchEvent String

onTouchStart :: TouchEvent
onTouchStart = TouchEvent "onTouchStart"

onTouchEnd :: TouchEvent
onTouchEnd = TouchEvent "onTouchEnd"



clickAwayListener :: forall o
         . SubRow o (ClickAwayListenerPropsO + EventListenerPropsO)
        => ClickAwayListenerProps o -> Array ReactElement -> ReactElement
clickAwayListener = unsafeCreateElement clickAwayListenerImpl
