module MaterialUI.Icons.Folder where

import React (ReactElement, ReactClass, unsafeCreateElement)


foreign import folderIconImpl :: forall props. ReactClass props


folderIcon :: ReactElement
folderIcon = unsafeCreateElement folderIconImpl {} []
