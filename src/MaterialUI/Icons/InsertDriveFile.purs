module MaterialUI.Icons.InsertDriveFile where

import Prelude (unit)
import React (ReactElement, ReactClass, createElement)


foreign import insertDriveFileIconImpl :: forall props. ReactClass props


insertDriveFileIcon :: ReactElement
insertDriveFileIcon = createElement insertDriveFileIconImpl unit []
