import React from 'react';
import { Link } from 'react-router-dom';

import ReportIndexItem from './report_index_item';

/*
Export a `ReportIndex` presentational component that renders a list (`ul`) of
`ReportIndexItems`. This component should receive `reports` from the store as a
prop via its container and fetch them once it has successfully mounted to the
DOM. Below the `ul`, add a link to the new report page with text 'New Report'.
*/

export default class ReportIndex extends React.Component {
   
   componentDidMount(){
      this.props.requestReports();
   }

   render (){
      return(
         <div>
            <ul>
               { this.props.reports.map( report => (
                     <ReportIndexItem report={report} deleteReport={this.props.deleteReport}/>
                  ))
               }
               
            </ul>

            <Link to="/reports/new">New Report</Link>
         </div>
      )
   }
}