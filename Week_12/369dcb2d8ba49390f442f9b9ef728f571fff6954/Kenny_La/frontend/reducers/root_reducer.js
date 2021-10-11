import ReportsReducer from './reports_reducer';
import { combineReducers } from 'redux';

/*
Export a `RootReducer` that sets up a `reports` slice of state, which delegates
to the `ReportsReducer`.
*/

const RootReducer = combineReducers({
   reports: ReportsReducer
});


export default RootReducer;