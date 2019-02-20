require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  def test_should_get_images_index_path
    get images_path
    assert_response :success
  end

  def test_shoule_create_new_image
    image = Image.create!(title: 'piggy',
                          link: 'https://s.abcnews.com/images/Lifestyle/AP_micro_pigs_1_sr_140319_mn_16x9_992.jpg')

    assert_difference('Image.count') do
      post images_path, params: { image: { title: image.title, link: image.link } }
    end
  end

  def test_should_get_new_image_path
    get new_image_path

    assert_response :success
    assert_includes body, 'Back to Homepage'
  end
end
