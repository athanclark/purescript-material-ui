module MaterialUI.Types where

import Unsafe.Coerce (unsafeCoerce)
import Type.Row (kind RowList, Nil, Cons)



-- | Represents an untyped JSS object - unsafeCoerce it to your liking.
foreign import data Styles :: Type

createStyles :: forall styles. { | styles } -> Styles
createStyles = unsafeCoerce


-- | Represents a partially typed object that the material-ui component would recognize.
foreign import data Classes :: Type


class CompileStyles (styles :: RowList) (compiledStyles :: RowList) | styles -> compiledStyles

instance compileStylesNil :: CompileStyles Nil Nil

instance compileStylesCons :: CompileStyles xs cs => CompileStyles (Cons k t xs) (Cons k String cs)


type ColorScale =
  { light :: String
  , main :: String
  , dark :: String
  , contrastDefaultColor :: String
  }

type Shade =
  { text ::
    { primary :: String
    , secondary :: String
    , disabled :: String
    , hint :: String
    , icon :: String
    , divider :: String
    , lightDivider :: String
    }
  , input ::
    { bottomLine :: String
    , helperText :: String
    , labelText :: String
    , inputText :: String
    , disabled :: String
    }
  , action ::
    { active :: String
    , disabled :: String
    }
  , background ::
    { default :: String
    , paper :: String
    , appBar :: String
    , contentFrame :: String
    }
  }

type RelativeTypography =
  { fontSize :: String
  , fontWeight :: Int
  , fontFamily :: String
  , letterSpacing :: String
  , lineHeight :: String
  , marginLeft :: String
  , color :: String
  }

type Theme =
  { direction :: String
  , palette ::
    { common ::
      { black :: String
      , white :: String
      , transparent :: String
      , fullBlack :: String
      , darkBlack :: String
      , lightBlack :: String
      , minBlack :: String
      , faintBlack :: String
      , fullWhite :: String
      , darkWhite :: String
      , lightWhite :: String
      }
    , "type" :: String
    , primary :: ColorScale
    , secondary :: ColorScale
    , error :: ColorScale
    , grey :: ColorScale
    , shades ::
      { dark :: Shade
      , light :: Shade
      }
    , text ::
      { primary :: String
      , secondary :: String
      , disabled :: String
      , hint :: String
      , icon :: String
      , divider :: String
      , lightDivider :: String
      }
    , input ::
      { bottomLine :: String
      , helperText :: String
      , labelText :: String
      , inputText :: String
      , disabled :: String
      }
    , action ::
      { active :: String
      , disabled :: String
      }
    , background ::
      { default :: String
      , paper :: String
      , appBar :: String
      , contentFrame :: String
      }
    }
  , typography ::
    { fontFamily :: String
    , fontSize :: Int
    , fontWeightLight :: Int
    , fontWeightRegular :: Int
    , fontWeightMedium :: Int
    , display4 :: RelativeTypography
    , display3 :: RelativeTypography
    , display2 :: RelativeTypography
    , display1 :: RelativeTypography
    , headline :: RelativeTypography
    , title :: RelativeTypography
    , subheading :: RelativeTypography
    , body2 :: RelativeTypography
    , body1 :: RelativeTypography
    , caption :: RelativeTypography
    , button :: RelativeTypography
    }
  , mixins ::
    { toolbar ::
      { minHeight :: Int
      , "@media (min-width:0px) and (orientation: landscape)" ::
        { minHeight :: Int
        }
      , "@media (min-width:600px)" ::
        { minHeight :: Int
        }
      }
    }
  , breakpoints ::
    { keys :: Array String
    , values :: Array Int
    , shadows :: Array String
    , transitions ::
      { easing ::
        { easeInOut :: String
        , easeOut :: String
        , easeIn :: String
        , sharp :: String
        }
      , duration ::
        { shortest :: Int
        , shorter :: Int
        , short :: Int
        , standard :: Int
        , complex :: Int
        , enteringScreen :: Int
        , leavingScreen :: Int
        }
      }
    , spacing ::
      { unit :: Int
      }
    , zIndex ::
      { mobileStepper :: Int
      , menu :: Int
      , appBar :: Int
      , drawerOverlay :: Int
      , navDrawer :: Int
      , dialogOverlay :: Int
      , dialog :: Int
      , layer :: Int
      , popover :: Int
      , snackbar :: Int
      , tooltip :: Int
      }
    }
  , spacing ::
    { unit :: Int
    }
  }
