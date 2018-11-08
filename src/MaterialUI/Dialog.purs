module MaterialUI.Dialog
  ( dialog, DialogProps, DialogPropsO, DialogClasses
  , MaxWidth, xs, sm, md, lg, none
  , Scroll, body, paper
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import React.Transition (Timeout)
import React (ReactClass, unsafeCreateElement, ReactElement, SyntheticEventHandler)
import React.SyntheticEvent (SyntheticEvent)
import Row.Class (class SubRow)
import Unsafe.Coerce (unsafeCoerce)


foreign import dialogImpl :: forall props. ReactClass props


type DialogProps o =
  { open :: Boolean
  | o }


newtype MaxWidth = MaxWidth String

xs :: MaxWidth
xs = MaxWidth "xs"

sm :: MaxWidth
sm = MaxWidth "sm"

md :: MaxWidth
md = MaxWidth "md"

lg :: MaxWidth
lg = MaxWidth "lg"

none :: MaxWidth
none = MaxWidth (unsafeCoerce false)


newtype Scroll = Scroll String

body :: Scroll
body = Scroll "body"

paper :: Scroll
paper = Scroll "paper"

type DialogPropsO transitionProps paperProps =
  ( classes                 :: Classes
  , disableBackdropClick    :: Boolean -- ^ Default: `false`
  , disableEscapeKeyDown    :: Boolean -- ^ Default: `false`
  , fullScreen              :: Boolean -- ^ Default: `false`
  , fullWidth               :: Boolean -- ^ Default: `false`
  , maxWidth                :: MaxWidth -- ^ Default: `sm`
  , onBackdropClick         :: SyntheticEventHandler SyntheticEvent
  , onClose                 :: SyntheticEventHandler SyntheticEvent
  , onEnter                 :: SyntheticEventHandler SyntheticEvent
  , onEntered               :: SyntheticEventHandler SyntheticEvent
  , onEntering              :: SyntheticEventHandler SyntheticEvent
  , onEscapeKeyDown         :: SyntheticEventHandler SyntheticEvent
  , onExit                  :: SyntheticEventHandler SyntheticEvent
  , onExited                :: SyntheticEventHandler SyntheticEvent
  , onExiting               :: SyntheticEventHandler SyntheticEvent
  , "PaperProps"            :: paperProps
  , scroll                  :: Scroll -- ^ Default `paper`
  , "TransitionComponent"   :: ReactClass transitionProps -- ^ Default: `Fade`
  , transitionDuration      :: Timeout
  , "TransitionProps"       :: transitionProps
  )


type DialogClasses =
  ( root :: Styles
  , scrollPaper :: Styles
  , scrollBody :: Styles
  , container :: Styles
  , paper :: Styles
  , paperScrollPaper :: Styles
  , paperScrollBody :: Styles
  , paperWidthXs :: Styles
  , paperWidthSm :: Styles
  , paperWidthMd :: Styles
  , paperWidthLg :: Styles
  , paperFullWidth :: Styles
  , paperFullScreen :: Styles
  )


createClasses :: forall classes
               . SubRow classes DialogClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


-- FIXME inherit from Modal


dialog :: forall o transitionProps paperProps
         . SubRow o (DialogPropsO transitionProps paperProps)
        => DialogProps o -> Array ReactElement -> ReactElement
dialog = unsafeCreateElement dialogImpl
