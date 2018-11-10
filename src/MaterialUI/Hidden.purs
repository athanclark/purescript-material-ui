module MaterialUI.Hidden
  ( hidden, HiddenProps, HiddenPropsO
  , Implementation, js, css
  , Width, xs, sm, md, lg, xl
  ) where

import React (ReactClass, unsafeCreateElement, ReactElement)
import Row.Class (class SubRow)


foreign import hiddenImpl :: forall props. ReactClass props


type HiddenProps o =
  {
  | o }

newtype Implementation = Implementation String

js :: Implementation
js = Implementation "js"

css :: Implementation
css = Implementation "css"


newtype Width = Width String

xs :: Width
xs = Width "xs"

sm :: Width
sm = Width "sm"

md :: Width
md = Width "md"

lg :: Width
lg = Width "lg"

xl :: Width
xl = Width "xl"


type HiddenPropsO =
  ( implementation :: Implementation
  , initialWidth :: Width
  , xlDown :: Boolean
  , xlUp :: Boolean
  , lgDown :: Boolean
  , lgUp :: Boolean
  , mdDown :: Boolean
  , mdUp :: Boolean
  , smDown :: Boolean
  , smUp :: Boolean
  , xsDown :: Boolean
  , xsUp :: Boolean
  , only :: Array Width
  )


hidden :: forall o
        . SubRow o HiddenPropsO
       => HiddenProps o -> Array ReactElement -> ReactElement
hidden = unsafeCreateElement hiddenImpl
