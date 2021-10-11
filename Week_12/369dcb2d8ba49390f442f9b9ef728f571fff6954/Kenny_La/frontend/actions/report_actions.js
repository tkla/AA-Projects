import * as ReportAPIUtil from '../util/report_api_util';

/*
Export the following action constants:

1. `RECEIVE_REPORTS` (corresponding action should have a `reports` payload)
2. `RECEIVE_REPORT` (corresponding action should have a `report` payload)
3. `REMOVE_REPORT` (corresponding action should have a `reportId` payload)

Export the following thunk action creators with the specified parameters:

1. `requestReports`
2. `requestReport(reportId)`
3. `createReport(report)`
4. `updateReport(report)`
5. `deleteReport(reportId)`
*/

export const RECEIVE_REPORTS = 'RECEIVE_REPORTS';
export const RECEIVE_REPORT = 'RECEIVE_REPORT';
export const REMOVE_REPORT = 'REMOVE_REPORT';

const receiveReports = (reports) => ({
   type: RECEIVE_REPORTS,
   reports,
})

const receiveReport = (report) =>({
   type: RECEIVE_REPORT,
   report
})

const receiveRemoveReport = (reportId) => ({
   type: REMOVE_REPORT,
   reportId
})


export const requestReports = () => dispatch => (
   ReportAPIUtil.fetchReports() 
       .then(reports => dispatch(receiveReports(reports)))
)

export const requestReport = (reportId) => (dispatch) => {
   return ReportAPIUtil.fetchReport(reportId)
      .then( report => dispatch(receiveReport(report)))
}

export const createReport = (report) => (dispatch) => (
   ReportAPIUtil.createReport(report)
      .then( (report) => dispatch(receiveReport(report)))
)

export const updateReport = (report) => (dispatch) => (
   ReportAPIUtil.updateReport(report)
      .then( (report) => dispatch(receiveReport(report)))
)

export const deleteReport = (reportId) => (dispatch) => (
   ReportAPIUtil.deleteReport(reportId)
      .then( () => dispatch(receiveRemoveReport(reportId)))
)