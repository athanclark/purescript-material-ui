module MaterialUI.Table
  ( table, TableProps, TablePropsO, TableClasses, createClasses
  , tableBody, TableBodyProps, TableBodyPropsO, TableBodyClasses, createClassesBody
  , tableCell, TableCellProps, TableCellPropsO, TableCellClasses, createClassesCell
  , tableHead, TableHeadProps, TableHeadPropsO, TableHeadClasses, createClassesHead
  , tableRow, TableRowProps, TableRowPropsO, TableRowClasses, createClassesRow
  , tableFooter, TableFooterProps, TableFooterPropsO, TableFooterClasses, createClassesFooter
  , tablePagination, TablePaginationProps, TablePaginationPropsO, TablePaginationClasses, createClassesPagination
  , tableSortLabel, TableSortLabelProps, TableSortLabelPropsO, TableSortLabelClasses, createClassesSortLabel
  , Padding, checkbox, dense, none
  , Direction, asc, desc
  ) where

import MaterialUI.Types (Styles, Classes)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1, EffFn2)
import Unsafe.Coerce (unsafeCoerce)


foreign import tableImpl :: forall props. ReactClass props


type TableProps o =
  {
  | o }


type TablePropsO componentProps =
  ( children :: Array ReactElement
  , classes :: Classes
  , component :: ReactClass componentProps
  )

type TableClasses =
  ( root :: Styles
  )

createClasses :: forall classes
               . Subrow classes TableClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


table :: forall o componentProps
         . Subrow o (TablePropsO componentProps)
        => TableProps o -> Array ReactElement -> ReactElement
table = createElement tableImpl


----------------------------------

foreign import tableBodyImpl :: forall props. ReactClass props


type TableBodyProps o =
  {
  | o }


type TableBodyPropsO componentProps =
  ( children :: Array ReactElement
  , classes :: Classes
  , component :: ReactClass componentProps
  )

type TableBodyClasses =
  ( root :: Styles
  )

createClassesBody :: forall classes
               . Subrow classes TableBodyClasses
              => { | classes } -> Classes
createClassesBody = unsafeCoerce


tableBody :: forall o componentProps
         . Subrow o (TableBodyPropsO componentProps)
        => TableBodyProps o -> Array ReactElement -> ReactElement
tableBody = createElement tableBodyImpl

-------------------------------------




foreign import tableCellImpl :: forall props. ReactClass props


type TableCellProps o =
  {
  | o }

newtype Padding = Padding String

default :: Padding
default = Padding "default"

checkbox :: Padding
checkbox = Padding "checkbox"

dense :: Padding
dense = Padding "dense"

none :: Padding
none = Padding "none"


type TableCellPropsO componentProps =
  ( children :: ReactElement
  , classes :: Classes
  , component :: ReactClass componentProps
  , numeric :: Boolean
  , padding :: Padding
  )

type TableCellClasses =
  ( root :: Styles
  , numeric :: Styles
  , head :: Styles
  , paddingDefault :: Styles
  , paddingDense :: Styles
  , paddingCheckbox :: Styles
  , footer :: Styles
  )

createClassesCell :: forall classes
               . Subrow classes TableCellClasses
              => { | classes } -> Classes
createClassesCell = unsafeCoerce


tableCell :: forall o componentProps
         . Subrow o (TableCellPropsO componentProps)
        => TableCellProps o -> ReactElement -> ReactElement
tableCell p = createElement tableCellImpl p <<< unsafeCoerce

----------------------------------------


foreign import tableHeadImpl :: forall props. ReactClass props


type TableHeadProps o =
  {
  | o }


type TableHeadPropsO componentProps =
  ( children :: Array ReactElement
  , classes :: Classes
  , component :: ReactClass componentProps
  )

type TableHeadClasses =
  ( root :: Styles
  )

createClassesHead :: forall classes
               . Subrow classes TableHeadClasses
              => { | classes } -> Classes
createClassesHead = unsafeCoerce


tableHead :: forall o componentProps
         . Subrow o (TableHeadPropsO componentProps)
        => TableHeadProps o -> Array ReactElement -> ReactElement
tableHead = createElement tableHeadImpl

------------------------------------------


foreign import tableRowImpl :: forall props. ReactClass props


type TableRowProps o =
  {
  | o }


type TableRowPropsO componentProps =
  ( children :: Array ReactElement
  , classes :: Classes
  , component :: ReactClass componentProps
  , hover :: Boolean
  , selected :: Boolean
  )

type TableRowClasses =
  ( root :: Styles
  , head :: Styles
  , footer :: Styles
  , hover :: Styles
  , selected :: Styles
  )

createClassesRow :: forall classes
               . Subrow classes TableRowClasses
              => { | classes } -> Classes
createClassesRow = unsafeCoerce


tableRow :: forall o componentProps
         . Subrow o (TableRowPropsO componentProps)
        => TableRowProps o -> Array ReactElement -> ReactElement
tableRow = createElement tableRowImpl

-----------------------------------------------------


foreign import tableFooterImpl :: forall props. ReactClass props


type TableFooterProps o =
  {
  | o }


type TableFooterPropsO componentProps =
  ( children :: Array ReactElement
  , classes :: Classes
  , component :: ReactClass componentProps
  )

type TableFooterClasses =
  ( root :: Styles
  )

createClassesFooter :: forall classes
               . Subrow classes TableFooterClasses
              => { | classes } -> Classes
createClassesFooter = unsafeCoerce


tableFooter :: forall o componentProps
         . Subrow o (TableFooterPropsO componentProps)
        => TableFooterProps o -> Array ReactElement -> ReactElement
tableFooter = createElement tableFooterImpl


----------------------------------------------


foreign import tablePaginationImpl :: forall props. ReactClass props


type TablePaginationProps eff o =
  { count :: Int
  , onChangePage :: EffFn2 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Int Unit
  , onChangeRowsPerPage :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , page :: Int
  , rowsPerPage :: Int
  | o }


type TablePaginationPropsO componentProps =
  ( classes :: Classes
  , component :: ReactClass componentProps
  , labelDisplayedRows :: {from :: Int, to :: Int, count :: Int} -> String
  , labelRowsPerPage :: {from :: Int, to :: Int, count :: Int, page :: Int} -> String
  , rowsPerPageOptions :: Array Int
  )

type TablePaginationClasses =
  ( root :: Styles
  )

createClassesPagination :: forall classes
               . Subrow classes TablePaginationClasses
              => { | classes } -> Classes
createClassesPagination = unsafeCoerce


tablePagination :: forall eff o componentProps
         . Subrow o (TablePaginationPropsO componentProps)
        => TablePaginationProps eff o -> ReactElement
tablePagination p = createElement tablePaginationImpl p []


---------------------------------------------------


foreign import tableSortLabelImpl :: forall props. ReactClass props


type TableSortLabelProps o =
  {
  | o }

newtype Direction = Direction String

asc :: Direction
asc = Direction "asc"

desc :: Direction
desc = Direction "desc"


type TableSortLabelPropsO componentProps =
  ( active :: Boolean
  , children :: Array ReactElement
  , classes :: Classes
  , direction :: Direction
  )

type TableSortLabelClasses =
  ( root :: Styles
  , active :: Styles
  , icon :: Styles
  , desc :: Styles
  , asc :: Styles
  )

createClassesSortLabel :: forall classes
               . Subrow classes TableSortLabelClasses
              => { | classes } -> Classes
createClassesSortLabel = unsafeCoerce


tableSortLabel :: forall o componentProps
         . Subrow o (TableSortLabelPropsO componentProps)
        => TableSortLabelProps o -> ReactElement
tableSortLabel p = createElement tableSortLabelImpl p []
