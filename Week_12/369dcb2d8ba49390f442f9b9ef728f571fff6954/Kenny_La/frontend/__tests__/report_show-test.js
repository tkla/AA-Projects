import React from 'react';
import { Route } from 'react-router-dom';
import ReportShowContainer from '../components/reports/report_show_container';
import ReportShow from '../components/reports/report_show';
import { mount, shallow } from 'enzyme';
import * as ReportActions from '../actions/report_actions';
import configureMockStore from 'redux-mock-store';
import thunk from 'redux-thunk';
import MockRouter from 'react-mock-router';
import merge from 'lodash/merge'

import {
  formatDateTime
} from '../util/date_util';

const mockedReport = {
  id: 1,
  understanding: 'good',
  improvement: 'great',
  createdAt: '2017-02-17T04:19:07.404Z',
  updatedAt: '2017-02-17T04:19:07.404Z'
};

const middlewares = [thunk];
const mockStore = configureMockStore(middlewares);
const testStore = mockStore({ reports: { [mockedReport.id]: mockedReport } });

describe('ReportShow', () => {
  let reportShowWrapper;

  beforeEach(() => {
    ReportActions.requestReport = jest.fn(() => dispatch => { });

    reportShowWrapper = mount(
      <MockRouter params={{ reportId: mockedReport.id }}>
        <Route render={props => (
          <ReportShowContainer {...props} store={testStore} />
        )} />
      </MockRouter>
    ).find(ReportShow);
  });

  it('correctly maps state to props', () => {
    expect(reportShowWrapper.props().report).toEqual(mockedReport);
  });

  it('correctly maps dispatch to props', () => {
    expect(reportShowWrapper.props().requestReport).toBeDefined();
    expect(reportShowWrapper.props().requestReport).toBeInstanceOf(Function);
  });

  it('fetches the appropriate report after being mounted', () => {
    expect(ReportActions.requestReport).toBeCalledWith(mockedReport.id);
  });

  it('contains the report understanding text', () => {
    const renderedText = reportShowWrapper.text();
    expect(renderedText).toContain(mockedReport.understanding);
  });

  it('contains the report improvement text', () => {
    const renderedText = reportShowWrapper.text();
    expect(renderedText).toContain(mockedReport.improvement);
  });

  it('has a Link that links to the report index page', () => {
    const indexLink = reportShowWrapper.find('Link');

    expect(indexLink).toBeDefined();
    expect(indexLink.props().to).toEqual(`/`);
  });

  // Use `formatDate` to display `createdAt`.
  it('contains the report\'s createdAt in the `formatDateTime` format a single time', () => {
    const renderedText = reportShowWrapper.text();
    const formattedDate = formatDateTime(mockedReport.createdAt);

    expect(renderedText).toContain(formattedDate);
  });

  // Use `formatDateTime` to display `updatedAt` if, and only if,
  // `updatedAt` is not the same as `createdAt`.
  describe('when the report\'s updatedAt value is not equal to it\'s createdAt value', () => {
    it('contains the report\'s updatedAt value in the proper format', () => {
      const updatedReport = merge({}, mockedReport);
      const now = new Date();
      updatedReport.updatedAt = now.toJSON();

      const mockStore = configureMockStore(middlewares);
      const testStore = mockStore({ reports: { [updatedReport.id]: updatedReport } });
      const updatedReportShowNode = mount(
        <MockRouter params={{ reportId: mockedReport.id }}>
          <Route render={props => (
            <ReportShowContainer {...props} store={testStore} />
          )} />
        </MockRouter>
      ).find(ReportShow);

      const renderedText = updatedReportShowNode.text();
      const formattedDate = formatDateTime(updatedReport.updatedAt);

      expect(renderedText).toContain(formattedDate);
    });
  });

  describe('when the report\'s updatedAt value is equal to it\'s createdAt value', () => {
    it('contains the createdAt/updatedAt value exactly once', () => {
      const renderedText = reportShowWrapper.text();
      const formattedDate = formatDateTime(mockedReport.createdAt);

      expect(mockedReport.createdAt).toEqual(mockedReport.updatedAt);
      expect(renderedText).toContain(formattedDate);
      const replacedText = renderedText.replace(formattedDate, '');
      expect(replacedText).not.toContain(formattedDate);
    });
  });
});
