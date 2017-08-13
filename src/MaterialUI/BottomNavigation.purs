module MaterialUI.BottomNavigation
  ( bottomNavigation, BottomNavigationProps, BottomNavigationPropsO, BottomNavigationClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)
import Unsafe.Coerce (unsafeCoerce)


foreign import bottomNavigationImpl :: forall props. ReactClass props


type BottomNavigationProps o =
  {
  | o }


type BottomNavigationPropsO eff =
  ( children :: Array ReactElement
  , classes :: Classes
  , onChange :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff)
                  Event Unit
  , showLabels :: Boolean
  , value :: String
  )


type BottomNavigationClasses =
  ( root :: Styles
  )

createClasses :: forall classes
               . Subrow classes BottomNavigationClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


bottomNavigation :: forall o componentProps
         . Subrow o (BottomNavigationPropsO componentProps)
        => BottomNavigationProps o -> Array ReactElement -> ReactElement
bottomNavigation = createElement bottomNavigationImpl
