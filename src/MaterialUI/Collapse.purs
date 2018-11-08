module MaterialUI.Collapse
  ( collapse, CollapseProps, CollapsePropsO, CollapseClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import React.Transition (TransitionProps)
import React (ReactClass, unsafeCreateElement, ReactElement)
import Row.Class (class SubRow)
import Type.Row (type (+))
import Unsafe.Coerce (unsafeCoerce)


foreign import collapseImpl :: forall props. ReactClass props


type CollapseProps o =
  {
  | o }


type CollapsePropsO componentProps r =
  ( classes :: Classes
  , collapsedHeight :: String
  , component :: ReactClass componentProps -- ^ Default: React.DOM.div'
  | r)

type CollapseClasses =
  ( container :: Styles
  , entered :: Styles
  , wrapper :: Styles
  , wrapperInner :: Styles
  )

createClasses :: forall classes
               . SubRow classes CollapseClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


collapse :: forall o componentProps
         . SubRow o (CollapsePropsO componentProps + TransitionProps + ())
        => CollapseProps o -> Array ReactElement -> ReactElement
collapse = unsafeCreateElement collapseImpl
