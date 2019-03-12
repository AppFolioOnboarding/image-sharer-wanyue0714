import React, { Component } from 'react';
import { inject, observer } from 'mobx-react';
import Header from './Header';
import Footer from './Footer';
import PropTypes from 'prop-types';
import FeedbackForm from './FeedbackForm';
import FlashMessage from './FlashMessage';

@observer
class App extends Component {
  static propTypes = {
    stores: PropTypes.object.isRequired
  };

  render() {
    const feedbackStore = this.props.stores.feedbackStore;
    return (
      <div>
        <Header title={'Tell us what you think'} />
        <FlashMessage store={feedbackStore} />
        <FeedbackForm store={feedbackStore} />
        <Footer copyright={'Copyright: Appfolio Inc. Onboarding'} />
      </div>
    )
  }
}

export default inject(
  'stores'
)(App);
