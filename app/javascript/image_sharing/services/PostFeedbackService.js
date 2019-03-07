import { post } from "../utils/helper";

export class PostFeedbackService {
  constructor(store, params) {
    this.store = store;
    this.params = params;
  }

  postFeedback = () => {
    return post('/api/feedbacks', this.params)
      .then(data => {
        console.log(data);
        this.setFlashMessage('success', data.message);
      })
      .catch(() => {
        this.setFlashMessage('danger', 'did not catch the data');
      });
  };

  setFlashMessage(status, msg) {
    this.store.setResponse(status, msg);
  }
}

export default PostFeedbackService;
