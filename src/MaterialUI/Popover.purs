module MaterialUI.Popover
  ( popover, PopoverProps, PopoverPropsO, PopoverClasses
  , Horizontal, left, centerH, right
  , Vertical, top, centerV, bottom
  , AnchorRef, none, anchorEl, anchorPosition
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes, class RemoveSymbol)
import MaterialUI.Modal (ModalPropsO)

import React (ReactClass, unsafeCreateElement, ReactElement, SyntheticEventHandler)
import React.SyntheticEvent (SyntheticEvent)
import Row.Class (class SubRow)
import Foreign (Foreign)
import Foreign.Object (Object)
import Unsafe.Coerce (unsafeCoerce)
import Web.DOM.Internal.Types (Element)
import Type.Row (type (+))


foreign import popoverImpl :: forall props. ReactClass props


type PopoverProps o =
  { open :: Boolean
  | o }


newtype Horizontal = Horizontal String

left :: Horizontal
left = Horizontal "left"

centerH :: Horizontal
centerH = Horizontal "center"

right :: Horizontal
right = Horizontal "right"


newtype Vertical = Vertical String

top :: Vertical
top = Vertical "top"

centerV :: Vertical
centerV = Vertical "center"

bottom :: Vertical
bottom = Vertical "bottom"


newtype AnchorRef = AnchorRef String

none :: AnchorRef
none = AnchorRef "none"

anchorEl :: AnchorRef
anchorEl = AnchorRef "anchorEl"

anchorPosition :: AnchorRef
anchorPosition = AnchorRef "anchorPosition"


type PopoverPropsO r =
  ( action :: SyntheticEventHandler (Object Foreign)
  , anchorEl :: Element
  , anchorOrigin :: { horizontal :: Horizontal, vertical :: Vertical }
  , anchorPosition :: { left :: Number, top :: Number }
  , anchorReference :: AnchorRef
  , classes :: Classes
  , elevation :: Int
  , getContentAnchorEl :: SyntheticEventHandler Foreign
  , marginThreshold :: Int
  , "ModalClasses" :: Classes
  , onEnter        :: SyntheticEventHandler SyntheticEvent
  , onEntered      :: SyntheticEventHandler SyntheticEvent
  , onEntering     :: SyntheticEventHandler SyntheticEvent
  , onExit         :: SyntheticEventHandler SyntheticEvent
  , onExited       :: SyntheticEventHandler SyntheticEvent
  , onExiting      :: SyntheticEventHandler SyntheticEvent
  , transformOrigin :: { horizontal :: Horizontal, vertical :: Vertical }
  | r)

type PopoverClasses =
  ( paper :: Styles
  )

createClasses :: forall classes
               . SubRow classes PopoverClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


popover :: forall o modalProps backdropProps
         . SubRow o (PopoverPropsO + modalProps)
        => RemoveSymbol "classes" (ModalPropsO backdropProps) modalProps
        => PopoverProps o -> Array ReactElement -> ReactElement
popover = unsafeCreateElement popoverImpl
