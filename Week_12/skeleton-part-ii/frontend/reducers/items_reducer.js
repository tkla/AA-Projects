import { RECEIVE_POKEMON } from './../actions/pokemon_actions';


const itemReducer = (state = {}, action) => {
  Object.freeze(state);

  switch (action.type){
  case RECEIVE_POKEMON: 
    return action.payload.items;
  default:
    return state;
  }
}
  
export default itemReducer;