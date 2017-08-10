module MaterialUI.Menu
  ( menu', MenuProps, MenuPropsO, MenuClasses
  ) where

import MaterialUI.Types (Styles)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)
import DOM.Node.Types (Element)


foreign import menuImpl :: forall props. ReactClass props


type MenuProps o =
  {
  | o }


type MenuPropsO eff menuListProps classes =
  ( "MenuListProps" :: menuListProps
  , anchorEl :: Element
  , children :: Array ReactElement
  , classes :: classes
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


menu' :: forall o eff menuListProps classes
         . Subrow o (MenuPropsO eff menuListProps { | classes })
        => Subrow classes MenuClasses
        => MenuProps o -> Array ReactElement -> ReactElement
menu' = createElement menuImpl
