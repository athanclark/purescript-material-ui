module MaterialUI.ExpansionPanelSummary
  ( expansionPanelSummary, ExpansionPanelSummaryProps, ExpansionPanelSummaryPropsO, ExpansionPanelSummaryClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes, class RemoveSymbol)
import MaterialUI.ButtonBase (ButtonBasePropsO)

import React (ReactClass, unsafeCreateElement, ReactElement)
import Row.Class (class SubRow)
import Type.Row (class RowToList, class RowListRemove, class ListToRow, type (+))
import Unsafe.Coerce (unsafeCoerce)


foreign import expansionPanelSummaryImpl :: forall props. ReactClass props


type ExpansionPanelSummaryProps o =
  {
  | o }


type ExpansionPanelSummaryPropsO iconButtonProps r =
  ( classes :: Classes
  , expandIcon :: ReactElement
  , "IconButtonProps" :: iconButtonProps
  | r)

type ExpansionPanelSummaryClasses =
  ( root :: Styles
  , expanded :: Styles
  , focused :: Styles
  , disabled :: Styles
  , content :: Styles
  , expandIcon :: Styles
  )

createClasses :: forall classes
               . SubRow classes ExpansionPanelSummaryClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


expansionPanelSummary :: forall o componentProps touchRippleProps buttonBaseList
                         buttonBaseList' buttonBaseProps iconButtonProps
                       . SubRow o (ExpansionPanelSummaryPropsO iconButtonProps + buttonBaseProps)
                      => RemoveSymbol "classes" (ButtonBasePropsO componentProps touchRippleProps) buttonBaseProps
                      => ExpansionPanelSummaryProps o -> Array ReactElement -> ReactElement
expansionPanelSummary = unsafeCreateElement expansionPanelSummaryImpl
