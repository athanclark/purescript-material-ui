module MaterialUI.BottomNavigation
  ( bottomNavigation, BottomNavigationProps, BottomNavigationPropsO, BottomNavigationClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import Prelude
import React (ReactClass, unsafeCreateElement, ReactElement)
import React.SyntheticEvent (SyntheticEvent)
import Row.Class (class SubRow)
import Effect.Uncurried (EffectFn1)
import Unsafe.Coerce (unsafeCoerce)


foreign import bottomNavigationImpl :: forall props. ReactClass props


type BottomNavigationProps o =
  {
  | o }


type BottomNavigationPropsO eff =
  ( classes :: Classes
  , onChange :: EffectFn1 SyntheticEvent Unit
  , showLabels :: Boolean
  , value :: String
  )


type BottomNavigationClasses =
  ( root :: Styles
  )

createClasses :: forall classes
               . SubRow classes BottomNavigationClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


bottomNavigation :: forall o componentProps
         . SubRow o (BottomNavigationPropsO componentProps)
        => BottomNavigationProps o -> Array ReactElement -> ReactElement
bottomNavigation = unsafeCreateElement bottomNavigationImpl
