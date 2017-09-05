module MaterialUI.Collapse
  ( collapse, CollapseProps, CollapsePropsO, CollapseClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)
import Unsafe.Coerce (unsafeCoerce)


foreign import collapseImpl :: forall props. ReactClass props


type CollapseProps o =
  {
  | o }


type CollapsePropsO eff =
  ( children :: Array ReactElement
  , classes :: Classes
  , in :: Boolean
  , onEnter :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onEntered :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onEntering :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onExit :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onExited :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onExiting :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , transitionDuration :: Number
  )

type CollapseClasses =
  ( container :: Styles
  , entered :: Styles
  )

createClasses :: forall classes
               . Subrow classes CollapseClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


collapse :: forall o eff
         . Subrow o (CollapsePropsO eff)
        => CollapseProps o -> Array ReactElement -> ReactElement
collapse = createElement collapseImpl
