module MaterialUI.InputAdornment
  ( inputAdornment, InputAdornmentProps, InputAdornmentPropsO, InputAdornmentClasses
  , createClasses, Position, start, end
  ) where

import MaterialUI.Types (Styles, Classes)
import MaterialUI.ListItem (ListItemPropsO)
import MaterialUI.Input (Value)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)
import DOM.Node.Types (Element)
import Unsafe.Coerce (unsafeCoerce)


foreign import inputAdornmentImpl :: forall props. ReactClass props


type InputAdornmentProps o =
  {
  | o }


newtype Position = Position String

start :: Position
start = Position "start"

end :: Position
end = Position "end"


type InputAdornmentPropsO eff componentProps =
  ( children :: Array ReactElement
  , classes :: Classes
  , component :: ReactClass componentProps
  , disableTypography :: Boolean
  , position :: Position
  )

type InputAdornmentClasses =
  ( root :: Styles
  , positionStart :: Styles
  , positionEnd :: Styles
  )

createClasses :: forall classes
               . Subrow classes InputAdornmentClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


inputAdornment :: forall o eff inputAdornmentListProps
         . Subrow o (InputAdornmentPropsO eff inputAdornmentListProps)
        => InputAdornmentProps o -> ReactElement -> ReactElement
inputAdornment p x = createElement inputAdornmentImpl p [x]
