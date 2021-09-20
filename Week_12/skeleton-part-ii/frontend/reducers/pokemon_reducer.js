import { RECEIVE_ALL_POKEMON, RECEIVE_POKEMON } from './../actions/pokemon_actions';


const pokemonReducer = (state = {}, action) => {
  Object.freeze(state);

  switch (action.type){
  case RECEIVE_ALL_POKEMON:
    return Object.assign({}, action.pokemon, state);
  case RECEIVE_POKEMON: 
    const nextState = {}; 
    return nextState[action.payload.pokemon.id] = action.payload.pokemon;

  default:
    return state;
  }
}
  
export default pokemonReducer;
