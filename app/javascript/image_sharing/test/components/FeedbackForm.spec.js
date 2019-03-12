import 'jsdom-global/register';
import React from 'react';
import { mount, shallow, configure } from 'enzyme';
import { expect } from 'chai';
import FeedbackForm from '../../components/FeedbackForm';
import { Form, Button, Input } from 'reactstrap';
import FeedbackStore from '../../stores/FeedbackStore';
import PostFeedbackService from '../../services/PostFeedbackService';
import * as api from '../../utils/helper';
import Adapter from 'enzyme-adapter-react-16';
import sinon from 'sinon';
configure({ adapter: new Adapter() });

describe('<FeedbackForm />', () => {
  let feedbackStore = new FeedbackStore();
  feedbackStore.userName = 'Yue Wan';
  feedbackStore.comments = 'The first comment';

  let sandbox;

  beforeEach(() => {
    sandbox = sinon.createSandbox();
  });

  afterEach(() => {
    sandbox.restore();
  });

  it('should render correctly', () => {
    const click = () => {};

    const wrapper = shallow(<FeedbackForm store={feedbackStore} onClick={click} />);
    const form = wrapper.find(Form);

    expect(form).to.have.length(1);

    const userNameInput = form.find(Input).at(0);
    expect(userNameInput.props()).to.include({
      className: 'js-username',
      type: 'text',
      placeholder: 'Enter your user name here',
      value: 'Yue Wan'
    });

    const commentsInput = form.find(Input).at(1);
    expect(commentsInput.props()).to.include({
      className: 'js-comments',
      type: 'textarea',
      placeholder: 'Enter your comments here',
      value: 'The first comment'
    });

    const button = form.find(Button);
    expect(button).to.have.length(1);
  })

  it.only('should call postFeedbackService when submit the form', () => {
    const data = Promise.resolve({ message: 'message' });
    sandbox.stub(api, 'post').returns(data);

    const click = sinon.spy();
    const wrapper = mount(<FeedbackForm store={feedbackStore} onClick={click} />);
    const button = wrapper.find(Button);
    button.simulate('click');

    sinon.assert.calledOnce(api.post);
  })
});
