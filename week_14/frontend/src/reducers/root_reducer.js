import { combineReducers } from 'redux';
import errors_reducer from './errors_reducer';
import session from './session_reducer';

const RootReducer = combineReducers({
   session,
   errors: errors_reducer
});

export default RootReducer;