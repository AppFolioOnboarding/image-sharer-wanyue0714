import React, { Component } from 'react';
import { Row, Col } from 'reactstrap';
import { Button, Input , Form, Label, FormGroup } from 'reactstrap';
import PropTypes from 'prop-types';
import { observer } from 'mobx-react';
import PostFeedbackService from "../services/PostFeedbackService";

@observer
class FeedbackForm extends Component {
  static propTypes = {
    store: PropTypes.object.isRequired
  };

  onClickHandler = (e) => {
    const params = {
      user_name: this.props.store.userName,
      comments: this.props.store.comments
    };
    const service = new PostFeedbackService(this.props.store, params);
    return service.postFeedback();
  };

  render() {
    return (
      <Form>
        <Col lg={{ size: 4, offset: 4 }}>
          <FormGroup>
            <Label> User Name: </Label>
            <Input
              className='js-username' type="text" placeholder="Enter your user name here"
              onChange={(e) => this.props.store.setUserName(e.target.value)}
              value={this.props.store.userName}
            />
          </FormGroup>
          <FormGroup>
            <Label> Comments: </Label>
            <Input
              className='js-comments' type="textarea"
              placeholder ="Enter your comments here"
              onChange={(e) => this.props.store.setComments(e.target.value)}
              value={this.props.store.comments}
            />
          </FormGroup>
          <Button type="button" color='primary' onClick={this.onClickHandler}>Submit</Button>
        </Col>
      </Form>

    )
  }
}

export default FeedbackForm;
