module MaterialUI.CircularProgress
  ( circularProgress', CircularProgressProps, CircularProgressPropsO, CircularProgressClasses
  , Mode, determinate, indeterminate, Color, primary, accent
  ) where

import MaterialUI.Types (Styles)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)


foreign import circularProgressImpl :: forall props. ReactClass props


type CircularProgressProps o =
  {
  | o }


newtype Mode = Mode String

determinate :: Mode
determinate = Mode "determinate"

indeterminate :: Mode
indeterminate = Mode "indeterminate"

newtype Color = Color String

primary :: Color
primary = Color "primary"

accent :: Color
accent = Color "accent"


type CircularProgressPropsO classes =
  ( color :: Color
  , size :: Int
  , max :: Int
  , min :: Int
  , mode :: Mode
  , value :: Int
  , classes :: classes
  )


type CircularProgressClasses =
  ( root :: Styles
  , primaryColor :: Styles
  , accentColor :: Styles
  , svg :: Styles
  , indeterminateSvg :: Styles
  , circle :: Styles
  , indeterminateCircle :: Styles
  , determinateCircle :: Styles
  )


circularProgress' :: forall o classes
                   . Subrow o (CircularProgressPropsO { | classes})
                  => Subrow classes CircularProgressClasses
                  => CircularProgressProps o -> Array ReactElement -> ReactElement
circularProgress' = createElement circularProgressImpl
