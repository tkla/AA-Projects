/* globals jest */

import thunk from 'redux-thunk';
import configureMockStore from 'redux-mock-store';

import * as Actions from '../actions/report_actions';
import * as ReportApiUtil from '../util/report_api_util';

const mockedReport = {
  id: 1,
  understanding: 'good',
  improvement: 'great',
  createdAt: '2017-02-17T04:19:07.404Z',
  updatedAt: '2017-02-17T04:19:07.404Z',
};

const middlewares = [thunk];
const mockStore = configureMockStore(middlewares);

describe('report actions', () => {
  describe('report constants', () => {
    it('should contain a RECEIVE_REPORTS constant', () => {
      expect(Actions.RECEIVE_REPORTS).toEqual('RECEIVE_REPORTS');
    });

    it('should contain a RECEIVE_REPORT constant', () => {
      expect(Actions.RECEIVE_REPORT).toEqual('RECEIVE_REPORT');
    });

    it('should contain a REMOVE_REPORT constant', () => {
      expect(Actions.REMOVE_REPORT).toEqual('REMOVE_REPORT');
    });
  });

  describe('thunks', () => {
    let store;

    beforeEach(() => {
      store = mockStore({ reports: {} });
    });

    describe('requestReports', () => {
      it('should export a requestReports function', () => {
        expect(typeof Actions.requestReports).toEqual('function');
      });

      it('dispatches RECEIVE_REPORTS when reports have been requested', () => {
        const reports = { [mockedReport.id]: mockedReport };
        ReportApiUtil.fetchReports = jest.fn(() => (
          Promise.resolve(reports)
        ));
        const expectedActions = [{ type: 'RECEIVE_REPORTS', reports }];

        return store.dispatch(Actions.requestReports()).then(() => {
          expect(store.getActions()).toEqual(expectedActions);
        });
      });
    });

    describe('requestReport', () => {
      it('should export a requestReport function', () => {
        expect(typeof Actions.requestReport).toEqual('function');
      });

      it('dispatches RECEIVE_REPORT when a single report has been requested', () => {
        const report = { id: 1, description: 'Test', date: '2017-01-01' };
        ReportApiUtil.fetchReport = jest.fn(id => (
          Promise.resolve(report)
        ));
        const expectedActions = [{ type: 'RECEIVE_REPORT', report: report }];

        return store.dispatch(Actions.requestReport(1)).then(() => {
          expect(store.getActions()).toEqual(expectedActions);
        });
      });
    });

    describe('createReport', () => {
      it('should export a createReport function', () => {
        expect(typeof Actions.createReport).toEqual('function');
      });

      it('dispatches RECEIVE_REPORT when a report has been created', () => {
        const newReport = { description: 'Description', date: '2017-01-02' };
        ReportApiUtil.createReport = jest.fn((report) => (
          Promise.resolve({ 1: report })
        ));
        const expectedActions = [{ type: 'RECEIVE_REPORT', report: { 1: newReport } }];

        return store.dispatch(Actions.createReport(newReport)).then(() => {
          expect(store.getActions()).toEqual(expectedActions);
        });
      });
    });

    describe('updateReport', () => {
      it('should export an updateReport function', () => {
        expect(typeof Actions.updateReport).toEqual('function');
      });

      it('dispatches RECEIVE_REPORT when a report has been updated', () => {
        const updatedReport = { description: 'Updated Description', date: '2017-02-02', id: 2 };
        ReportApiUtil.updateReport = jest.fn((report) => (
          Promise.resolve({ [updatedReport.id]: updatedReport })
        ));
        const expectedActions = [{
          type: 'RECEIVE_REPORT',
          report: { [updatedReport.id]: updatedReport }
        }];

        return store.dispatch(Actions.updateReport(updatedReport)).then(() => {
          expect(store.getActions()).toEqual(expectedActions);
        });
      });
    });

    describe('deleteReport', () => {
      it('should export a deleteReport function', () => {
        expect(typeof Actions.deleteReport).toEqual('function');
      });

      it('dispatches REMOVE_REPORT when a report has been deleted', () => {
        const report = { description: 'Description', date: '2017-02-03', id: 3 };

        ReportApiUtil.deleteReport = jest.fn((report) => (
          Promise.resolve(report)
        ));
        const expectedActions = [{
          type: 'REMOVE_REPORT',
          reportId: report.id
        }];

        return store.dispatch(Actions.deleteReport(report.id)).then(() => {
          expect(store.getActions()).toEqual(expectedActions);
        });
      });
    });
  });
});
