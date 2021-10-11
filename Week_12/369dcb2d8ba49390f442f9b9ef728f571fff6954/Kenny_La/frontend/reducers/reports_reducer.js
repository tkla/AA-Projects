import {
  RECEIVE_REPORTS,
  RECEIVE_REPORT,
  REMOVE_REPORT,
} from '../actions/report_actions';
import merge from 'lodash/merge'

/*
Export a `ReportsReducer` that takes in the old state and appropriately handles
all report actions.
*/

const ReportsReducer = (state = {}, action) => {
  Object.freeze(state);
  let newState = Object.assign({}, state);
  switch (action.type) {
    case RECEIVE_REPORTS:
      return action.reports;
    case RECEIVE_REPORT: 
      newState[action.report.id] = action.report;
      return newState;
    case REMOVE_REPORT: 
      delete newState[action.reportId];
      return newState;
    default:
      return state
  }
}

export default ReportsReducer;