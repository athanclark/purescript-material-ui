module MaterialUI.CircularProgress
  ( circularProgress, CircularProgressProps, CircularProgressPropsO, CircularProgressClasses
  , Variant, determinate, indeterminate, static
  , Color, primary, secondary, inherit
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


type CircularProgressPropsO =
  ( classes :: Classes
  , color :: Color -- ^ Default: 'primary'
  , disableShrink :: Boolean -- ^ Default: `false`
  , size :: Int -- ^ Default: `40`
  , thickness :: Number -- ^ Default: `3.6`
  , value :: Int -- ^ Between 0 and 100, Default: `0`
  , variant :: Variant -- ^ Default: 'indeterminate'
  )


newtype Variant = Variant String

determinate :: Variant
determinate = Variant "determinate"

indeterminate :: Variant
indeterminate = Variant "indeterminate"

static :: Variant
static = Variant "static"

newtype Color = Color String

primary :: Color
primary = Color "primary"

secondary :: Color
secondary = Color "secondary"

inherit :: Color
inherit = Color "inherit"


type CircularProgressClasses =
  ( root :: Styles
  , static :: Styles
  , indeterminate :: Styles
  , colorPrimary :: Styles
  , colorSecondary :: Styles
  , svg :: Styles
  , circle :: Styles
  , circleStatic :: Styles
  , circleIndeterminate :: Styles
  , circleDisableShrink :: Styles
  )

createClasses :: forall classes
               . SubRow classes CircularProgressClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


circularProgress :: forall o
                   . SubRow o CircularProgressPropsO
                  => CircularProgressProps o -> ReactElement
circularProgress props = unsafeCreateElement circularProgressImpl props []
