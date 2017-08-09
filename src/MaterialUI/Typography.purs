module MaterialUI.Typography
  ( typography', TypographyProps, TypographyPropsO, TypographyClasses
  , Alignment, left, right, center, justify
  , Color, secondary, accent, default'
  , Type', button, caption, body1, body2, subheading, title, headline, display1, display2, display3, display4
  ) where

import MaterialUI.Types (Styles)
import MaterialUI.Overloaded (class InheritTerm, inherit)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)


foreign import typographyImpl :: forall props. ReactClass props


type TypographyProps o =
  {
  | o }


newtype Alignment = Alignment String

instance inheritTermAlignment :: InheritTerm Alignment where
  inherit = Alignment "inherit"

left :: Alignment
left = Alignment "left"

right :: Alignment
right = Alignment "right"

center :: Alignment
center = Alignment "center"

justify :: Alignment
justify = Alignment "justify"


newtype Color = Color String

instance inheritTermColor :: InheritTerm Color where
  inherit = Color "inherit"

secondary :: Color
secondary = Color "secondary"

accent :: Color
accent = Color "accent"

default' :: Color
default' = Color "default"

newtype Type' = Type' String

button :: Type'
button = Type' "button"

caption :: Type'
caption = Type' "caption"

body1 :: Type'
body1 = Type' "body1"

body2 :: Type'
body2 = Type' "body2"

subheading :: Type'
subheading = Type' "subheading"

title :: Type'
title = Type' "title"

headline :: Type'
headline = Type' "headline"

display1 :: Type'
display1 = Type' "display1"

display2 :: Type'
display2 = Type' "display2"

display3 :: Type'
display3 = Type' "display3"

display4 :: Type'
display4 = Type' "display4"


type TypographyPropsO componentProps classes =
  ( align :: Alignment
  , children :: Array ReactElement
  , classes :: classes
  , color :: Color
  , component :: ReactClass componentProps
  , gutterBottom :: Boolean
  -- , headlineMapping :: FIXME
  , noWrap :: Boolean
  , paragraph :: Boolean
  , "type" :: Type'
  )

type TypographyClasses =
  ( root :: Styles
  , display4 :: Styles
  , display3 :: Styles
  , display2 :: Styles
  , display1 :: Styles
  , headline :: Styles
  , title :: Styles
  , subheading :: Styles
  , body1 :: Styles
  , body2 :: Styles
  , caption :: Styles
  , button :: Styles
  , alignLeft :: Styles
  , alignRight :: Styles
  , alignCenter :: Styles
  , alignJustify :: Styles
  , noWrap :: Styles
  , gutterBottom :: Styles
  , paragraph :: Styles
  , colorInherit :: Styles
  , colorSecondary :: Styles
  , colorAccent :: Styles
  )


typography' :: forall o componentProps classes
         . Subrow o (TypographyPropsO componentProps { | classes })
        => Subrow classes TypographyClasses
        => TypographyProps o -> Array ReactElement -> ReactElement
typography' = createElement typographyImpl
