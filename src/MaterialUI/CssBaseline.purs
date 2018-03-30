module MaterialUI.CssBaseline
  ( cssBaseline
  ) where

import MaterialUI.Types (Styles, Classes)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)
import Unsafe.Coerce (unsafeCoerce)


foreign import cssBaselineImpl :: forall props. ReactClass props



cssBaseline :: ReactElement
cssBaseline = createElement cssBaselineImpl {} []
