module MaterialUI.Select
  ( select, SelectProps, SelectPropsO, SelectClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Data.Argonaut (Json)
import Control.Monad.Eff.Uncurried (EffFn1)
import Unsafe.Coerce (unsafeCoerce)


foreign import selectImpl :: forall props. ReactClass props


type SelectProps o =
  {
  | o }


type SelectPropsO menuProps =
  ( "MenuProps" :: menuProps
  , autoWidth :: Boolean
  , children :: Array ReactElement
  , classes :: Classes
  , displayEmpty :: Boolean
  , input :: ReactElement
  , multiple :: Boolean
  , native :: Boolean
  , renderValue :: Json -> String
  , value :: Json
  )

type SelectClasses =
  ( root :: Styles
  , select :: Styles
  , selectMenu :: Styles
  , disabled :: Styles
  , icon :: Styles
  )

createClasses :: forall classes
               . Subrow classes SelectClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


select :: forall o menuProps
         . Subrow o (SelectPropsO menuProps)
        => SelectProps o -> Array ReactElement -> ReactElement
select = createElement selectImpl
