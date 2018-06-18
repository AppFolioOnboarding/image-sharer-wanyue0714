import React, { Component } from 'react';
import { Row, Col } from 'reactstrap';
import PropTypes from 'prop-types';

class Header extends Component {
  static propTypes = {
    title: PropTypes.string.isRequired
  };

  render() {
    const title = this.props.title;
    return (
      <div>
        <Row>
          <Col lg={{ size: 4, offset: 4 }}>
            <h3 className='text-center'>
              {title}
            </h3>
          </Col>
        </Row>
      </div>
    )
  }
}

export default Header;
