/* globals jest */

jest.mock('../components/reports/report_index_item', () => (
  () => ({ render: () => (<div></div>) })
));
jest.mock('../components/reports/create_report_form_container', () => {
  // need to name function so we can query for it later
  return function FormContainer() {
    return { render: () => (<div></div>) }
  }
});

import React from 'react';
import { Route } from 'react-router-dom';
import { mount } from 'enzyme';
import MockRouter from 'react-mock-router';
import ReportIndexContainer from '../components/reports/report_index_container';
import ReportIndex from '../components/reports/report_index';
import * as ReportActions from '../actions/report_actions';
import configureMockStore from 'redux-mock-store';
import thunk from 'redux-thunk';

const reports = {
  1: {
    id: 1,
    understanding: 'good',
    improvement: 'great',
    createdAt: '2017-02-17T04:19:07.404Z',
    updatedAt: '2017-02-17T04:19:07.404Z'
  },
  2: {
    id: 2,
    understanding: 'great',
    improvement: 'good',
    createdAt: '2017-02-18T04:19:07.404Z',
    updatedAt: '2017-02-18T04:19:07.404Z'
  },
  3: {
    id: 3,
    understanding: 'great',
    improvement: 'great',
    createdAt: '2017-02-19T04:19:07.404Z',
    updatedAt: '2017-02-19T04:19:07.404Z'
  }
};

const middlewares = [thunk];
const mockStore = configureMockStore(middlewares);
const testStore = mockStore({ reports: reports });


describe('ReportIndex', () => {
  let reportIndexWrapper;

  beforeEach(() => {
    ReportActions.requestReports = jest.fn(() => dispatch => { });
    reportIndexWrapper = mount(
      <MockRouter>
        <ReportIndexContainer store={testStore} />
      </MockRouter>
    ).find(ReportIndex);
  });

  it('correctly maps state to props', () => {
    expect(reportIndexWrapper.props().reports).toEqual(Object.values(reports));
  });

  it('correctly maps dispatch to props', () => {
    expect(reportIndexWrapper.props().requestReports).toBeDefined();
    expect(reportIndexWrapper.props().deleteReport).toBeDefined();
    expect(reportIndexWrapper.props().requestReports).toBeInstanceOf(Function);
    expect(reportIndexWrapper.props().deleteReport).toBeInstanceOf(Function);
  });

  it('fetches reports after being mounted', () => {
    expect(ReportActions.requestReports).toBeCalled();
  });

  it('renders a ReportIndexItem for each report, passing in the `report` object and `deleteReport` action as props', () => {
    const reportIndexItems = reportIndexWrapper.find('ul').children();
    expect(reportIndexItems.getElements().length).toBe(3);

    // tests that each ReportIndexItem has correct props
    reportIndexItems.forEach((item, i) => {
      expect(item.props().report).toEqual(reports[i + 1]);
      expect(item.props().deleteReport).toEqual(reportIndexWrapper.props().deleteReport);
    });
  });

  it('has a link to the new report page', () => {
    const newLink = reportIndexWrapper.find('Link');

    expect(newLink.props().to).toEqual(`/reports/new`);
    expect(newLink.props().children).toEqual(`New Report`);
  });
});
