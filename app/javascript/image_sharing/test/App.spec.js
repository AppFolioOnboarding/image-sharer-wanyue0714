import 'jsdom-global/register';
import React from 'react';
import { shallow, configure } from 'enzyme';
import { expect } from 'chai';
import App from '../components/App';
import Header from '../components/Header';
import Footer from '../components/Footer';
import Adapter from 'enzyme-adapter-react-16';
configure({ adapter: new Adapter() });

describe('<App />', () => {
  it('should render correctly', () => {
    const wrapper = shallow(<App.wrappedComponent />);
    const header = wrapper.find(Header);
    const footer = wrapper.find(Footer);
    expect(header).to.have.length(1);
    expect(footer).to.have.length(1);
  })
});

