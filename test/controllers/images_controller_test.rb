require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  def test_home
    get root_path
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

  def test_should_get_show_image
    image = Image.create!(title: 'piggy',
                          link: 'https://s.abcnews.com/images/Lifestyle/AP_micro_pigs_1_sr_140319_mn_16x9_992.jpg')
    get image_path(image)
    assert_response :success
    assert_select 'img[src="https://s.abcnews.com/images/Lifestyle/AP_micro_pigs_1_sr_140319_mn_16x9_992.jpg"]',
                  count: 1
  end
end
