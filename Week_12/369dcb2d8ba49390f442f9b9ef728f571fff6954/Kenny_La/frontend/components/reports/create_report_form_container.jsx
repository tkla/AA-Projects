import { connect } from 'react-redux';
import { createReport } from '../../actions/report_actions';
import ReportForm from './report_form';

/*
Export a container component for the `ReportForm` that will be used to create a
new report. Map in a report object with empty values for each field as a
`report` prop along with a `formType` prop set to the string 'Add Report'.
Additionally, map in a function that will dispatch the appropriate action to the
store on form submission as an `action` prop.
*/

const mapState = (state) => ({
   report: {
      understanding: '',
      improvement: '',
   },
   formType: 'Add Report',
});

const mapDispatch = (dispatch) => ({
   action: (report) => dispatch(createReport(report))
})

export default connect(mapState, mapDispatch)(ReportForm)

