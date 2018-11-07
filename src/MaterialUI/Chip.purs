module MaterialUI.Chip
  ( chip, ChipProps, ChipPropsO, ChipClasses
  , Color, default, primary, secondary
  , Variant, defaultVariant, outlined
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


foreign import chipImpl :: forall props. ReactClass props


type ChipProps o =
  {
  | o }


type ChipPropsO componentProps =
  ( avatar :: ReactElement
  , classes :: Classes
  , clickable :: Boolean
  , color :: Color
  , component :: ReactClass componentProps -- ^ Default: React.DOM.div'
  , deleteIcon :: ReactElement
  , icon :: ReactElement
  , label :: ReactElement
  , onDelete :: EffectFn1 SyntheticEvent Unit
  , onClick :: EffectFn1 SyntheticEvent Unit
  , variant :: Variant
  )

newtype Color = Color String

default :: Color
default = Color "default"

primary :: Color
primary = Color "primary"

secondary :: Color
secondary = Color "secondary"

newtype Variant = Variant String

defaultVariant :: Variant
defaultVariant = Variant "default"

outlined :: Variant
outlined = Variant "outlined"

type ChipClasses =
  ( root :: Styles
  , colorPrimary :: Styles
  , colorSecondary :: Styles
  , clickable :: Styles
  , clickableColorPrimary :: Styles
  , clickableColorSecondary :: Styles
  , deletable :: Styles
  , deletableColorPrimary :: Styles
  , deletableColorSecondary :: Styles
  , outlined :: Styles
  , outlinedColorPrimary :: Styles
  , outlinedColorSecondary :: Styles
  , avatar :: Styles
  , avatarColorPrimary :: Styles
  , avatarColorSecondary :: Styles
  , avatarChildren :: Styles
  , icon :: Styles
  , iconColorPrimary :: Styles
  , iconColorSecondary :: Styles
  , label :: Styles
  , deleteIcon :: Styles
  , deleteIconColorPrimary :: Styles
  , deleteIconColorSecondary :: Styles
  , deleteIconOutlinedColorPrimary :: Styles
  , deleteIconOutlinedColorSecondary :: Styles
  )

type ChipClassesCompiled =
  ( root :: String
  , colorPrimary :: String
  , colorSecondary :: String
  , clickable :: String
  , clickableColorPrimary :: String
  , clickableColorSecondary :: String
  , deletable :: String
  , deletableColorPrimary :: String
  , deletableColorSecondary :: String
  , outlined :: String
  , outlinedColorPrimary :: String
  , outlinedColorSecondary :: String
  , avatar :: String
  , avatarColorPrimary :: String
  , avatarColorSecondary :: String
  , avatarChildren :: String
  , icon :: String
  , iconColorPrimary :: String
  , iconColorSecondary :: String
  , label :: String
  , deleteIcon :: String
  , deleteIconColorPrimary :: String
  , deleteIconColorSecondary :: String
  , deleteIconOutlinedColorPrimary :: String
  , deleteIconOutlinedColorSecondary :: String
  )

createClasses :: forall classes
               . SubRow classes ChipClassesCompiled
              => { | classes } -> Classes
createClasses = unsafeCoerce


chip :: forall o componentProps
      . SubRow o (ChipPropsO componentProps)
     => ChipProps o -> ReactElement
chip p = unsafeCreateElement chipImpl p []



foreign import withStylesImpl :: forall styles compiledStyles a
                               . Fn2 (Theme -> { | styles }) (ReactClass {classes :: { | compiledStyles }}) (ReactClass a)

withStyles :: forall styles stylesList compiledStyles compiledStylesList
            . SubRow styles ChipClasses
            => RowToList styles stylesList
            => CompileStyles stylesList compiledStylesList
            => ListToRow compiledStylesList compiledStyles
            => (Theme -> { | styles }) -> ({classes :: { | compiledStyles }} -> ReactElement) -> ReactElement
withStyles stylesF createElem = unsafeCreateElement (runFn2 withStylesImpl stylesF (statelessComponent createElem)) {} []
