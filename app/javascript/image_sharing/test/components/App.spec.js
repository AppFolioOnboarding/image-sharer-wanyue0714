import 'jsdom-global/register';
import React from 'react';
import { shallow, configure } from 'enzyme';
import { expect } from 'chai';
import App from '../../components/App';
import Header from '../../components/Header';
import FlashMessage from '../../components/FlashMessage';
import FeedbackForm from '../../components/FeedbackForm';
import Footer from '../../components/Footer';
import Adapter from 'enzyme-adapter-react-16';
configure({ adapter: new Adapter() });

describe('<App />', () => {
  it('should render correctly', () => {
    const feedbackstores = {
      feedbackStore: {}
    };

    const wrapper = shallow(<App.wrappedComponent stores={feedbackstores}/>);

    const header = wrapper.find(Header);
    const flashMessage = wrapper.find(FlashMessage);
    const feedbackForm = wrapper.find(FeedbackForm);
    const footer = wrapper.find(Footer);

    expect(header).to.have.length(1);
    expect(flashMessage).to.have.length(1);
    expect(feedbackForm).to.have.length(1);
    expect(footer).to.have.length(1);
  })
});

