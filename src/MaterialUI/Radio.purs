module MaterialUI.Radio
  ( radio, RadioProps, RadioPropsO, RadioClasses
  , radioGroup, RadioGroupProps, RadioGroupPropsO, RadioGroupClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn2)
import Unsafe.Coerce (unsafeCoerce)


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
  , onChange :: EffFn2 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Boolean Unit
  , value :: String
  )

type RadioClasses =
  ( default :: Styles
  , checked :: Styles
  , disabled :: Styles
  )


radio :: forall eff inputProps o
         . Subrow o (RadioPropsO eff inputProps)
        => RadioProps o -> ReactElement
radio props = createElement radioImpl props []


foreign import radioGroupImpl :: forall props. ReactClass props


type RadioGroupProps o =
  {
  | o }


type RadioGroupPropsO eff =
  ( children :: Array ReactElement
  , classes :: Classes
  , name :: String
  , onChange :: EffFn2 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event String Unit
  , value :: String
  )

type RadioGroupClasses =
  ( root :: Styles
  )


radioGroup :: forall eff o
         . Subrow o (RadioGroupPropsO eff)
        => RadioGroupProps o -> Array ReactElement -> ReactElement
radioGroup = createElement radioGroupImpl
