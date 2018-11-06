module MaterialUI.BottomNavigationAction
  ( bottomNavigationAction, BottomNavigationActionProps, BottomNavigationActionPropsO, BottomNavigationActionClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import Foreign (Foreign)
import React (ReactClass, unsafeCreateElement, ReactElement)
import Row.Class (class SubRow)
import Unsafe.Coerce (unsafeCoerce)


foreign import bottomNavigationActionImpl :: forall props. ReactClass props


type BottomNavigationActionProps o =
  {
  | o }


type BottomNavigationActionPropsO =
  ( icon :: ReactElement
  , label :: ReactElement
  , showLabel :: Boolean
  , classes :: Classes
  , value :: Foreign
  )


type BottomNavigationActionClasses =
  ( root :: Styles
  , selected :: Styles
  , label :: Styles
  , wrapper :: Styles
  , iconOnly :: Styles
  )

-- FIXME inherit from ButtonBase

createClasses :: forall classes
               . SubRow classes BottomNavigationActionClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


bottomNavigationAction :: forall o
         . SubRow o BottomNavigationActionPropsO
        => BottomNavigationActionProps o -> Array ReactElement -> ReactElement
bottomNavigationAction = unsafeCreateElement bottomNavigationActionImpl
