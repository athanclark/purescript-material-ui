module MaterialUI.Collapse
  ( collapse, CollapseProps, CollapsePropsO, CollapseClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import Prelude
import React (ReactClass, unsafeCreateElement, ReactElement)
import React.SyntheticEvent (SyntheticEvent)
import Row.Class (class SubRow)
import Effect.Uncurried (EffectFn1)
import Unsafe.Coerce (unsafeCoerce)


foreign import collapseImpl :: forall props. ReactClass props


type CollapseProps o =
  {
  | o }


type CollapsePropsO eff =
  ( classes :: Classes
  , style :: Styles
  , in :: Boolean
  , onEnter :: EffectFn1 SyntheticEvent Unit
  , onEntered :: EffectFn1 SyntheticEvent Unit
  , onEntering :: EffectFn1 SyntheticEvent Unit
  , onExit :: EffectFn1 SyntheticEvent Unit
  , onExited :: EffectFn1 SyntheticEvent Unit
  , onExiting :: EffectFn1 SyntheticEvent Unit
  , transitionDuration :: Number
  , unmountOnExit :: Boolean
  )

type CollapseClasses =
  ( container :: Styles
  , entered :: Styles
  )

createClasses :: forall classes
               . SubRow classes CollapseClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


collapse :: forall o eff
         . SubRow o (CollapsePropsO eff)
        => CollapseProps o -> Array ReactElement -> ReactElement
collapse = unsafeCreateElement collapseImpl
