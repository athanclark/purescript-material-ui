module MaterialUI.BottomNavigation
  ( bottomNavigation', BottomNavigationProps, BottomNavigationPropsO, BottomNavigationClasses
  ) where

import MaterialUI.Types (Styles)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)


foreign import bottomNavigationImpl :: forall props. ReactClass props


type BottomNavigationProps o =
  {
  | o }


type BottomNavigationPropsO eff classes =
  ( children :: ReactElement
  , classes :: classes
  , onChange :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff)
                  Event Unit
  , showLabels :: Boolean
  , value :: String
  )


type BottomNavigationClasses =
  ( root :: Styles
  )


bottomNavigation' :: forall o classes componentProps
         . Subrow o (BottomNavigationPropsO componentProps { | classes })
        => Subrow classes BottomNavigationClasses
        => BottomNavigationProps o -> Array ReactElement -> ReactElement
bottomNavigation' = createElement bottomNavigationImpl
