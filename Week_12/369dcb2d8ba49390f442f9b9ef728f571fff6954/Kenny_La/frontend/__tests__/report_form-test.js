/* globals jest */

import React from 'react';
import { Route } from 'react-router-dom';
import configureMockStore from 'redux-mock-store';
import thunk from 'redux-thunk';
import { mount } from 'enzyme';
import MockRouter from 'react-mock-router';
import * as ReportActions from '../actions/report_actions';
import CreateReportFormContainer from '../components/reports/create_report_form_container';
import EditReportFormContainer from '../components/reports/edit_report_form_container';
import ReportForm from '../components/reports/report_form';

const mockedReport = {
  id: 1,
  understanding: 'good',
  improvement: 'great',
  created_at: '2017-02-17T04:19:07.404Z',
  updated_at: '2017-02-17T04:19:07.404Z'
};

const middlewares = [thunk];
const mockStore = configureMockStore(middlewares);
const testStore = mockStore({ reports: { [mockedReport.id]: mockedReport } });

describe('ReportFormContainer', () => {
  let reportFormWrapper,
    understandingInput,
    improvementTextarea;

  beforeEach(() => {
    ReportActions.updateReport = jest.fn(report => dispatch => {
      return Promise.resolve(report)
    });
    ReportActions.createReport = jest.fn(report => dispatch => {
      return Promise.resolve(report)
    });
    ReportActions.requestReport = jest.fn(id => dispatch => {
    });
  });

  describe('creating a new report', () => {
    beforeEach(() => {
      reportFormWrapper = mount(
        <MockRouter path={'/'}>
          <CreateReportFormContainer store={testStore} />
        </MockRouter>
      ).find(ReportForm);

      understandingInput = reportFormWrapper.find('input').filterWhere(input => (
        input.props().type === 'text'
      ));

      improvementTextarea = reportFormWrapper.find('textarea');
    });

    it('correctly maps state to props', () => {
      expect(reportFormWrapper.props().report).toEqual({
        understanding: '',
        improvement: ''
      });
      expect(reportFormWrapper.props().formType).toEqual('Add Report')
    });

    it('correctly maps dispatch to props', () => {
      const props = reportFormWrapper.props();

      expect(props.action).toBeDefined();
      expect(props.action).toBeInstanceOf(Function);
    });

    it('should contain text indicating it is the create form', () => {
      const renderedText = reportFormWrapper.text();
      expect(renderedText).toContain('Add Report');
    });

    it('pre-fills understanding and improvement fields with an empty string', () => {
      expect(understandingInput.props().value).toEqual('');
      expect(improvementTextarea.props().value).toEqual('');
    });

    it('updates the understanding field when it changes', () => {
      const value = 'I\'m doing OK.';
      understandingInput.prop('onChange')({
        currentTarget: { value },
        target: { value }
      });

      // Update wrapper and re-find input
      let updatedWrapper = reportFormWrapper.update();
      understandingInput = updatedWrapper.find('input').filterWhere(input => (
        input.props().type === 'text'
      ));

      // Assert that state was updated on component and that input value changed
      expect(reportFormWrapper.state().understanding).toEqual(value)
      expect(understandingInput.props().value).toEqual(value);
    });

    it('updates the improvement field when it changes', () => {
      const value = 'I can do better!';
      improvementTextarea.prop('onChange')({
        currentTarget: { value },
        target: { value }
      });

      // Update wrapper and re-find input
      let updatedWrapper = reportFormWrapper.update();
      improvementTextarea = updatedWrapper.find('textarea')

      // Assert that state was updated on component and that input value changed
      expect(reportFormWrapper.state().improvement).toEqual(value)
      expect(improvementTextarea.props().value).toEqual(value);
    });

    it('triggers the correct action when submitted', () => {
      const newReport = { understanding: 'terrible', improvement: 'excellent' };

      understandingInput.prop('onChange')({
        currentTarget: { value: newReport.understanding },
        target: { value: newReport.understanding }
      });
      improvementTextarea.prop('onChange')({
        currentTarget: { value: newReport.improvement },
        target: { value: newReport.improvement }
      });

      reportFormWrapper.find('form').simulate('submit');
      expect(ReportActions.createReport).toBeCalledWith(newReport);
    });
  });

  describe('updating an existing report', () => {
    beforeEach(() => {
      const testParams = { reportId: mockedReport.id };
      const editPath = "/reports/:reportId/edit";
      reportFormWrapper = mount(
        <MockRouter path={editPath} params={testParams}>
          <Route render={(props) => (
            <EditReportFormContainer store={testStore} {...props} />
          )} />
        </MockRouter>
      ).find(ReportForm);

      understandingInput = reportFormWrapper.find('input').filterWhere(input => (
        input.props().type === 'text'
      ));

      improvementTextarea = reportFormWrapper.find('textarea');
    });

    it('correctly maps state to props', () => {
      expect(reportFormWrapper.props().report).toEqual(mockedReport);
      expect(reportFormWrapper.props().formType).toEqual('Update Report');
    });

    it('correctly maps dispatch to props', () => {
      const props = reportFormWrapper.props();

      // Hint: fetch in EditReportForm!
      expect(props.requestReport).toBeUndefined();
      expect(props.action).toBeDefined();
      expect(props.action).toBeInstanceOf(Function);
    });

    it('should contain text indicating it is the edit form', () => {
      const renderedText = reportFormWrapper.text();
      expect(renderedText).toContain('Update Report');
    });

    it('fetches the appropriate report after being mounted', () => {
      expect(ReportActions.requestReport).toBeCalledWith(mockedReport.id);
    });

    it('pre-fills understanding and improvement fields with report data from the store', () => {
      expect(understandingInput.props().value).toEqual(mockedReport.understanding);
      expect(improvementTextarea.props().value).toEqual(mockedReport.improvement);
    });

    it('triggers the correct action when submitted', () => {
      reportFormWrapper.find('form').simulate('submit');
      expect(ReportActions.updateReport).toBeCalledWith(mockedReport);
    });
  });
});
