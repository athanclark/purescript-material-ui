module MaterialUI.Button
  ( button, ButtonProps, ButtonPropsO, ButtonClasses
  , Color, primary, secondary, default, inherit
  , Size, small, medium, large
  , Variant, text, flat, outlined, contained, raised, fab, extendedFab
  , createClasses, withStyles
  ) where

import MaterialUI.ButtonBase (ButtonBasePropsO)
import MaterialUI.EventHandlers (ClickableComponent)
import MaterialUI.Types (Styles, Classes, class CompileStyles, Theme)

import React (ReactClass, unsafeCreateElement, ReactElement, statelessComponent)
import Row.Class (class SubRow)
import Data.Function.Uncurried (Fn2, runFn2)
import Unsafe.Coerce (unsafeCoerce)
import Type.Row (class RowToList, class ListToRow, class RowListRemove)
import Prim.Row (class Union)


foreign import buttonImpl :: forall props. ReactClass props


type ButtonProps o =
  {
  | o }


type ButtonPropsO =
  ( classes :: Classes
  , color :: Color
  , disabled :: Boolean
  , disableFocusRipple :: Boolean
  , disableRipple :: Boolean
  , fullWidth :: Boolean
  , href :: String
  , mini :: Boolean
  , size :: Size
  , variant :: Variant
  )

newtype Color = Color String

primary :: Color
primary = Color "primary"

secondary :: Color
secondary = Color "secondary"

default :: Color
default = Color "default"

inherit :: Color
inherit = Color "inherit"


newtype Variant = Variant String

text :: Variant
text = Variant "text"

flat :: Variant
flat = Variant "flat"

outlined :: Variant
outlined = Variant "outlined"

contained :: Variant
contained = Variant "contained"

raised :: Variant
raised = Variant "raised"

fab :: Variant
fab = Variant "fab"

extendedFab :: Variant
extendedFab = Variant "extendedFab"


newtype Size = Size String

small :: Size
small = Size "small"

medium :: Size
medium = Size "medium"

large :: Size
large = Size "large"


type ButtonClasses =
  ( root :: Styles
  , label :: Styles
  , text :: Styles
  , textPrimary :: Styles
  , textSecondary :: Styles
  , flat :: Styles
  , flatPrimary :: Styles
  , flatSecondary :: Styles
  , outlined :: Styles
  , outlinedPrimary :: Styles
  , outlinedSecondary :: Styles
  , contained :: Styles
  , containedPrimary :: Styles
  , containedSecondary :: Styles
  , raised :: Styles
  , raisedPrimary :: Styles
  , raisedSecondary :: Styles
  , fab :: Styles
  , extendedFab :: Styles
  , focusVisible :: Styles
  , disabled :: Styles
  , colorInherit :: Styles
  , mini :: Styles
  , sizeSmall :: Styles
  , sizeLarge :: Styles
  , fullWidth :: Styles
  )

type ButtonClassesCompiled =
  ( root :: String
  , label :: String
  , text :: String
  , textPrimary :: String
  , textSecondary :: String
  , flat :: String
  , flatPrimary :: String
  , flatSecondary :: String
  , outlined :: String
  , outlinedPrimary :: String
  , outlinedSecondary :: String
  , contained :: String
  , containedPrimary :: String
  , containedSecondary :: String
  , raised :: String
  , raisedPrimary :: String
  , raisedSecondary :: String
  , fab :: String
  , extendedFab :: String
  , focusVisible :: String
  , disabled :: String
  , colorInherit :: String
  , mini :: String
  , sizeSmall :: String
  , sizeLarge :: String
  , fullWidth :: String
  )

createClasses :: forall classes
               . SubRow classes ButtonClassesCompiled
              => { | classes } -> Classes
createClasses = unsafeCoerce


button :: forall o all both componentProps touchRippleProps buttonBaseList
           buttonBaseList' buttonBaseProps
         . SubRow o all
        => RowToList (ButtonBasePropsO componentProps touchRippleProps) buttonBaseList
        => RowListRemove "classes" buttonBaseList buttonBaseList'
        => ListToRow buttonBaseList' buttonBaseProps
        => Union ClickableComponent buttonBaseProps both
        => Union ButtonPropsO both all
        => ButtonProps o -> Array ReactElement -> ReactElement
button = unsafeCreateElement buttonImpl


foreign import withStylesImpl :: forall styles compiledStyles a
                               . Fn2 (Theme -> { | styles }) (ReactClass {classes :: { | compiledStyles }}) (ReactClass a)

withStyles :: forall styles stylesList compiledStyles compiledStylesList
            . SubRow styles ButtonClasses
            => RowToList styles stylesList
            => CompileStyles stylesList compiledStylesList
            => ListToRow compiledStylesList compiledStyles
            => (Theme -> { | styles }) -> ({classes :: { | compiledStyles }} -> ReactElement) -> ReactElement
withStyles stylesF createElem = unsafeCreateElement (runFn2 withStylesImpl stylesF (statelessComponent createElem)) {} []
