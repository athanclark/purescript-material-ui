module MaterialUI.Form
  ( formControlLabel, FormControlLabelProps, FormControlLabelPropsO, FormControlLabelClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn2)
import Unsafe.Coerce (unsafeCoerce)


foreign import formControlLabelImpl :: forall props. ReactClass props


type FormControlLabelProps o =
  {
  | o }


type FormControlLabelPropsO eff =
  ( checked :: Boolean
  , classes :: Classes
  , control :: ReactElement
  , disabled :: Boolean
  , label :: ReactElement
  , name :: String
  , onChange :: EffFn2 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Boolean Unit
  , value :: String
  )

type FormControlLabelClasses =
  ( root :: Styles
  , disabled :: Styles
  , label :: Styles
  )


formControlLabel :: forall eff o
         . Subrow o (FormControlLabelPropsO eff)
        => FormControlLabelProps o -> ReactElement
formControlLabel props = createElement formControlLabelImpl props []
