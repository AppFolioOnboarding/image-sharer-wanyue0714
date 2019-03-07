require 'test_helper'

class FeedbacksControllerTest < ActionDispatch::IntegrationTest
  def test_feedback__shoule_create_new_feedback
    feedback = Feedback.create!(user_name: 'User01', comments: 'This is a comment')
    assert_difference 'Feedback.count', 1 do
      post api_feedbacks_path, params: {
        feedback: {
          user_name: feedback.user_name,
          comments: feedback.comments
        }
      }
    end
  end
end
