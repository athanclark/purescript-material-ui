module MaterialUI.GridListTitle
  ( gridListTitle, GridListTitleProps, GridListTitlePropsO, GridListTitleClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import React (ReactClass, unsafeCreateElement, ReactElement)
import Row.Class (class SubRow)
import Unsafe.Coerce (unsafeCoerce)


foreign import gridListTitleImpl :: forall props. ReactClass props


type GridListTitleProps o =
  {
  | o }


type GridListTitlePropsO componentProps =
  ( classes :: Classes
  , cols :: Int -- ^ Default: 1
  , component :: ReactClass componentProps -- ^ Default: `React.DOM.li`
  , rows :: Int -- ^ Default: 1
  )

type GridListTitleClasses =
  ( root :: Styles
  , title :: Styles
  , imgFullHeight :: Styles
  , imgFullWidth :: Styles
  )

createClasses :: forall classes
               . SubRow classes GridListTitleClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


gridListTitle :: forall o componentProps
               . SubRow o (GridListTitlePropsO componentProps)
              => GridListTitleProps o -> Array ReactElement -> ReactElement
gridListTitle = unsafeCreateElement gridListTitleImpl
