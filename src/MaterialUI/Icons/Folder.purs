module MaterialUI.Icons.Folder where

import Prelude (unit)
import React (ReactElement, ReactClass, createElement)


foreign import folderIconImpl :: forall props. ReactClass props


folderIcon :: ReactElement
folderIcon = createElement folderIconImpl unit []
