module MaterialUI.Types where

import Unsafe.Coerce (unsafeCoerce)



-- | Represents an untyped JSS object - unsafeCoerce it to your liking.
foreign import data Styles :: Type

createStyles :: forall styles. { | styles } -> Styles
createStyles = unsafeCoerce


-- | Represents a partially typed object that the material-ui component would recognize.
foreign import data Classes :: Type
