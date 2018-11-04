module MaterialUI.Tabs
  ( tabs, TabsProps, TabsPropsO, TabsClasses
  , tab, TabProps, TabPropsO, TabClasses
  , Color (..), secondary, primary, inherit, ScrollButtons, auto, on, off
  ) where

import MaterialUI.Types (Styles, Classes)

import Prelude
import React (ReactClass, unsafeCreateElement, ReactElement)
import React.SyntheticEvent (SyntheticEvent)
import Row.Class (class SubRow)
import Effect.Uncurried (EffectFn2)


foreign import tabsImpl :: forall props. ReactClass props


newtype Color = Color String

secondary :: Color
secondary = Color "secondary"
primary :: Color
primary = Color "primary"
inherit :: Color
inherit = Color "inherit"

newtype ScrollButtons = ScrollButtons String

auto :: ScrollButtons
auto = ScrollButtons "auto"
on :: ScrollButtons
on = ScrollButtons "on"
off :: ScrollButtons
off = ScrollButtons "off"


type TabsProps o =
  {
  | o }


type TabsPropsO eff =
  ( buttonClassName :: String
  , centered :: Boolean
  , classes :: Classes
  , fullWidth :: Boolean
  , indicatorClassName :: String
  , indicatorColor :: Color
  , onChange :: EffectFn2 SyntheticEvent Int Unit
  , scrollButtons :: ScrollButtons
  , scrollable :: Boolean
  , textColor :: Color
  , value :: Int
  )

type TabsClasses =
  ( root :: Styles
  , flexContainer :: Styles
  , scrollingContainer :: Styles
  , fixed :: Styles
  , scrollable :: Styles
  , centered :: Styles
  )


tabs :: forall o eff
      . SubRow o (TabsPropsO eff)
     => TabsProps o -> Array ReactElement -> ReactElement
tabs = unsafeCreateElement tabsImpl


foreign import tabImpl :: forall props. ReactClass props

type TabProps o =
  {
  | o }


type TabPropsO =
  ( classes :: Classes
  , disabled :: Boolean
  , icon :: ReactElement
  , label :: ReactElement
  , value :: Int
  )

type TabClasses =
  ( root :: Styles
  , flexContainer :: Styles
  , scrollingContainer :: Styles
  , fixed :: Styles
  , scrollable :: Styles
  , centered :: Styles
  , rootLabelIcon       :: Styles
  , rootAccent          :: Styles
  , rootAccentSelected  :: Styles
  , rootAccentDisabled  :: Styles
  , rootPrimary         :: Styles
  , rootPrimarySelected :: Styles
  , rootPrimaryDisabled :: Styles
  , rootInherit         :: Styles
  , rootInheritSelected :: Styles
  , rootInheritDisabled :: Styles
  , fullWidth :: Styles
  , labelContainer :: Styles
  , label :: Styles
  , labelWrapped :: Styles
  )


tab :: forall o
      . SubRow o TabPropsO
     => TabProps o -> ReactElement
tab props = unsafeCreateElement tabImpl props []

