/* globals jest */

import React from 'react';
import { Route } from 'react-router-dom';
import PropTypes from 'prop-types';
import { mount } from 'enzyme';
import MockRouter from 'react-mock-router';
import ReportIndexItem from '../components/reports/report_index_item';
import { formatDate } from '../util/date_util';

const mockedReport = {
  id: 1,
  understanding: 'good',
  improvement: 'great',
  createdAt: '2017-02-17T04:19:07.404Z',
  updatedAt: '2017-02-17T04:19:07.404Z'
};

describe('ReportIndexItem', () => {
  let report,
    reportIndexItemWrapper,
    push,
    deleteReport;

  beforeEach(() => {
    report = mockedReport;
    deleteReport = jest.fn();
    push = jest.fn();

    const testProps = {
      deleteReport,
      report
    };

    reportIndexItemWrapper = mount(
      <MockRouter push={push}>
        <ReportIndexItem {...testProps} />
      </MockRouter>
    ).find(ReportIndexItem);
  });

  it('should be a function', () => {
    expect(typeof ReportIndexItem).toEqual('function');
  });

  it('shows the report\'s date as a Link to the report\'s show page', () => {
    const showLink = reportIndexItemWrapper.find("Link").filterWhere(link => (
      link.props().to === `/reports/${report.id}`
    ));
    const expectedText = formatDate(report.createdAt);

    expect(showLink.props().children).toEqual(expectedText);
    expect(showLink.props().to).toEqual(`/reports/${report.id}`);
  });

  it('has a link that links to the report edit page', () => {
    const editLink = reportIndexItemWrapper.find('Link').filterWhere(link => (
      link.props().to === `/reports/${report.id}/edit`
    ));

    expect(editLink.props().children).toEqual('Edit');
    expect(editLink.props().to).toEqual(`/reports/${report.id}/edit`);
  });

  it('has a button to delete report', () => {
    const deleteButton = reportIndexItemWrapper.find('button')
    expect(deleteButton).toBeDefined();

    // click on Delete button with mock report object
    expect(deleteReport).not.toHaveBeenCalled();
    deleteButton.simulate('click');
    expect(deleteReport).toBeCalledWith(report.id);
  });
});
