module Api
  class FeedbacksController < ApplicationController
    def create
      @feedback = Feedback.new(feedback_params)
      if @feedback.save
        render json: { message: 'feedback successfully saved!!!' }, status: :ok
      else
        render new_feedback_path
      end
    end

    private

    def feedback_params
      params.require(:feedback).permit(:user_name, :comments)
    end
  end
end
