module MaterialUI.GridList
  ( gridList, GridListProps, GridListPropsO, GridListClasses
  , CellHeight (..), autoCellHeight
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import React (ReactClass, unsafeCreateElement, ReactElement)
import Row.Class (class SubRow)
import Unsafe.Coerce (unsafeCoerce)


foreign import gridListImpl :: forall props. ReactClass props


type GridListProps o =
  {
  | o }

newtype CellHeight = CellHeight Int

autoCellHeight :: CellHeight
autoCellHeight = CellHeight (unsafeCoerce "auto")


type GridListPropsO componentProps =
  ( cellHeight :: CellHeight -- ^ Default 180
  , classes :: Classes
  , cols :: Int -- ^ Default: 2
  , component :: ReactClass componentProps -- ^ Default: `React.DOM.ul`
  , spacing :: Number -- ^ Default: 4.0
  )

type GridListClasses =
  ( root :: Styles
  )

createClasses :: forall classes
               . SubRow classes GridListClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


gridList :: forall o componentProps
          . SubRow o (GridListPropsO componentProps)
         => GridListProps o -> Array ReactElement -> ReactElement
gridList = unsafeCreateElement gridListImpl
