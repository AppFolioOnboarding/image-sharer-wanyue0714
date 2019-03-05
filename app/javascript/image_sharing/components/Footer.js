import React, { Component } from 'react';
import { Row, Col } from 'reactstrap';
import PropTypes from 'prop-types';

class Footer extends Component {
  static propTypes = {
    copyright: PropTypes.string.isRequired
  };

  render() {
    const copyright = this.props.copyright;
    return (
      <div className = 'Footer'>
        {copyright}
      </div>
    )
  }
}

export default Footer;
