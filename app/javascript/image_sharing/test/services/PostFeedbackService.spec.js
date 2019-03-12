import 'jsdom-global/register';
import React from 'react';
import sinon from "sinon";
import PostFeedbackService from '../../services/PostFeedbackService';
import * as api from '../../utils/helper';

describe.only('PostFeedbackService', () => {
  let sandbox;

  beforeEach(() => {
    sandbox = sinon.createSandbox();
  });

  afterEach(() => {
    sandbox.restore();
  });

  it('should set success message', () => {
    const dummyStore = {
      setResponse: sinon.spy()
    };

    const data = Promise.resolve({ message: 'message' });
    sandbox.stub(api, 'post').returns(data);

    const service = new PostFeedbackService(dummyStore, {});
    return service.postFeedback().then(() => {
      sinon.assert.calledWith(dummyStore.setResponse, 'success', 'message');
    });
  });

  it('should set failed message', () => {
    const dummyStore = {
      setResponse: sinon.spy()
    };

    const data = Promise.reject({});
    sandbox.stub(api, 'post').returns(data);

    const service = new PostFeedbackService(dummyStore, {});
    return service.postFeedback().then(() => {
      sinon.assert.calledWith(dummyStore.setResponse, 'danger', 'did not catch the data');
    });
  });
});
