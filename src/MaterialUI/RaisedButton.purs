module MaterialUI.RaisedButton
  ( raisedButton', before, LabelPosition, RaisedButtonProps, RaisedButtonPropsO
  ) where


import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Unsafe.Coerce (unsafeCoerce)
import Control.Monad.Eff.Uncurried (EffFn1)


foreign import raisedButtonImpl :: forall props. ReactClass props


type RaisedButtonProps o =
  {
  | o }


type RaisedButtonPropsO eff =
  ( primary :: Boolean
  , secondary :: Boolean
  , fullWidth :: Boolean
  , label :: String
  , labelPosition :: LabelPosition
  , containerElement :: String
  , icon :: ReactElement
  , onTouchTap :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  )


newtype LabelPosition = LabelPosition String

before :: LabelPosition
before = LabelPosition "before"


raisedButton' :: forall eff o
               . Subrow o (RaisedButtonPropsO eff)
              => RaisedButtonProps o -> Array ReactElement -> ReactElement
raisedButton' = createElement raisedButtonImpl
