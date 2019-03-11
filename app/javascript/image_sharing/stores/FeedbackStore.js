import { observable } from 'mobx';

export class FeedbackStore {
  @observable userName = '';
  @observable comments = '';
}

export default FeedbackStore;
