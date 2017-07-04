module App.MaterialUi where

import React (ReactClass)
import Pux.Renderer.React (reactClassWithProps, reactClass)

foreign import raisedButtonClass :: ∀ props. ReactClass props
raisedButton = reactClassWithProps raisedButtonClass "RaisedButton"

foreign import muiThemeProviderClass :: ∀ props. ReactClass props
muiThemeProvider  = reactClass muiThemeProviderClass "MuiThemeProviderClass"

foreign import dialogClass :: ∀ props. ReactClass props
dialog  = reactClassWithProps dialogClass "Dialog"
