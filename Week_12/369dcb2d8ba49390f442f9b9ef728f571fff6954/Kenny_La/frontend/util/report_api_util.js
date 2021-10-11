/*
Export the following API Util functions with the specified parameters:

1. `fetchReports`
2. `fetchReport(reportId)`
3. `createReport(report)`
4. `updateReport(report)`
5. `deleteReport(reportId)`
*/


export const fetchReports = () => (
   $.ajax({
      method: 'GET',
      url: '/api/reports'
   })
)

export const fetchReport = (reportId) => (
   $.ajax({
      method: 'GET',
      url: `/api/reports/${reportId}`
   })
)

export const createReport = (report) => (
   $.ajax({
      method: 'POST',
      url: `/api/reports/`,
      data: {report: report}
   })
)

export const updateReport = (report) => (
   $.ajax({
      method: 'PATCH',
      url: `/api/reports/${report.id}`,
      data: {report}
   })
)

export const deleteReport = (reportId) => (
   $.ajax({
      method: 'DELETE',
      url: `/api/reports/${reportId}`,
   })
)