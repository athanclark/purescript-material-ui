module MaterialUI.Dialog
  ( dialog, DialogProps, DialogPropsO, DialogClasses
  , MaxWidth, xs, sm, md, lg, none
  , Scroll, body, paper
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)
import MaterialUI.Modal (ModalPropsO)

import React.Transition (Timeout)
import React (ReactClass, unsafeCreateElement, ReactElement, SyntheticEventHandler)
import React.SyntheticEvent (SyntheticEvent)
import Row.Class (class SubRow)
import Type.Row (type (+))
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

type DialogPropsO transitionProps paperProps r =
  ( classes                 :: Classes
  , fullScreen              :: Boolean -- ^ Default: `false`
  , fullWidth               :: Boolean -- ^ Default: `false`
  , maxWidth                :: MaxWidth -- ^ Default: `sm`
  , onEnter                 :: SyntheticEventHandler SyntheticEvent
  , onEntered               :: SyntheticEventHandler SyntheticEvent
  , onEntering              :: SyntheticEventHandler SyntheticEvent
  , onExit                  :: SyntheticEventHandler SyntheticEvent
  , onExited                :: SyntheticEventHandler SyntheticEvent
  , onExiting               :: SyntheticEventHandler SyntheticEvent
  , "PaperProps"            :: paperProps
  , scroll                  :: Scroll -- ^ Default `paper`
  , "TransitionComponent"   :: ReactClass transitionProps -- ^ Default: `Fade`
  , transitionDuration      :: Timeout
  , "TransitionProps"       :: transitionProps
  | r)


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



dialog :: forall o transitionProps paperProps backdropProps
         . SubRow o (DialogPropsO transitionProps paperProps + ModalPropsO backdropProps)
        => DialogProps o -> Array ReactElement -> ReactElement
dialog = unsafeCreateElement dialogImpl
