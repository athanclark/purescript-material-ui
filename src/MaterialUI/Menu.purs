module MaterialUI.Menu
  ( menu, MenuProps, MenuPropsO, MenuClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)
import DOM.Node.Types (Element)
import Unsafe.Coerce (unsafeCoerce)


foreign import menuImpl :: forall props. ReactClass props


type MenuProps o =
  {
  | o }


type MenuPropsO eff menuListProps =
  ( "MenuListProps" :: menuListProps
  , anchorEl :: Element
  , children :: Array ReactElement
  , classes :: Classes
  , onEnter :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onEntered :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onEntering :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onExit :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onExited :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onExiting :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onRequestClose :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , open :: Boolean
  , transitionDuration :: Number
  )

type MenuClasses =
  ( root :: Styles
  )

createClasses :: forall classes
               . Subrow classes MenuClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


menu :: forall o eff menuListProps
         . Subrow o (MenuPropsO eff menuListProps)
        => MenuProps o -> Array ReactElement -> ReactElement
menu = createElement menuImpl
