module MaterialUI.BottomNavigationButton
  ( bottomNavigationButton', BottomNavigationButtonProps, BottomNavigationButtonPropsO, BottomNavigationButtonClasses
  ) where

import MaterialUI.Types (Styles)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)


foreign import bottomNavigationButtonImpl :: forall props. ReactClass props


type BottomNavigationButtonProps o =
  {
  | o }


type BottomNavigationButtonPropsO classes =
  ( icon :: ReactElement
  , label :: ReactElement
  , showLabel :: Boolean
  , classes :: classes
  )


type BottomNavigationButtonClasses =
  ( root :: Styles
  , selected :: Styles
  , selectedIconOnly :: Styles
  , label :: Styles
  , selectedLabel :: Styles
  , hiddenLabel :: Styles
  , icon :: Styles
  )


bottomNavigationButton' :: forall o classes
         . Subrow o (BottomNavigationButtonPropsO { | classes })
        => Subrow classes BottomNavigationButtonClasses
        => BottomNavigationButtonProps o -> Array ReactElement -> ReactElement
bottomNavigationButton' = createElement bottomNavigationButtonImpl
