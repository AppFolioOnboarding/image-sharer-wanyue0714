import React, { Component } from 'react';
import { inject } from 'mobx-react';
import Header from './Header';
import Footer from "./Footer";

class App extends Component {
  /* Add Prop Types check*/
  render() {
    return (
      <div>
        <Header title={'Tell us what you think'} />
        /* Put your components here: Flash Message, Form, Footer */
      </div>
    )
  }
}

export default inject(
  'stores'
)(App);
