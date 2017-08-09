module Main where

import MaterialUI.InjectTapEvent (INJECT_TAP_EVENT, injectTapEvent)
import MaterialUI.MuiThemeProvider (muiThemeProvider')

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)

import Thermite as T
import React as R
import React.DOM as R
import React.DOM.Props as RP
import DOM (DOM)


type State = Unit

initialState = unit

type Action = Unit

spec :: T.Spec _ State _ Action
spec = T.simpleSpec performAction render
  where
    performAction :: T.PerformAction _ State _ Action
    performAction action props state = pure unit

    render :: T.Render State _ Action
    render dispatch props state children =
      []



main :: forall eff
      . Eff ( console        :: CONSOLE
            , dom            :: DOM
            , injectTapEvent :: INJECT_TAP_EVENT
            | eff) Unit
main = do
  log "Hello sailor!"

  injectTapEvent

  T.defaultMain spec initialState unit
