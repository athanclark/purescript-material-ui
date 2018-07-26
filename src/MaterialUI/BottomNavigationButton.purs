module MaterialUI.BottomNavigationButton
  ( bottomNavigationButton, BottomNavigationButtonProps, BottomNavigationButtonPropsO, BottomNavigationButtonClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import React (ReactClass, createElement, ReactElement)
import Data.Record.Class (class Subrow)
import Unsafe.Coerce (unsafeCoerce)


foreign import bottomNavigationButtonImpl :: forall props. ReactClass props


type BottomNavigationButtonProps o =
  {
  | o }


type BottomNavigationButtonPropsO =
  ( icon :: ReactElement
  , label :: ReactElement
  , showLabel :: Boolean
  , classes :: Classes
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

createClasses :: forall classes
               . Subrow classes BottomNavigationButtonClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


bottomNavigationButton :: forall o
         . Subrow o BottomNavigationButtonPropsO
        => BottomNavigationButtonProps o -> Array ReactElement -> ReactElement
bottomNavigationButton = createElement bottomNavigationButtonImpl
