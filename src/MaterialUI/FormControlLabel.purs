module MaterialUI.FormControlLabel
  ( formControlLabel, FormControlLabelProps, FormControlLabelPropsO, FormControlLabelClasses
  , LabelPlacement, end, start, top, bottom
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import Prelude (Unit)
import Data.Nullable (Nullable)
import React (ReactClass, unsafeCreateElement, ReactElement, SyntheticEventHandler, ReactRef)
import React.SyntheticEvent (SyntheticEvent)
import Row.Class (class SubRow)
import Unsafe.Coerce (unsafeCoerce)
import Effect.Uncurried (EffectFn2)


foreign import formControlLabelImpl :: forall props. ReactClass props


type FormControlLabelProps o =
  {
  | o }


newtype LabelPlacement = LabelPlacement String

end :: LabelPlacement
end = LabelPlacement "end"

start :: LabelPlacement
start = LabelPlacement "start"

top :: LabelPlacement
top = LabelPlacement "top"

bottom :: LabelPlacement
bottom = LabelPlacement "bottom"


type FormControlLabelPropsO =
  ( checked :: Boolean
  , classes :: Classes
  , control :: ReactElement
  , disabled :: Boolean
  , inputRef :: SyntheticEventHandler (Nullable ReactRef)
  , label :: ReactElement
  , labelPlacement :: LabelPlacement -- ^ Default: `end`
  , name :: String
  , onChange :: EffectFn2 SyntheticEvent Boolean Unit
  , value :: String
  )

type FormControlLabelClasses =
  ( root :: Styles
  , labelPlacementStart :: Styles
  , labelPlacementTop :: Styles
  , labelPlacementBottom :: Styles
  , disabled :: Styles
  , label :: Styles
  )

createClasses :: forall classes
               . SubRow classes FormControlLabelClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


formControlLabel :: forall o
                  . SubRow o FormControlLabelPropsO
                 => FormControlLabelProps o -> Array ReactElement -> ReactElement
formControlLabel = unsafeCreateElement formControlLabelImpl
