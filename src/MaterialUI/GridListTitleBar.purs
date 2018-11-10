module MaterialUI.GridListTitleBar
  ( gridListTitleBar, GridListTitleBarProps, GridListTitleBarPropsO, GridListTitleBarClasses
  , ActionPosition, left, right, TitlePosition, top, bottom
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import React (ReactClass, unsafeCreateElement, ReactElement)
import Row.Class (class SubRow)
import Unsafe.Coerce (unsafeCoerce)


foreign import gridListTitleBarImpl :: forall props. ReactClass props


type GridListTitleBarProps o =
  {
  | o }

newtype ActionPosition = ActionPosition String

left :: ActionPosition
left = ActionPosition "left"

right :: ActionPosition
right = ActionPosition "right"

newtype TitlePosition = TitlePosition String

top :: TitlePosition
top = TitlePosition "top"

bottom :: TitlePosition
bottom = TitlePosition "bottom"

type GridListTitleBarPropsO =
  ( actionIcon :: ReactElement
  , actionPosition :: ActionPosition -- ^ Default: `right`
  , classes :: Classes
  , subtitle :: ReactElement
  , title :: ReactElement
  , titlePosition :: TitlePosition -- ^ Default: `bottom`
  )

type GridListTitleBarClasses =
  ( root :: Styles
  , titlePositionBottom :: Styles
  , titlePositionTop :: Styles
  , rootSubtitle :: Styles
  , titleWrap :: Styles
  , titleWrapActionPosLeft :: Styles
  , titleWrapActionPosRight :: Styles
  , title :: Styles
  , subtitle :: Styles
  , actionIcon :: Styles
  , actionIconActionPosLeft :: Styles
  )

createClasses :: forall classes
               . SubRow classes GridListTitleBarClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


gridListTitleBar :: forall o
                  . SubRow o GridListTitleBarPropsO
                 => GridListTitleBarProps o -> Array ReactElement -> ReactElement
gridListTitleBar = unsafeCreateElement gridListTitleBarImpl
