module MaterialUI.Typography
  ( typography, TypographyProps, TypographyPropsO, TypographyClasses
  , Alignment, left, right, center, justify, inheritAlign
  , Color, primary, secondary, textSecondary, error, default, inheritColor
  , Variant, button, caption, body1, body2, subheading, title, headline, display1, display2, display3, display4
                                                                                            , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)
import Unsafe.Coerce (unsafeCoerce)


foreign import typographyImpl :: forall props. ReactClass props


type TypographyProps o =
  {
  | o }


newtype Alignment = Alignment String

inheritAlign :: Alignment
inheritAlign = Alignment "inherit"

left :: Alignment
left = Alignment "left"

right :: Alignment
right = Alignment "right"

center :: Alignment
center = Alignment "center"

justify :: Alignment
justify = Alignment "justify"


newtype Color = Color String

inheritColor :: Color
inheritColor = Color "inherit"

primary :: Color
primary = Color "primary"

secondary :: Color
secondary = Color "secondary"

textSecondary :: Color
textSecondary = Color "textSecondary"

error :: Color
error = Color "error"

default :: Color
default = Color "default"

newtype Variant = Variant String

button :: Variant
button = Variant "button"

caption :: Variant
caption = Variant "caption"

body1 :: Variant
body1 = Variant "body1"

body2 :: Variant
body2 = Variant "body2"

subheading :: Variant
subheading = Variant "subheading"

title :: Variant
title = Variant "title"

headline :: Variant
headline = Variant "headline"

display1 :: Variant
display1 = Variant "display1"

display2 :: Variant
display2 = Variant "display2"

display3 :: Variant
display3 = Variant "display3"

display4 :: Variant
display4 = Variant "display4"


type TypographyPropsO componentProps =
  ( align :: Alignment
  , children :: Array ReactElement
  , classes :: Classes
  , style :: Styles
  , color :: Color
  , component :: ReactClass componentProps
  , gutterBottom :: Boolean
  -- , headlineMapping :: FIXME
  , noWrap :: Boolean
  , paragraph :: Boolean
  , variant :: Variant
  )

createClasses :: forall o. Subrow o TypographyClasses => { | o } -> Classes
createClasses = unsafeCoerce


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


typography :: forall o componentProps
         . Subrow o (TypographyPropsO componentProps)
        => TypographyProps o -> Array ReactElement -> ReactElement
typography = createElement typographyImpl
