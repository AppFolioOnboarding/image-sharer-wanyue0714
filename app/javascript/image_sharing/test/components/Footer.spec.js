import 'jsdom-global/register';
import React from 'react';
import { shallow, configure } from 'enzyme';
import { expect } from 'chai';
import Footer from '../../components/Footer';
import Adapter from 'enzyme-adapter-react-16';
configure({ adapter: new Adapter() });

describe('<Footer />', () => {
  it('should render correctly', () => {
    const wrapper = shallow(
      <Footer copyright={'copyright string'} />
    );
    const footer = wrapper.find('div');
    expect(footer.text()).to.equal('copyright string');
  })
});

