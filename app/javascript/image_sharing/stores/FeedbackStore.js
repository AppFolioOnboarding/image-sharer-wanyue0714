import { action, observable } from 'mobx';

export class FeedbackStore {
  @observable user_name;
  @observable comments;
  @observable response;

  constructor() {
    this.user_name = '';
    this.comments = '';
    this.response = {
      status: null,
      message: null
    }
  }

  @action
  setResponse(status, message) {
    this.response.status = status;
    this.response.message = message;
  }

  @action
  setUserName(userName) {
    this.user_name = userName;
  }

  @action
  setComments(comments){
    this.comments = comments;
  }

}

export default FeedbackStore;
