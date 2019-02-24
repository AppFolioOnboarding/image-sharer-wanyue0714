require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
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

  def test_image__should_show_image
    image = Image.create!(title: 'piggy',
                          link: 'https://s.abcnews.com/images/Lifestyle/AP_micro_pigs_1_sr_140319_mn_16x9_992.jpg')
    get image_path(image)
    assert_response :success
    assert_select 'img[src="https://s.abcnews.com/images/Lifestyle/AP_micro_pigs_1_sr_140319_mn_16x9_992.jpg"]',
                  count: 1
    assert_select 'img' do |img|
      assert img[0].attributes['width'].value.to_i <= 400
    end
  end

  def test_index__should_display_existing_images
    images = [
      { title: 'train',
        link: 'http://www.sugartours.com/images/fall-foliage-event-anchor-470x320.png' },
      { title: 'fire_bird',
        link: 'https://www.skyany.com/data/files/shuaiwei/SW011/1.jpg' },
      { title: 'plants',
        link: 'https://i.pinimg.com/originals/28/35/99/28359930ef4ee70928fe417650bbb03d.jpg' }
    ]
    Image.create!(images)
    get images_path
    assert_response :ok
    assert_select 'img', 3 do |image|
      assert image[0].attributes['width'].value.to_i <= 400
      assert image[1].attributes['width'].value.to_i <= 400
      assert image[2].attributes['width'].value.to_i <= 400
      assert_equal 'https://i.pinimg.com/originals/28/35/99/28359930ef4ee70928fe417650bbb03d.jpg',
                   image[0].attributes['src'].value
      assert_equal 'https://www.skyany.com/data/files/shuaiwei/SW011/1.jpg',
                   image[1].attributes['src'].value
      assert_equal 'http://www.sugartours.com/images/fall-foliage-event-anchor-470x320.png',
                   image[2].attributes['src'].value
    end
  end
end
