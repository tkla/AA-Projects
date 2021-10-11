import { connect } from 'react-redux';

import ReportIndex from './report_index';
import {
  requestReports,
  deleteReport
} from '../../actions/report_actions';

/*
Export a container component for the `ReportIndex` that maps an array of all
reports from the store as a `reports` prop. Additionally, it should map in
functions that will dispatch `requestReports` and `deleteReport` to the store as
props of the same name.
*/

const mapState = (state) => ({
  reports: Object.values(state.reports)
})

const mapDispatch = (dispatch) => ({
  requestReports: () => dispatch(requestReports),
  deleteReport: (reportId) => dispatch(deleteReport(reportId)),
})

export default connect(mapState, mapDispatch)(ReportIndex)