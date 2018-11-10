module MaterialUI.InputAdornment
  ( inputAdornment, InputAdornmentProps, InputAdornmentPropsO, InputAdornmentClasses
  , Variant, standard, outlined, filled
  , Position, start, end
  ) where

import MaterialUI.Types (Styles, Classes)

import React (ReactClass, unsafeCreateElement, ReactElement)
import Row.Class (class SubRow)


foreign import inputAdornmentImpl :: forall props. ReactClass props


type InputAdornmentProps o =
  {
  | o }

newtype Variant = Variant String

standard :: Variant
standard = Variant "standard"
outlined :: Variant
outlined = Variant "outlined"
filled :: Variant
filled = Variant "filled"

newtype Position = Position String

start :: Position
start = Position "start"

end :: Position
end = Position "end"

type InputAdornmentPropsO componentProps =
  ( classes :: Classes
  , component :: ReactClass componentProps -- ^ Default: `div`
  , disableTypography :: Boolean -- ^ Default: `false`
  , position :: Position
  , variant :: Variant
  )

type InputAdornmentClasses =
  ( root :: Styles
  , filled :: Styles
  , positionStart :: Styles
  , positionEnd :: Styles
  )


inputAdornment :: forall componentProps o
             . SubRow o (InputAdornmentPropsO componentProps)
            => InputAdornmentProps o -> Array ReactElement -> ReactElement
inputAdornment = unsafeCreateElement inputAdornmentImpl


