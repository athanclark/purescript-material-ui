module MaterialUI.Grid
  ( grid, GridProps, GridPropsO, GridClasses
  , AlignContent, stretchContent, centerContent, flexStartContent, flexEndContent, spaceBetweenContent, spaceAroundContent
  , AlignItems, stretchItems, centerItems, flexStartItems, flexEndItems, baselineItems
  , Direction, row, rowReverse, column, columnReverse
  , Justify, flexStartJustify, flexEndJustify, centerJustify, spaceBetweenJustify, spaceAroundJustify
  , Spacing, spacing0, spacing8, spacing16, spacing24, spacing40
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

stretchItems :: AlignContent
stretchItems = AlignContent "stretch"

centerItems :: AlignContent
centerItems = AlignContent "center"

flexStartItems :: AlignContent
flexStartItems = AlignContent "flex-start"

flexEndItems :: AlignContent
flexEndItems = AlignContent "flex-end"

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

newtype Spacing = Spacing Int

spacing0 :: Spacing
spacing0 = Spacing 0

spacing8 :: Spacing
spacing8 = Spacing 8

spacing16 :: Spacing
spacing16 = Spacing 16

spacing24 :: Spacing
spacing24 = Spacing 24

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
  ( alignContent :: AlignContent
  , raised :: Boolean
  , classes :: Classes
  , component :: ReactClass componentProps
  , container :: Boolean
  , direction :: Direction
  , item :: Boolean
  , justify :: Justify
  , xl :: Int
  , lg :: Int
  , md :: Int
  , sm :: Int
  , xs :: Int
  , spacing :: Spacing
  , wrap :: Wrap
  )

type GridClasses =
  ( typeContainer :: Styles
  , typeItem :: Styles
  , "direction-xs-column" :: Styles
  , "direction-xs-column-reverse" :: Styles
  , "irection-xs-row-reverse" :: Styles
  , "wrap-xs-nowrap" :: Styles
  , "lign-items-xs-center" :: Styles
  , "align-items-xs-flex-start" :: Styles
  , "lign-items-xs-flex-end" :: Styles
  , "align-items-xs-baseline" :: Styles
  , "lign-content-xs-center" :: Styles
  , "align-content-xs-flex-start" :: Styles
  , "lign-content-xs-flex-end" :: Styles
  , "align-content-xs-space-between" :: Styles
  , "lign-content-xs-space-around" :: Styles
  , "justify-xs-center" :: Styles
  , "ustify-xs-flex-end" :: Styles
  , "justify-xs-space-between" :: Styles
  , "ustify-xs-space-around" :: Styles
  , "spacing-xs-8" :: Styles
  , "pacing-xs-16" :: Styles
  , "spacing-xs-24" :: Styles
  , "pacing-xs-40" :: Styles
  , "grid-xs" :: Styles
  , "rid-xs-1" :: Styles
  , "grid-xs-2" :: Styles
  , "rid-xs-3" :: Styles
  , "grid-xs-4" :: Styles
  , "rid-xs-5" :: Styles
  , "grid-xs-6" :: Styles
  , "rid-xs-7" :: Styles
  , "grid-xs-8" :: Styles
  , "rid-xs-9" :: Styles
  , "grid-xs-10" :: Styles
  , "rid-xs-11" :: Styles
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
