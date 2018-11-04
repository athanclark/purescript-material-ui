module MaterialUI.RaisedButton
  ( raisedButton, before, LabelPosition, RaisedButtonProps, RaisedButtonPropsO
  ) where

import MaterialUI.Types (Styles)

import Prelude
import React (ReactClass, unsafeCreateElement, ReactElement)
import React.SyntheticEvent (SyntheticEvent)
import Row.Class (class SubRow)
import Effect.Uncurried (EffectFn1)


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
  , style :: Styles
  , onTouchTap :: EffectFn1 SyntheticEvent Unit
  )


newtype LabelPosition = LabelPosition String

before :: LabelPosition
before = LabelPosition "before"


raisedButton :: forall eff o
               . SubRow o (RaisedButtonPropsO eff)
              => RaisedButtonProps o -> Array ReactElement -> ReactElement
raisedButton = unsafeCreateElement raisedButtonImpl
