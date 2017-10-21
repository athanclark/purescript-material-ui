module MaterialUI.LinearProgress
  ( linearProgress, LinearProgressProps, LinearProgressPropsO, LinearProgressClasses
  , createClasses, Color, primary, accent, Mode, determinate, indeterminate, buffer, query
  ) where

import MaterialUI.Types (Styles, Classes)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)
import Unsafe.Coerce (unsafeCoerce)


foreign import linearProgressImpl :: forall props. ReactClass props


type LinearProgressProps o =
  {
  | o }


newtype Color = Color String

primary :: Color
primary = Color "primary"

accent :: Color
accent = Color "accent"

newtype Mode = Mode String

determinate :: Mode
determinate = Mode "determinate"

indeterminate :: Mode
indeterminate = Mode "indeterminate"

buffer :: Mode
buffer = Mode "buffer"

query :: Mode
query = Mode "query"


type LinearProgressPropsO =
  ( classes :: Classes
  , color :: Color
  , mode :: Mode
  , value :: Number
  , valueBuffer :: Number
  )

type LinearProgressClasses =
  ( root :: Styles
  , primaryColor :: Styles
  , primaryColorBar :: Styles
  , primaryDashed :: Styles
  , accentColor :: Styles
  , accentColorBar :: Styles
  , accentDashed :: Styles
  , bar :: Styles
  , dashed :: Styles
  , bufferBar1 :: Styles
  , bufferBar2 :: Styles
  , bufferBar2Primary :: Styles
  , bufferBar2Accent :: Styles
  , rootBuffer :: Styles
  , rootQuery :: Styles
  , indeterminateBar1 :: Styles
  , indeterminateBar2 :: Styles
  , determinateBar1 :: Styles
  )

createClasses :: forall classes
               . Subrow classes LinearProgressClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


linearProgress :: forall o
         . Subrow o LinearProgressPropsO
        => LinearProgressProps o -> ReactElement
linearProgress p = createElement linearProgressImpl p []
