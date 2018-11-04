module MaterialUI.Divider
  ( divider, DividerProps, DividerPropsO, DividerClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import React (ReactClass, unsafeCreateElement, ReactElement)
import Row.Class (class SubRow)
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
               . SubRow classes DividerClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


divider :: forall o
         . SubRow o DividerPropsO
        => DividerProps o -> ReactElement
divider props = unsafeCreateElement dividerImpl props []
