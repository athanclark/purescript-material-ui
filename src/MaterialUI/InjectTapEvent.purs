module MaterialUI.InjectTapEvent where

import Prelude (Unit)
import Control.Monad.Eff (kind Effect, Eff)


foreign import data INJECT_TAP_EVENT

foreign import injectTapEvent :: forall eff. Eff (injectTapEvent :: INJECT_TAP_EVENT | eff) Unit
