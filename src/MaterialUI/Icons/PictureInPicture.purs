module MaterialUI.Icons.PictureInPicture where

import React (ReactElement, ReactClass, unsafeCreateElement)


foreign import pictureInPictureIconImpl :: forall props. ReactClass props


pictureInPictureIcon :: ReactElement
pictureInPictureIcon = unsafeCreateElement pictureInPictureIconImpl {} []
