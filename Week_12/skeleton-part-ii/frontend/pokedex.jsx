import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import {requestSinglePokemon} from './actions/pokemon_actions'

document.addEventListener("DOMContentLoaded", () => {
  const rootEl = document.getElementById("root");
  const store = configureStore();
  store.getState()
  store.dispatch(requestSinglePokemon(2))
  store.getState()
  ReactDOM.render(<Root store={store} />, rootEl)
})