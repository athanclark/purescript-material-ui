module MaterialUI.ExpansionPanelDetails
  ( expansionPanelDetails, ExpansionPanelDetailsProps, ExpansionPanelDetailsPropsO, ExpansionPanelDetailsClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import React (ReactClass, unsafeCreateElement, ReactElement)
import Row.Class (class SubRow)
import Unsafe.Coerce (unsafeCoerce)


foreign import expansionPanelDetailsImpl :: forall props. ReactClass props


type ExpansionPanelDetailsProps o =
  {
  | o }


type ExpansionPanelDetailsPropsO =
  ( classes :: Classes
  )

type ExpansionPanelDetailsClasses =
  ( root :: Styles
  )

createClasses :: forall classes
               . SubRow classes ExpansionPanelDetailsClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


expansionPanelDetails :: forall o
                       . SubRow o ExpansionPanelDetailsPropsO
                      => ExpansionPanelDetailsProps o -> Array ReactElement -> ReactElement
expansionPanelDetails = unsafeCreateElement expansionPanelDetailsImpl
