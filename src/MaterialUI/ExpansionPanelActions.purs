module MaterialUI.ExpansionPanelActions
  ( expansionPanelActions, ExpansionPanelActionsProps, ExpansionPanelActionsPropsO, ExpansionPanelActionsClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import React (ReactClass, unsafeCreateElement, ReactElement)
import Row.Class (class SubRow)
import Unsafe.Coerce (unsafeCoerce)


foreign import expansionPanelActionsImpl :: forall props. ReactClass props


type ExpansionPanelActionsProps o =
  {
  | o }


type ExpansionPanelActionsPropsO =
  ( classes :: Classes
  )

type ExpansionPanelActionsClasses =
  ( root :: Styles
  , action :: Styles
  )

createClasses :: forall classes
               . SubRow classes ExpansionPanelActionsClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


expansionPanelActions :: forall o
                       . SubRow o ExpansionPanelActionsPropsO
                      => ExpansionPanelActionsProps o -> Array ReactElement -> ReactElement
expansionPanelActions = unsafeCreateElement expansionPanelActionsImpl
