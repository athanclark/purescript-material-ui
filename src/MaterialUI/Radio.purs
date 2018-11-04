module MaterialUI.Radio
  ( radio, RadioProps, RadioPropsO, RadioClasses
  , radioGroup, RadioGroupProps, RadioGroupPropsO, RadioGroupClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import Prelude
import React (ReactClass, unsafeCreateElement, ReactElement)
import React.SyntheticEvent (SyntheticEvent)
import Row.Class (class SubRow)
import Effect.Uncurried (EffectFn2)


foreign import radioImpl :: forall props. ReactClass props


type RadioProps o =
  {
  | o }


type RadioPropsO eff inputProps =
  ( checked :: Boolean
  , checkedClassName :: String
  , checkedIcon :: ReactElement
  , classes :: Classes
  , disableRipple :: Boolean
  , disabled :: Boolean
  , disabledClassName :: String
  , icon :: ReactElement
  , inputProps :: inputProps
  , name :: String
  , onChange :: EffectFn2 SyntheticEvent Boolean Unit
  , value :: String
  )

type RadioClasses =
  ( default :: Styles
  , checked :: Styles
  , disabled :: Styles
  )


radio :: forall eff inputProps o
         . SubRow o (RadioPropsO eff inputProps)
        => RadioProps o -> ReactElement
radio props = unsafeCreateElement radioImpl props []


foreign import radioGroupImpl :: forall props. ReactClass props


type RadioGroupProps o =
  {
  | o }


type RadioGroupPropsO eff =
  ( classes :: Classes
  , name :: String
  , onChange :: EffectFn2 SyntheticEvent String Unit
  , value :: String
  )

type RadioGroupClasses =
  ( root :: Styles
  )


radioGroup :: forall eff o
         . SubRow o (RadioGroupPropsO eff)
        => RadioGroupProps o -> Array ReactElement -> ReactElement
radioGroup = unsafeCreateElement radioGroupImpl
