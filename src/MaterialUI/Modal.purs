module MaterialUI.Modal
  ( modal, ModalProps, ModalPropsO, ModalClasses
  , ModalManager, ModalManagerArgs, newModalManager
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import React (ReactClass, unsafeCreateElement, ReactElement, SyntheticEventHandler)
import React.SyntheticEvent (SyntheticEvent)
import Row.Class (class SubRow)
import Unsafe.Coerce (unsafeCoerce)


foreign import modalImpl :: forall props. ReactClass props


type ModalProps o =
  { open :: Boolean
  | o }


foreign import data ModalManager :: Type
type ModalManagerArgs =
  ( hideSiblingNodes :: Boolean
  , handleContainerOverflow :: Boolean
  )
foreign import newModalManager :: forall o. SubRow o ModalManagerArgs => { | o } -> ModalManager


type ModalPropsO backdropProps =
  ( classes :: Classes
  , "BackdropComponent" :: ReactClass backdropProps -- ^ Default: Backdrop
  , "BackdropProps" :: backdropProps
  , container :: ReactElement
  , disableAutoFocus :: Boolean -- ^ Default: `false`
  , disableBackdropClick :: Boolean -- ^ Default: `false`
  , disableEnforceFocus :: Boolean -- ^ Default: `false`
  , disableEscapeKeyDown :: Boolean -- ^ Default: `false`
  , disablePortal :: Boolean -- ^ Default: `false`
  , disableRestoreFocus :: Boolean -- ^ Default: `false`
  , hideBackdrop :: Boolean -- ^ Default: `false`
  , keepMounted :: Boolean -- ^ Default: `false`
  , manager :: ModalManager -- ^ Default: `newModalManager {}`
  , onBackdropClick         :: SyntheticEventHandler SyntheticEvent
  , onClose                 :: SyntheticEventHandler SyntheticEvent
  , onEscapeKeyDown         :: SyntheticEventHandler SyntheticEvent
  , onRendered              :: SyntheticEventHandler SyntheticEvent
  )

type ModalClasses =
  ( root :: Styles
  , hidden :: Styles
  )

createClasses :: forall classes
               . SubRow classes ModalClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


modal :: forall o backdropProps
         . SubRow o (ModalPropsO backdropProps)
        => ModalProps o -> Array ReactElement -> ReactElement
modal = unsafeCreateElement modalImpl
