module Main where

import App.MaterialUi (muiThemeProvider, raisedButton, dialog)
import CSS (margin, marginBottom, px)
import Control.Monad.Eff (Eff)
import Data.Monoid (mempty)
import Prelude hiding (div)
import Pux (CoreEffects, EffModel, start, App)
import Pux.DOM.Events (DOMEvent, onClick)
import Pux.DOM.HTML (HTML)
import Pux.DOM.HTML.Attributes (style)
import Pux.Renderer.React (renderToDOM)
import Text.Smolder.HTML (div, span)
import Text.Smolder.Markup (text, (#!), (!), on)


data Event = Increment | Decrement | ToggleDialog

data State = State {
    count :: Int,
    isDialogOpen :: Boolean
  }

-- | Return a new state (and effects) from each event
foldp :: ∀ fx. Event -> State -> EffModel State Event fx
foldp Increment (State state) = { state: State state {count = state.count + 1}, effects: [] }
foldp Decrement (State state) = { state: State state {count = state.count - 1}, effects: [] }
foldp ToggleDialog (State state) = { state: State state {isDialogOpen = not state.isDialogOpen}, effects: [] }

-- | Return markup from the state
view :: State -> HTML Event
view (State state) =
  div do
    muiThemeProvider do
      div ! style (marginBottom (10.0 # px)) $ do
        raisedButton {label: "Increment"} #! onClick (const Increment) $ mempty
        span !
          style (margin (0.0 # px) (10.0 # px) (0.0 # px) (10.0 # px))
          $ text (show state.count)
        raisedButton {label: "Decrement"} #! onClick (const Decrement) $ mempty
      raisedButton {label: "Show Dialog"} #! onClick (const ToggleDialog) $ mempty
      dialog {
          actions: [], -- ??? [(raisedButton {label: "Close"} #! onClick (const ToggleDialog) $ mempty)],
          open: state.isDialogOpen,
          title: "Dialog Title"
        }
        #! (on "onRequestClose" (const ToggleDialog))
        $ text "Dialog Text"



type WebApp = App (DOMEvent -> Event) Event State

-- | Start and render the app
main :: ∀ fx. String -> State -> Eff (CoreEffects fx) WebApp
main url state = do
  app <- start
    { initialState: State {count: 0, isDialogOpen: false}
    , view
    , foldp
    , inputs: []
    }

  renderToDOM "#app" app.markup app.input

  pure app

