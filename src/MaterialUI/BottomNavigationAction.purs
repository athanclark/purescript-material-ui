module MaterialUI.BottomNavigationAction
  ( bottomNavigationAction, BottomNavigationActionProps, BottomNavigationActionPropsO, BottomNavigationActionClasses
  , createClasses
  ) where

import MaterialUI.ButtonBase (ButtonBasePropsO)
import MaterialUI.Types (Styles, Classes, class RemoveSymbol)

import Foreign (Foreign)
import React (ReactClass, unsafeCreateElement, ReactElement)
import Row.Class (class SubRow)
import Type.Row (type (+))
import Unsafe.Coerce (unsafeCoerce)


foreign import bottomNavigationActionImpl :: forall props. ReactClass props


type BottomNavigationActionProps o =
  {
  | o }


type BottomNavigationActionPropsO r =
  ( icon :: ReactElement
  , label :: ReactElement
  , showLabel :: Boolean
  , classes :: Classes
  , value :: Foreign
  | r)


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


bottomNavigationAction :: forall o buttonBaseProps
                          componentProps touchRippleProps
                        . SubRow o (BottomNavigationActionPropsO + buttonBaseProps)
                       => RemoveSymbol "classes" (ButtonBasePropsO componentProps touchRippleProps) buttonBaseProps
                       => BottomNavigationActionProps o -> Array ReactElement -> ReactElement
bottomNavigationAction = unsafeCreateElement bottomNavigationActionImpl
