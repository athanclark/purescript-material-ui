module MaterialUI.Types where


-- | Represents an untyped JSS object - unsafeCoerce it to your liking.
foreign import data Styles :: Type

-- | Represents a partially typed object that the material-ui component would recognize.
foreign import data Classes :: Type
