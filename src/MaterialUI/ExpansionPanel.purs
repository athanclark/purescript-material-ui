module MaterialUI.ExpansionPanel
  ( expansionPanel, ExpansionPanelProps, ExpansionPanelPropsO, ExpansionPanelClasses
  , createClasses
  ) where

import MaterialUI.Paper (PaperPropsO)
import MaterialUI.Types (Styles, Classes, class RemoveSymbol)

import Prelude (Unit)
import React (ReactClass, unsafeCreateElement, ReactElement)
import React.SyntheticEvent (SyntheticEvent)
import Row.Class (class SubRow)
import Type.Row (type (+))
import Unsafe.Coerce (unsafeCoerce)
import Effect.Uncurried (EffectFn2)


foreign import expansionPanelImpl :: forall props. ReactClass props


type ExpansionPanelProps o =
  {
  | o }


type ExpansionPanelPropsO collapseProps r =
  ( classes :: Classes
  , "CollapseProps":: collapseProps
  , defaultExpanded :: Boolean -- ^ Default: `false`
  , disabled :: Boolean -- ^ Default: `false`
  , expanded :: Boolean
  , onChange :: EffectFn2 SyntheticEvent Boolean Unit -- "expanded"
  | r)

type ExpansionPanelClasses =
  ( root :: Styles
  , expanded :: Styles
  , disabled :: Styles
  )

createClasses :: forall classes
               . SubRow classes ExpansionPanelClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


expansionPanel :: forall o collapseProps componentProps paperProps
                . SubRow o (ExpansionPanelPropsO collapseProps + paperProps)
               => RemoveSymbol "classes" (PaperPropsO componentProps) paperProps
               => ExpansionPanelProps o -> Array ReactElement -> ReactElement
expansionPanel = unsafeCreateElement expansionPanelImpl
