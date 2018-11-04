module MaterialUI.CircularProgress
  ( circularProgress, CircularProgressProps, CircularProgressPropsO, CircularProgressClasses
  , Mode, determinate, indeterminate, Color, primary, accent
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import React (ReactClass, unsafeCreateElement, ReactElement)
import Row.Class (class SubRow)
import Unsafe.Coerce (unsafeCoerce)


foreign import circularProgressImpl :: forall props. ReactClass props


type CircularProgressProps o =
  {
  | o }


newtype Mode = Mode String

determinate :: Mode
determinate = Mode "determinate"

indeterminate :: Mode
indeterminate = Mode "indeterminate"

newtype Color = Color String

primary :: Color
primary = Color "primary"

accent :: Color
accent = Color "accent"


type CircularProgressPropsO =
  ( color :: Color
  , size :: Int
  , max :: Int
  , min :: Int
  , mode :: Mode
  , value :: Int
  , classes :: Classes
  )


type CircularProgressClasses =
  ( root :: Styles
  , primaryColor :: Styles
  , accentColor :: Styles
  , svg :: Styles
  , indeterminateSvg :: Styles
  , circle :: Styles
  , indeterminateCircle :: Styles
  , determinateCircle :: Styles
  )

createClasses :: forall classes
               . SubRow classes CircularProgressClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


circularProgress :: forall o
                   . SubRow o CircularProgressPropsO
                  => CircularProgressProps o -> ReactElement
circularProgress props = unsafeCreateElement circularProgressImpl props []
