module MaterialUI.SvgIcon
  ( svgIcon, SvgIconProps, SvgIconPropsO, SvgIconClasses
  , createClasses
  , action, disabled, error, inherit, primary, secondary, Color
  ) where

import MaterialUI.Types (Styles, Classes)

import React (ReactClass, unsafeCreateElement, ReactElement)
import Row.Class (class SubRow)
import Unsafe.Coerce (unsafeCoerce)


foreign import svgIconImpl :: forall props. ReactClass props


type SvgIconProps o =
  {
  | o }


newtype Color = Color String

action :: Color
action = Color "action"

disabled :: Color
disabled = Color "disabled"

error :: Color
error = Color "error"

inherit :: Color
inherit = Color "inherit"

primary :: Color
primary = Color "primary"

secondary :: Color
secondary = Color "secondary"


type SvgIconPropsO eff svgIconListProps =
  ( classes :: Classes
  , color :: Color
  , nativeColor :: String
  , titleAccess :: String
  , viewBox :: String
  )

type SvgIconClasses =
  ( root :: Styles
  , colorPrimary :: Styles
  , colorSecondary :: Styles
  , colorAction :: Styles
  , colorDisabled :: Styles
  , colorError :: Styles
  )

createClasses :: forall classes
               . SubRow classes SvgIconClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


svgIcon :: forall o eff svgIconListProps
         . SubRow o (SvgIconPropsO eff svgIconListProps)
        => SvgIconProps o -> Array ReactElement -> ReactElement
svgIcon = unsafeCreateElement svgIconImpl

