module MaterialUI.Table
  ( table, TableProps, TablePropsO, TableClasses
  , tableBody, TableBodyProps, TableBodyPropsO, TableBodyClasses
  , tableCell, TableCellProps, TableCellPropsO, TableCellClasses, withStylesCell
  , tableHead, TableHeadProps, TableHeadPropsO, TableHeadClasses
  , tableRow, TableRowProps, TableRowPropsO, TableRowClasses
  , tableFooter, TableFooterProps, TableFooterPropsO, TableFooterClasses
  , tablePagination, TablePaginationProps, TablePaginationPropsO, TablePaginationClasses
  , tableSortLabel, TableSortLabelProps, TableSortLabelPropsO, TableSortLabelClasses
  , Padding, checkbox, dense, none
  , Direction, asc, desc
  ) where

import MaterialUI.Types (Styles, Classes, class CompileStyles, Theme)

import Prelude
import React (ReactClass, unsafeCreateElement, statelessComponent, ReactElement)
import React.SyntheticEvent (SyntheticEvent)
import Row.Class (class SubRow)
import Data.Function.Uncurried (Fn2, runFn2)
import Effect.Uncurried (EffectFn1, EffectFn2)
import Unsafe.Coerce (unsafeCoerce)
import Type.Row (class RowToList, class ListToRow)


foreign import tableImpl :: forall props. ReactClass props


type TableProps o =
  {
  | o }


type TablePropsO componentProps =
  ( classes :: Classes
  , component :: ReactClass componentProps
  )

type TableClasses =
  ( root :: Styles
  )


table :: forall o componentProps
         . SubRow o (TablePropsO componentProps)
        => TableProps o -> Array ReactElement -> ReactElement
table = unsafeCreateElement tableImpl


----------------------------------

foreign import tableBodyImpl :: forall props. ReactClass props


type TableBodyProps o =
  {
  | o }


type TableBodyPropsO componentProps =
  ( classes :: Classes
  , component :: ReactClass componentProps
  )

type TableBodyClasses =
  ( root :: Styles
  )


tableBody :: forall o componentProps
         . SubRow o (TableBodyPropsO componentProps)
        => TableBodyProps o -> Array ReactElement -> ReactElement
tableBody = unsafeCreateElement tableBodyImpl

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


type TableCellPropsO eff componentProps =
  ( classes :: Classes
  , component :: ReactClass componentProps
  , numeric :: Boolean
  , padding :: Padding
  , onClick    :: EffectFn1 SyntheticEvent Unit
  )

type TableCellClasses =
  ( root :: Styles
  , numeric :: Styles
  , head :: Styles
  , body :: Styles
  , paddingNone :: Styles
  , paddingDense :: Styles
  , paddingCheckbox :: Styles
  , footer :: Styles
  )

type TableCellClassesCompiled =
  ( root :: String
  , numeric :: String
  , head :: String
  , body :: String
  , paddingNone :: String
  , paddingDense :: String
  , paddingCheckbox :: String
  , footer :: String
  )


tableCell :: forall eff o componentProps
         . SubRow o (TableCellPropsO eff componentProps)
        => TableCellProps o -> ReactElement -> ReactElement
tableCell p = unsafeCreateElement tableCellImpl p <<< unsafeCoerce


foreign import withStylesImpl :: forall styles compiledStyles a
                               . Fn2 (Theme -> { | styles }) (ReactClass {classes :: { | compiledStyles }}) (ReactClass a)


withStylesCell :: forall styles stylesList compiledStyles compiledStylesList
            . SubRow styles TableCellClasses
            => RowToList styles stylesList
            => CompileStyles stylesList compiledStylesList
            => ListToRow compiledStylesList compiledStyles
            => (Theme -> { | styles }) -> ({classes :: { | compiledStyles }} -> ReactElement) -> ReactElement
withStylesCell stylesF createElem = unsafeCreateElement (runFn2 withStylesImpl stylesF (statelessComponent createElem)) {} []

----------------------------------------


foreign import tableHeadImpl :: forall props. ReactClass props


type TableHeadProps o =
  {
  | o }


type TableHeadPropsO componentProps =
  ( classes :: Classes
  , component :: ReactClass componentProps
  )

type TableHeadClasses =
  ( root :: Styles
  )


tableHead :: forall o componentProps
         . SubRow o (TableHeadPropsO componentProps)
        => TableHeadProps o -> Array ReactElement -> ReactElement
tableHead = unsafeCreateElement tableHeadImpl

------------------------------------------


foreign import tableRowImpl :: forall props. ReactClass props


type TableRowProps o =
  {
  | o }


type TableRowPropsO eff componentProps =
  ( classes   :: Classes
  , component :: ReactClass componentProps
  , hover     :: Boolean
  , selected  :: Boolean
  , onClick   :: EffectFn1 SyntheticEvent Unit
  )

type TableRowClasses =
  ( root :: Styles
  , head :: Styles
  , footer :: Styles
  , hover :: Styles
  , selected :: Styles
  )


tableRow :: forall o componentProps eff
         . SubRow o (TableRowPropsO eff componentProps)
        => TableRowProps o -> Array ReactElement -> ReactElement
tableRow = unsafeCreateElement tableRowImpl

-----------------------------------------------------


foreign import tableFooterImpl :: forall props. ReactClass props


type TableFooterProps o =
  {
  | o }


type TableFooterPropsO componentProps =
  ( classes :: Classes
  , component :: ReactClass componentProps
  )

type TableFooterClasses =
  ( root :: Styles
  )


tableFooter :: forall o componentProps
         . SubRow o (TableFooterPropsO componentProps)
        => TableFooterProps o -> Array ReactElement -> ReactElement
tableFooter = unsafeCreateElement tableFooterImpl


----------------------------------------------


foreign import tablePaginationImpl :: forall props. ReactClass props


type TablePaginationProps eff o =
  { count :: Int
  , onChangePage :: EffectFn2 SyntheticEvent Int Unit
  , onChangeRowsPerPage :: EffectFn1 SyntheticEvent Unit
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


tablePagination :: forall eff o componentProps
         . SubRow o (TablePaginationPropsO componentProps)
        => TablePaginationProps eff o -> ReactElement
tablePagination p = unsafeCreateElement tablePaginationImpl p []


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


tableSortLabel :: forall o componentProps
         . SubRow o (TableSortLabelPropsO componentProps)
        => TableSortLabelProps o -> ReactElement
tableSortLabel p = unsafeCreateElement tableSortLabelImpl p []
