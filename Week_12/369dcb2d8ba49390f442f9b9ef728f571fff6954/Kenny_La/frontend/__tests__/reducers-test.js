/* globals jest */

import ReportsReducer from '../reducers/reports_reducer';
import * as ReportActions from '../actions/report_actions';
import RootReducer from '../reducers/root_reducer';
import { createStore } from 'redux';

describe('Reducers', () => {
  describe('ReportsReducer', () => {
    let oldState;

    beforeEach(() => {
      oldState = { 2: 'oldState' }
    })

    it('exports a function', () => {
      expect(typeof ReportsReducer).toEqual('function');
    });

    it('should initialize with an empty object as the default state', () => {
      expect(ReportsReducer(undefined, {})).toEqual({});
    });

    it('should return the previous state if an action is not matched', () => {
      const newState = ReportsReducer(oldState, { type: 'notAType' });
      expect(newState).toBe(oldState);
    });

    describe('handling the RECEIVE_REPORTS action', () => {
      let testReports,
        action;

      beforeEach(() => {
        testReports = { 1: 'testReport1', 2: 'testReport2' };
        action = {
          type: ReportActions.RECEIVE_REPORTS,
          reports: testReports,
        };
      });

      it('should replace the state with the action\'s reports', () => {
        const state = ReportsReducer(undefined, action);
        expect(state).toEqual(testReports);
      });

      it('should not modify the old state', () => {
        ReportsReducer(oldState, action);
        expect(oldState).toEqual({ 2: 'oldState' });
      });
    });

    describe('handling the RECEIVE_REPORT action', () => {
      let testReport,
        action;

      beforeEach(() => {
        testReport = {
          id: 1,
          understanding: 'good',
          improvement: 'great',
          created_at: '2017-02-17T04:19:07.404Z',
          updated_at: '2017-02-17T04:19:07.404Z',
        };
        action = {
          type: ReportActions.RECEIVE_REPORT,
          report: testReport,
        };
      });

      it('should add the report to the state using the report id as a key', () => {
        let state = ReportsReducer(undefined, action);
        expect(state[1]).toEqual(testReport);
      });

      it('should not affect the other reports in the state', () => {
        let state = ReportsReducer(oldState, action);
        expect(state[2]).toEqual('oldState');
      });

      it('should not modify the old state', () => {
        ReportsReducer(oldState, action);
        expect(oldState).toEqual({ 2: 'oldState' });
      });
    });

    describe('handling the REMOVE_REPORT action', () => {
      let testReport,
        action;

      beforeEach(() => {
        oldState = { 1: 'oldState', 2: 'testReport' }
        testReport = {
          id: 2,
          understanding: 'good',
          improvement: 'great',
          created_at: '2017-02-17T04:19:07.404Z',
          updated_at: '2017-02-17T04:19:07.404Z',
        };
        action = {
          type: ReportActions.REMOVE_REPORT,
          reportId: testReport.id,
        };
      });

      it('should remove the correct report from the state', () => {
        let state = ReportsReducer({ 2: testReport }, action);
        expect(typeof state[2]).toEqual('undefined');
      });

      it('should not affect the other reports in the state', () => {
        let state = ReportsReducer(oldState, action);
        expect(state[1]).toEqual('oldState');
      });

      it('should not modify the old state', () => {
        ReportsReducer(oldState, action);
        expect(oldState).toEqual({ 1: 'oldState', 2: 'testReport' });
      });
    });
  });

  describe('RootReducer', () => {
    let testStore;

    beforeAll(() => {
      testStore = createStore(RootReducer);
    });

    it('exports a function', () => {
      expect(typeof RootReducer).toEqual('function');
    });

    it('includes the ReportsReducer under the key `reports`', () => {
      const report = {
        id: 1,
        understanding: 'good',
        improvement: 'great',
        created_at: '2017-02-17T04:19:07.404Z',
        updated_at: '2017-02-17T04:19:07.404Z',
      };
      const action = { type: ReportActions.RECEIVE_REPORT, report };

      testStore.dispatch(action);
      expect(testStore.getState().reports).toEqual(
        ReportsReducer({ [report.id]: report }, report)
      );
    });
  });
});
