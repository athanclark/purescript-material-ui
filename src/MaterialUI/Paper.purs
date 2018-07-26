module MaterialUI.Paper
  ( paper, PaperProps, PaperPropsO, PaperClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import React (ReactClass, createElement, ReactElement)
import Data.Record.Class (class Subrow)
import Unsafe.Coerce (unsafeCoerce)


foreign import paperImpl :: forall props. ReactClass props


type PaperProps o =
  {
  | o }


type PaperPropsO componentProps =
  ( component :: ReactClass componentProps
  , classes :: Classes
  , elevation :: Int
  , square :: Boolean
  , style :: Styles
  )

type PaperClasses =
  ( root :: Styles
  , rounded :: Styles
  , shadow0 :: Styles
  , shadow1 :: Styles
  , shadow2 :: Styles
  , shadow3 :: Styles
  , shadow4 :: Styles
  , shadow5 :: Styles
  , shadow6 :: Styles
  , shadow7 :: Styles
  , shadow8 :: Styles
  , shadow9 :: Styles
  , shadow10 :: Styles
  , shadow11 :: Styles
  , shadow12 :: Styles
  , shadow13 :: Styles
  , shadow14 :: Styles
  , shadow15 :: Styles
  , shadow16 :: Styles
  , shadow17 :: Styles
  , shadow18 :: Styles
  , shadow19 :: Styles
  , shadow20 :: Styles
  , shadow21 :: Styles
  , shadow22 :: Styles
  , shadow23 :: Styles
  , shadow24 :: Styles
  )

createClasses :: forall classes
               . Subrow classes PaperClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


paper :: forall o componentProps
         . Subrow o (PaperPropsO componentProps)
        => PaperProps o -> Array ReactElement -> ReactElement
paper = createElement paperImpl
