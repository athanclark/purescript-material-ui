module MaterialUI.Grid
  ( grid, GridProps, GridPropsO, GridClasses
  , AlignContent, stretchContent, centerContent, flexStartContent, flexEndContent, spaceBetweenContent, spaceAroundContent
  , AlignItems, stretchItems, centerItems, flexStartItems, flexEndItems, baselineItems
  , Direction, row, rowReverse, column, columnReverse
  , Justify, flexStartJustify, flexEndJustify, centerJustify, spaceBetweenJustify, spaceAroundJustify
  , Grids, falseGrids, trueGrids, autoGrids, grids1, grids2, grids3, grids4, grids5, grids6, grids7, grids8, grids9, grids10, grids11, grids12
  , Spacing, spacing0, spacing8, spacing16, spacing24, spacing32, spacing40
  , Wrap, wrap, nowrap, wrapReverse
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import React (ReactClass, unsafeCreateElement, ReactElement)
import Row.Class (class SubRow)
import Unsafe.Coerce (unsafeCoerce)


foreign import gridImpl :: forall props. ReactClass props


type GridProps o =
  {
  | o }

newtype AlignContent = AlignContent String

stretchContent :: AlignContent
stretchContent = AlignContent "stretch"

centerContent :: AlignContent
centerContent = AlignContent "center"

flexStartContent :: AlignContent
flexStartContent = AlignContent "flex-start"

flexEndContent :: AlignContent
flexEndContent = AlignContent "flex-end"

spaceBetweenContent :: AlignContent
spaceBetweenContent = AlignContent "space-between"

spaceAroundContent :: AlignContent
spaceAroundContent = AlignContent "space-around"

newtype AlignItems = AlignItems String

flexStartItems :: AlignContent
flexStartItems = AlignContent "flex-start"

centerItems :: AlignContent
centerItems = AlignContent "center"

flexEndItems :: AlignContent
flexEndItems = AlignContent "flex-end"

stretchItems :: AlignContent
stretchItems = AlignContent "stretch"

baselineItems :: AlignContent
baselineItems = AlignContent "baseline"

newtype Direction = Direction String

row :: Direction
row = Direction "row"

rowReverse :: Direction
rowReverse = Direction "row-reverse"

column :: Direction
column = Direction "column"

columnReverse :: Direction
columnReverse = Direction "column-reverse"

newtype Justify = Justify String

flexStartJustify :: Justify
flexStartJustify = Justify "flex-start"

flexEndJustify :: Justify
flexEndJustify = Justify "flex-end"

centerJustify :: Justify
centerJustify = Justify "center"

spaceBetweenJustify :: Justify
spaceBetweenJustify = Justify "space-between"

spaceAroundJustify :: Justify
spaceAroundJustify = Justify "space-around"

newtype Grids = Grids Int

falseGrids :: Grids
falseGrids = Grids (unsafeCoerce false)

trueGrids :: Grids
trueGrids = Grids (unsafeCoerce true)

autoGrids :: Grids
autoGrids = Grids (unsafeCoerce "auto")

grids1 :: Grids
grids1 = Grids 1

grids2 :: Grids
grids2 = Grids 2

grids3 :: Grids
grids3 = Grids 3

grids4 :: Grids
grids4 = Grids 4

grids5 :: Grids
grids5 = Grids 5

grids6 :: Grids
grids6 = Grids 6

grids7 :: Grids
grids7 = Grids 7

grids8 :: Grids
grids8 = Grids 8

grids9 :: Grids
grids9 = Grids 9

grids10 :: Grids
grids10 = Grids 10

grids11 :: Grids
grids11 = Grids 11

grids12 :: Grids
grids12 = Grids 12

newtype Spacing = Spacing Int

spacing0 :: Spacing
spacing0 = Spacing 0

spacing8 :: Spacing
spacing8 = Spacing 8

spacing16 :: Spacing
spacing16 = Spacing 16

spacing24 :: Spacing
spacing24 = Spacing 24

spacing32 :: Spacing
spacing32 = Spacing 32

spacing40 :: Spacing
spacing40 = Spacing 40

newtype Wrap = Wrap String

nowrap :: Wrap
nowrap = Wrap "nowrap"

wrap :: Wrap
wrap = Wrap "wrap"

wrapReverse :: Wrap
wrapReverse = Wrap "wrap-reverse"


type GridPropsO componentProps =
  ( alignContent :: AlignContent -- ^ Default: `stretch`
  , alignItems :: AlignItems -- ^ Default: `stretch`
  , classes :: Classes
  , component :: ReactClass componentProps -- ^ Default: `div`
  , container :: Boolean -- ^ Default: `false`
  , direction :: Direction -- ^ Default: `row`
  , item :: Boolean -- ^ Default: `false`
  , justify :: Justify -- ^ Default: `flex-start`
  , xl :: Grids -- ^ Default: `false`
  , lg :: Grids -- ^ Default: `false`
  , md :: Grids -- ^ Default: `false`
  , sm :: Grids -- ^ Default: `false`
  , xs :: Grids -- ^ Default: `false`
  , spacing :: Spacing -- ^ Default: 0
  , wrap :: Wrap -- ^ Default: `wrap`
  , zeroMinWidth :: Boolean -- ^ Default: `false`
  )

type GridClasses =
  ( container :: Styles
  , item :: Styles
  , zeroMinWidth :: Styles
  , "direction-xs-column" :: Styles
  , "direction-xs-column-reverse" :: Styles
  , "irection-xs-row-reverse" :: Styles
  , "wrap-xs-nowrap" :: Styles
  , "wrap-xs-wrap-reverse" :: Styles
  , "align-items-xs-center" :: Styles
  , "align-items-xs-flex-start" :: Styles
  , "align-items-xs-flex-end" :: Styles
  , "align-items-xs-baseline" :: Styles
  , "align-content-xs-center" :: Styles
  , "align-content-xs-flex-start" :: Styles
  , "align-content-xs-flex-end" :: Styles
  , "align-content-xs-space-between" :: Styles
  , "align-content-xs-space-around" :: Styles
  , "justify-xs-center" :: Styles
  , "justify-xs-flex-end" :: Styles
  , "justify-xs-space-between" :: Styles
  , "justify-xs-space-around" :: Styles
  , "justify-xs-space-evenly" :: Styles
  , "spacing-xs-8" :: Styles
  , "spacing-xs-16" :: Styles
  , "spacing-xs-24" :: Styles
  , "spacing-xs-32" :: Styles
  , "spacing-xs-40" :: Styles
  , "grid-xs" :: Styles
  , "grid-xs-1" :: Styles
  , "grid-xs-2" :: Styles
  , "grid-xs-3" :: Styles
  , "grid-xs-4" :: Styles
  , "grid-xs-5" :: Styles
  , "grid-xs-6" :: Styles
  , "grid-xs-7" :: Styles
  , "grid-xs-8" :: Styles
  , "grid-xs-9" :: Styles
  , "grid-xs-10" :: Styles
  , "grid-xs-11" :: Styles
  , "grid-xs-12" :: Styles
  )

createClasses :: forall classes
               . SubRow classes GridClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


grid :: forall o componentProps
         . SubRow o (GridPropsO componentProps)
        => GridProps o -> Array ReactElement -> ReactElement
grid = unsafeCreateElement gridImpl
