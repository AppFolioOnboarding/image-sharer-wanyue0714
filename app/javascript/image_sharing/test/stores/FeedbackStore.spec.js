import 'jsdom-global/register';
import React from 'react';
import { expect } from 'chai';
import FeedbackStore from '../../stores/FeedbackStore';

describe('FeedbackStore', () => {
  it('should set user name', () => {
    const store = new FeedbackStore();
    store.setUserName('User01');
    expect(store.userName).to.equal('User01');
  });

  it('should set comments', () => {
    const store = new FeedbackStore();
    store.setComments('comments');
    expect(store.comments).to.equal('comments');
  });

  it('should set response', () => {
    const store = new FeedbackStore();
    store.setResponse('success', 'message');
    expect(store.response.status).to.equal('success');
    expect(store.response.message).to.equal('message');
  });
});
