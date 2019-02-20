require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  def test_home
    get root_path
    assert_response :success
  end
end
