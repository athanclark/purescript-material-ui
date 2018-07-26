module MaterialUI.Divider
  ( divider, DividerProps, DividerPropsO, DividerClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import React (ReactClass, createElement, ReactElement)
import Data.Record.Class (class Subrow)
import Unsafe.Coerce (unsafeCoerce)


foreign import dividerImpl :: forall props. ReactClass props


type DividerProps o =
  {
  | o }


type DividerPropsO =
  ( absolute :: Boolean
  , inset :: Boolean
  , light :: Boolean
  , classes :: Classes
  )

type DividerClasses =
  ( root :: Styles
  , default :: Styles
  , inset :: Styles
  , light :: Styles
  , absolute :: Styles
  )

createClasses :: forall classes
               . Subrow classes DividerClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


divider :: forall o
         . Subrow o DividerPropsO
        => DividerProps o -> ReactElement
divider props = createElement dividerImpl props []
