# React-Redux Assessment

**You will have 2 hours for this assessment.**

Read this entire README before running specs for the first time - it
contains important information about running tests with jest.

You will be creating Progress Tracker Lite. This application will allow
for the creation, display, updating, and deletion of reports, similar to
the nightly reports you have come to know and love.

**NOTE**
A `date_util` set of functions has been made available to format the
date throughout the application. The `formatDate`, `formatTime`, and
`formatDateTime` functions have been imported in the components in which
they should be used to properly display the timestamps of reports. These
functions reside in the `frontend/util' folder.`You do not need to alter
them.

**ALSO**
The JSON for reports is configured to be in `camelCase` on the frontend
and `snake_case` on the backend. This means that while the columns are
called `created_at` and `updated_at` in the database and in Rails, these
fields should be accessed as `createdAt` and `updatedAt` in your frontend.

## Design Documents

* [Database Schema][db_schema]
* [View Wireframes][views]

[db_schema]: ./docs/database_design.md
[views]: ./docs/views.md

## Instructions

## Setup

If any of the setup fails, call over a TA to help.

1. `npm install`
2. `bundle install`
3. `bundle exec rails db:setup`
  - NB: you will need to have postgres running!

To test your code live in the browser, run:
1. `rails server`
2. `npm run build:watch` (this runs `webpack -w`. check your `package.json` for other scripts)
3. Navigate to localhost:3000.  

You will begin with the backend entirely set up. Parts of the frontend
skeleton have been provided for you as well.

## Running specs

You will be running your code using Jest. Navigate to the root folder of
the skeleton and run `npm run test` to run all specs at once.

To run a single spec file, see 'Debugging Tips' section below.

### Where do the specs live?

For this assessment, Jest specs live in a single `__tests__` folder
within the frontend folder.

We recommend passing your specs in this order:

Entry point test:

1. `frontend/__tests__/react1-test.js`

Redux tests:

1. `frontend/__tests__/report_api_util-test.js`
2. `frontend/__tests__/report_actions-test.js`
3. `frontend/__tests__/reducers-test.js`
4. `frontend/__tests__/store-test.js`

Component tests:

1. `frontend/__tests__/report_index-test.js`
  * Write `ReportIndexContainer` before `ReportIndex`
2. `frontend/__tests__/report_index_item-test.js`
3. `frontend/__tests__/report_form-test.js`
  * Write `CreateReportFormContainer` and `EditReportFormContainer` before `ReportForm`
4. `frontend/__tests__/report_show-test.js`
  * Write `ReportShowContainer` before `ReportShow`

## Debugging tips

Jest is Facebook's defacto testing framework for React components and
Flux apps. Here are some tips for making debugging a little less
intimidating.

1. Look at the test file to see how we expect the method to behave. Jest
reads similarly to RSpec.  

2. Consider using the following commands:
  * `npm test frontend/__tests__/somepath/sometest.js`
    * run a single test file (HIGHLY RECOMMENDED)
  * `npm test -- --watchAll`
    * similar to `webpack --watch`, will update every time there is a change
  * `npm test -- --bail`
    * similar to `--fail-fast`, will abort test run after first error
    * execution does not stop after first failed test, but at end of file.  
    Therefore it is only useful when running the full test suite.
