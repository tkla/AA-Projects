import { connect } from 'react-redux';
import ReportShow from './report_show';
import { requestReport } from '../../actions/report_actions';

/*
Export a container component for the `ReportShow` that maps in the appropriate
report from the store as a `report` prop. Additionally, it should map in a
function that will dispatch `requestReport` to the store as a prop of the same
name.
*/


const mapState = (state, ownProps) => ({
   report: state.reports[ownProps.match.params.reportId]
})

const mapDispatch = (dispatch) => ({
   requestReport: (reportId) => dispatch(requestReport(reportId))
})

export default connect(mapState, mapDispatch)(ReportShow);