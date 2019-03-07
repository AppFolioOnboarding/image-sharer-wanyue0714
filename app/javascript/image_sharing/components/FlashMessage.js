import React, { Component } from 'react';
import { Alert, Row, Col } from 'reactstrap';
import PropTypes from 'prop-types';
import { observer } from 'mobx-react';

@observer
export class FlashMessage extends Component {
  static propTypes = {
    store: PropTypes.object.isRequired
  };

  render() {
    const store = this.props.store;
    const alert = (store.response.status && <Alert color={store.response.status}>
      {store.response.message}
    </Alert>);
    return (
      <Row>
        <Col lg={{size: 4, offset: 4}}>
          {alert}
        </Col>
      </Row>
    );
  }
}

export default FlashMessage;
