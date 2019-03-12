require 'test_helper'

class FeedbackTest < ActiveSupport::TestCase
  def test_feedback__shoud_be_valid
    feedback = Feedback.create!(user_name: 'User01', comments: 'This is a comment')
    assert_predicate feedback, :valid?
  end

  def test_username__should_be_present
    feedback = Feedback.new(user_name: '', comments: 'This is a comment')
    assert_not_predicate feedback, :valid?
    assert_equal "can't be blank", feedback.errors.messages[:user_name].first
  end

  def test_comments__should_be_present
    feedback = Feedback.new(user_name: 'User01', comments: '')
    assert_not_predicate feedback, :valid?
    assert_equal "can't be blank", feedback.errors.messages[:comments].first
  end
end
