/* globals jest */

import * as ApiUtil from '../util/report_api_util';

describe('the api util', () => {
  beforeEach(() => {
    global.$ = require.requireMock('jquery');
    global.$.ajax = jest.fn(options => 'ajax promise');
  });

  afterEach(() => {
    global.$.ajax.mockClear();
  });

  it('fetchReports makes request and returns an ajax promise', () => {
    const returnValue = ApiUtil.fetchReports();
    expect($.ajax).toBeCalled();

    // This line gets the first argument of the first call to $.ajax
    const ajaxCallArg = $.ajax.mock.calls[0][0];
    expect(ajaxCallArg.url).toMatch(/^\/?api\/reports\/?$/);
    expect(returnValue).toEqual('ajax promise');
  });

  it('fetchReport makes request and returns an ajax promise', () => {
    const returnValue = ApiUtil.fetchReport(1);
    expect($.ajax).toBeCalled();

    const ajaxCallArg = $.ajax.mock.calls[0][0];
    expect(ajaxCallArg.url).toMatch(/^\/?api\/reports\/1\/?$/);
    expect(returnValue).toEqual('ajax promise');
  });

  it('createReport makes request and returns an ajax promise', () => {
    const report = {
      understanding: 'good',
      improvement: 'Though much I know, much to be learned there is.',
    };
    const returnValue = ApiUtil.createReport(report);
    expect($.ajax).toBeCalled();

    const ajaxCallArg = $.ajax.mock.calls[0][0];
    expect(ajaxCallArg.url).toMatch(/^\/?api\/reports\/?$/);
    expect(ajaxCallArg.type || ajaxCallArg.method).toMatch(/post/i);
    expect(ajaxCallArg.data).toEqual({ report });
    expect(returnValue).toEqual('ajax promise');
  });

  it('updateReport makes request and returns an ajax promise', () => {
    const report = {
      id: 10,
      understanding: 'good',
      improvement: 'Though much I know, much to be learned there is.',
    };
    const returnValue = ApiUtil.updateReport(report);
    expect($.ajax).toBeCalled();

    const ajaxCallArg = $.ajax.mock.calls[0][0];
    expect(ajaxCallArg.url).toMatch(/^\/?api\/reports\/10\/?$/);
    expect(ajaxCallArg.type || ajaxCallArg.method).toMatch(/patch/i);
    expect(ajaxCallArg.data).toEqual({ report });
    expect(returnValue).toEqual('ajax promise');
  });

  it('deleteReport makes request and returns an ajax promise', () => {
    const returnValue = ApiUtil.deleteReport(10);
    expect($.ajax).toBeCalled();
    const ajaxCallArg = $.ajax.mock.calls[0][0];

    expect(ajaxCallArg.url).toMatch(/^\/?api\/reports\/10\/?$/);
    expect(ajaxCallArg.type || ajaxCallArg.method).toMatch(/delete/i);
    expect(returnValue).toEqual('ajax promise');
  });
});
