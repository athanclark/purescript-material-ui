module MaterialUI.Dialog
  ( dialog', DialogProps, DialogPropsO
  ) where

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)


foreign import dialogImpl :: forall props. ReactClass props


type DialogProps o =
  { open :: Boolean
  , title :: Array ReactElement
  | o }


type DialogPropsO eff =
  ( actions                   :: Array ReactElement
  , actionsContainerClassName :: String
  , actionsContainerStyle     :: forall row. { | row }
  , autoDetectWindowHeight    :: Boolean
  , autoScrollBodyContent     :: Boolean
  , bodyClassName             :: String
  , bodyStyles                :: forall row. { | row }
  , children                  :: Array ReactElement
  , contentClassName          :: String
  , contentStyle              :: forall row. { | row }
  , modal                     :: Boolean
  , onRequestClose            :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , overlayClassName          :: String
  , overlayStyle              :: forall row. { | row }
  , paperClassName            :: String
  , paperProps                :: forall row. { | row }
  , repositionOnUpdate        :: Boolean
  , style                     :: forall row. { | row }
  , titleClassName            :: String
  , titleStyle                :: forall row. { | row }
  )


dialog' :: forall eff o
         . Subrow o (DialogPropsO eff)
        => DialogProps o -> Array ReactElement -> ReactElement
dialog' = createElement dialogImpl
