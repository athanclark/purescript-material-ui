module MaterialUI.DialogTitle
  ( dialogTitle', DialogTitleProps, DialogTitlePropsO, DialogTitleClasses
  ) where

import MaterialUI.Types (Styles)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)


foreign import dialogTitleImpl :: forall props. ReactClass props


type DialogTitleProps o =
  {
  | o }


type DialogTitlePropsO classes =
  ( children :: Array ReactElement
  , classes :: classes
  , disableTypography :: Boolean
  )

type DialogTitleClasses =
  ( root :: Styles
  )


dialogTitle' :: forall o classes
         . Subrow o (DialogTitlePropsO { | classes })
        => Subrow classes DialogTitleClasses
        => DialogTitleProps o -> Array ReactElement -> ReactElement
dialogTitle' = createElement dialogTitleImpl
