module MaterialUI.Button
  ( button, ButtonProps, ButtonPropsO, ButtonClasses
  , Color, primary, secondary, default, inherit, contrast
  , Size, small, medium, large, Variant, flat, raised, fab
  , createClasses, withStyles
  ) where

import MaterialUI.Types (Styles, Classes, class CompileStyles, Theme)

import Prelude
import React (ReactClass, unsafeCreateElement, ReactElement, statelessComponent)
import React.SyntheticEvent (SyntheticEvent)
import Row.Class (class SubRow)
import Data.Function.Uncurried (Fn2, runFn2)
import Effect.Uncurried (EffectFn1)
import Unsafe.Coerce (unsafeCoerce)
import Type.Row (class RowToList, class ListToRow)


foreign import buttonImpl :: forall props. ReactClass props


type ButtonProps o =
  {
  | o }


type ButtonPropsO componentProps =
  ( classes :: Classes
  , style :: Styles
  , color :: Color
  , component :: ReactClass componentProps
  , disableFocusRipple :: Boolean
  , disableRipple :: Boolean
  , disabled :: Boolean
  , href :: String
  , variant :: Variant
  , onClick    :: EffectFn1 SyntheticEvent Unit
  , onTouchTap :: EffectFn1 SyntheticEvent Unit
  , mini :: Boolean
  , fullWidth :: Boolean
  , size :: Size
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

contrast :: Color
contrast = Color "contrast"


newtype Variant = Variant String

flat :: Variant
flat = Variant "flat"

raised :: Variant
raised = Variant "raised"

fab :: Variant
fab = Variant "fab"


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
  , flatPrimary :: Styles
  , flatSecondary :: Styles
  , colorInherit :: Styles
  , raised :: Styles
  , keyboardFocused :: Styles
  , raisedPrimary :: Styles
  , raisedSecondary :: Styles
  , disabled :: Styles
  , fab :: Styles
  , mini :: Styles
  , sizeSmall :: Styles
  , sizeLarge :: Styles
  , fullWidth :: Styles
  )

type ButtonClassesCompiled =
  ( root :: String
  , label :: String
  , flatPrimary :: String
  , flatSecondary :: String
  , colorInherit :: String
  , raised :: String
  , keyboardFocused :: String
  , raisedPrimary :: String
  , raisedSecondary :: String
  , disabled :: String
  , fab :: String
  , mini :: String
  , sizeSmall :: String
  , sizeLarge :: String
  , fullWidth :: String
  )

createClasses :: forall classes
               . SubRow classes ButtonClassesCompiled
              => { | classes } -> Classes
createClasses = unsafeCoerce


button :: forall o componentProps
         . SubRow o (ButtonPropsO componentProps)
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
