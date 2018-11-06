module MaterialUI.CardHeader
  ( cardHeader, CardHeaderProps, CardHeaderPropsO, CardHeaderClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import React (ReactClass, unsafeCreateElement, ReactElement)
import Row.Class (class SubRow)
import Unsafe.Coerce (unsafeCoerce)


foreign import cardHeaderImpl :: forall props. ReactClass props


type CardHeaderProps o =
  {
  | o }


type CardHeaderPropsO componentProps subheaderTypographyProps titleTypographyProps =
  ( action :: ReactElement
  , avatar :: ReactElement
  , classes :: Classes
  , component :: ReactClass componentProps -- ^ Default: React.DOM.div'
  , disableTypography :: Boolean
  , subheader :: ReactElement
  , subheaderTypographyProps :: subheaderTypographyProps
  , title :: ReactElement
  , titleTypographyProps :: titleTypographyProps
  )

type CardHeaderClasses =
  ( root :: Styles
  , avatar :: Styles
  , action :: Styles
  , content :: Styles
  , title :: Styles
  , subheader :: Styles
  )

createClasses :: forall classes
               . SubRow classes CardHeaderClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


cardHeader :: forall o componentProps subheaderTypographyProps titleTypographyProps
         . SubRow o (CardHeaderPropsO componentProps subheaderTypographyProps titleTypographyProps)
        => CardHeaderProps o -> Array ReactElement -> ReactElement
cardHeader = unsafeCreateElement cardHeaderImpl
