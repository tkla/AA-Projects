import React from 'react';
import { Link } from 'react-router-dom';

import {
  formatDateTime
} from '../../util/date_util';

/*
Write a `ReportShow` presentational component that renders a report's
information (understanding, improvement, and date/time created/updated). This
component should receive the report from the store as props via its container
and fetch it once it has successfully mounted to the DOM. Only display the
`updatedAt` date/time if it is different than the `createdAt` date/time.
Additionally, include a link back to the `ReportIndex`.

Display the date and time of the `createdAt`/`updatedAt` properties like this:
`formatDateTime(this.props.report.createdAt)`
`formatDateTime(this.props.report.updatedAt)`
*/

export default class ReportShow extends React.Component {

  componentDidMount(){
    this.props.requestReport(this.props.report.id);
  }

  render(){
    let report = this.props.report;
    let createdAt = formatDateTime(report.createdAt)
    let updatedAt = formatDateTime(report.updatedAt)
    let time = <p>{createdAt}</p>
    if (createdAt != updatedAt){
      time = <p>{updatedAt}</p>
    }
    return(
      <div>
        <Link to='/'>Index</Link>

        <span>{report.understanding}</span>
        <span>{report.improvement}</span>
        {time}
      </div>
    )
  }
}