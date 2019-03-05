import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/App';
import { Provider } from 'mobx-react';
import FeedbackStore from './stores/FeedbackStore';

const stores = {
  feedbackStore: new FeedbackStore()
};

/* Initialize your store here*/

ReactDOM.render(
  <Provider stores={stores}>
    <App/>
  </Provider>,
  document.getElementById('feedback-root')
);
