import React, { Component } from 'react';
import { Row, Col } from 'reactstrap';
import { Button, Input , Form, Label, FormGroup } from 'reactstrap';
import PropTypes from 'prop-types';
import { observer } from 'mobx-react';

class FeedbackForm extends Component {
  static propTypes = {
    store: PropTypes.object.isRequired
  };

  render() {
    return (
      <Form>
        <Col lg={{ size: 4, offset: 4 }}>
          <FormGroup>
            <Label> User Name: </Label>
            <Input className='js-username' type="text" placeholder="Enter your user name here" />
          </FormGroup>
          <FormGroup>
            <Label> Comments: </Label>
            <Input className='js-comments' type="textarea" placeholder ="Enter your comments here" />
          </FormGroup>
          <Button type="button" >Submit</Button>
        </Col>
      </Form>

    )
  }
}

export default FeedbackForm;
