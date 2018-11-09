module MaterialUI.Paper
  ( paper, PaperProps, PaperPropsO, PaperClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import React (ReactClass, unsafeCreateElement, ReactElement)
import Row.Class (class SubRow)
import Unsafe.Coerce (unsafeCoerce)


foreign import paperImpl :: forall props. ReactClass props


type PaperProps o =
  {
  | o }


type PaperPropsO componentProps =
  ( classes :: Classes
  , component :: ReactClass componentProps -- ^ Default: `React.DOM.div'`
  , elevation :: Int -- ^ Default: `2`
  , square :: Boolean -- ^ Default: `false`
  )

type PaperClasses =
  ( root :: Styles
  , rounded :: Styles
  , elevation0 :: Styles
  , elevation1 :: Styles
  , elevation2 :: Styles
  , elevation3 :: Styles
  , elevation4 :: Styles
  , elevation5 :: Styles
  , elevation6 :: Styles
  , elevation7 :: Styles
  , elevation8 :: Styles
  , elevation9 :: Styles
  , elevation10 :: Styles
  , elevation11 :: Styles
  , elevation12 :: Styles
  , elevation13 :: Styles
  , elevation14 :: Styles
  , elevation15 :: Styles
  , elevation16 :: Styles
  , elevation17 :: Styles
  , elevation18 :: Styles
  , elevation19 :: Styles
  , elevation20 :: Styles
  , elevation21 :: Styles
  , elevation22 :: Styles
  , elevation23 :: Styles
  , elevation24 :: Styles
  )

createClasses :: forall classes
               . SubRow classes PaperClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


paper :: forall o componentProps
         . SubRow o (PaperPropsO componentProps)
        => PaperProps o -> Array ReactElement -> ReactElement
paper = unsafeCreateElement paperImpl
