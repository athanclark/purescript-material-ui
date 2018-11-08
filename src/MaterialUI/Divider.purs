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


type DividerPropsO componentProps =
  ( absolute :: Boolean -- ^ Default: `false`
  , classes :: Classes
  , component :: ReactClass componentProps -- ^ Default: `React.DOM.hr'`
  , inset :: Boolean -- ^ Default: `false`
  , light :: Boolean -- ^ Default: `false`
  )

type DividerClasses =
  ( root :: Styles
  , absolute :: Styles
  , inset :: Styles
  , light :: Styles
  )

createClasses :: forall classes
               . SubRow classes DividerClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


divider :: forall o componentProps
         . SubRow o (DividerPropsO componentProps)
        => DividerProps o -> ReactElement
divider props = unsafeCreateElement dividerImpl props []
