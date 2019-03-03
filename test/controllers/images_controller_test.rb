require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  def test_shoule_create_new_image
    image = Image.create!(title: 'piggy',
                          link: 'https://s.abcnews.com/images/Lifestyle/AP_micro_pigs_1_sr_140319_mn_16x9_992.jpg')

    assert_difference('Image.count') do
      post images_path, params: { image: { title: image.title, link: image.link, tag_list: image.tag_list } }
    end
  end

  def test_should_get_new_image_path
    get new_image_path

    assert_response :success
    assert_includes body, 'Back to Homepage'
    assert_select 'input#image_tag_list', count: 1
  end

  def test_image__should_show_image
    image = Image.create!(title: 'piggy',
                          link: 'https://s.abcnews.com/images/Lifestyle/AP_micro_pigs_1_sr_140319_mn_16x9_992.jpg',
                          tag_list: %w[tag1 tag2])
    get image_path(image)
    assert_response :success
    assert_select 'img[src="https://s.abcnews.com/images/Lifestyle/AP_micro_pigs_1_sr_140319_mn_16x9_992.jpg"]',
                  count: 1
    assert_select 'img' do |img|
      assert img[0].attributes['width'].value.to_i <= 400
    end
    assert_select 'li', 2 do |tags|
      assert_equal tags[0].text, 'tag1'
      assert_select tags[0], 'a[href=?]', '/images?tag=tag1'
      assert_equal tags[1].text, 'tag2'
      assert_select tags[1], 'a[href=?]', '/images?tag=tag2'
    end
  end

  def test_index__should_display_existing_images
    tag_arr = [%w[tag01 tag02], %w[tag11], %w[tag21 tag22 tag23]]
    images = [
      { title: 'train',
        link: 'http://www.sugartours.com/images/fall-foliage-event-anchor-470x320.png',
        tag_list: tag_arr[0] },
      { title: 'fire_bird',
        link: 'https://www.skyany.com/data/files/shuaiwei/SW011/1.jpg',
        tag_list: tag_arr[1] },
      { title: 'plants',
        link: 'https://i.pinimg.com/originals/28/35/99/28359930ef4ee70928fe417650bbb03d.jpg',
        tag_list: tag_arr[2] }
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
    assert_select 'ul', 3 do |tags_all|
      tags_all.each_with_index do |tag_group, group_index|
        assert_select tag_group, 'li' do |tags|
          tags.each_with_index do |tag, tag_index|
            assert_equal tag_arr[2 - group_index][tag_index], tag.text
          end
        end
      end
    end
  end

  def test_image__should_destroy_image_from_homepage
    image = Image.create!(title: 'piggy',
                          link: 'https://s.abcnews.com/images/Lifestyle/AP_micro_pigs_1_sr_140319_mn_16x9_992.jpg',
                          tag_list: %w[tag1 tag2])
    assert_difference 'Image.count', -1 do
      delete image_path(image.id)
    end
    assert_redirected_to images_path
  end

  def test_image__flash_notice_if_image_does_not_exist
    assert_no_difference 'Image.count' do
      delete image_path(1)
    end
    assert_equal 'Image to be deleted does not exist!', flash[:notice]
    get image_path(1)
    assert_equal 'Image to be displayed does not exist!', flash[:notice]
  end
end
