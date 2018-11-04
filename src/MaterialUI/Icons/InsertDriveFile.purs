module MaterialUI.Icons.InsertDriveFile where

import React (ReactElement, ReactClass, unsafeCreateElement)


foreign import insertDriveFileIconImpl :: forall props. ReactClass props


insertDriveFileIcon :: ReactElement
insertDriveFileIcon = unsafeCreateElement insertDriveFileIconImpl {} []
