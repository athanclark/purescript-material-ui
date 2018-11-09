module MaterialUI.ButtonBase
  ( buttonBase, ButtonBaseProps, ButtonBasePropsO, ButtonBaseClasses
  , ButtonType, buttonType, submitType, resetType
  , createClasses
  ) where

import MaterialUI.EventHandlers (ClickableComponent)
import MaterialUI.Types (Styles, Classes)

import Data.Nullable (Nullable)
import React (ReactClass, unsafeCreateElement, ReactElement, ReactRef, SyntheticEventHandler)
import React.SyntheticEvent (SyntheticEvent)
import Row.Class (class SubRow)
import Type.Row (type (+))
import Unsafe.Coerce (unsafeCoerce)


foreign import buttonBaseImpl :: forall props. ReactClass props


type ButtonBaseProps o =
  {
  | o }


type ButtonBasePropsO componentProps touchRippleProps r =
  -- ( action :: ?
  ( classes :: Classes
  , buttonRef :: SyntheticEventHandler (Nullable ReactRef)
  , centerRipple :: Boolean -- ^ Default: `false`
  , component :: ReactClass componentProps -- ^ Default: 'React.DOM.button'
  , disabled :: Boolean
  , disableRipple :: Boolean -- ^ Default: `false`
  , disableTouchRipple :: Boolean -- ^ Default: `false`
  , focusRipple :: Boolean -- ^ Default: `false`
  , focusVisibleClassName :: String
  , onFocusVisible :: SyntheticEventHandler SyntheticEvent
  , "TouchRippleProps" :: touchRippleProps
  , "type" :: ButtonType -- ^ Default: 'buttonType'
  | r)


newtype ButtonType = ButtonType String

buttonType :: ButtonType
buttonType = ButtonType "button"

submitType :: ButtonType
submitType = ButtonType "submit"

resetType :: ButtonType
resetType = ButtonType "reset"



type ButtonBaseClasses =
  ( root :: Styles
  , disabled :: Styles
  , focusVisible :: Styles
  )

createClasses :: forall classes
               . SubRow classes ButtonBaseClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


buttonBase :: forall o componentProps touchRippleProps
         . SubRow o (ButtonBasePropsO componentProps touchRippleProps + ClickableComponent)
        => ButtonBaseProps o -> Array ReactElement -> ReactElement
buttonBase = unsafeCreateElement buttonBaseImpl
