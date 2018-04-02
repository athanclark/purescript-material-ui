module MaterialUI.Icons.PictureInPicture where

import Prelude (unit)
import React (ReactElement, ReactClass, createElement)


foreign import pictureInPictureIconImpl :: forall props. ReactClass props


pictureInPictureIcon :: ReactElement
pictureInPictureIcon = createElement pictureInPictureIconImpl unit []
