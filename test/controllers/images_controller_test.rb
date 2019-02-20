require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  def test_should_get_images_index_path
    get images_path
    assert_response :success
  end
end
