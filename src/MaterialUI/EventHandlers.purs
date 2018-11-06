module MaterialUI.EventHandlers where

import React (SyntheticEventHandler)
import React.SyntheticEvent (SyntheticMouseEvent, SyntheticTouchEvent)



type ClickableComponent =
  ( onClick :: SyntheticEventHandler SyntheticMouseEvent
  , onTouchTap :: SyntheticEventHandler SyntheticTouchEvent
  )
