require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  def test_image_valid
    image = Image.new(title: 'piggy',
                      link: 'https://s.abcnews.com/images/Lifestyle/AP_micro_pigs_1_sr_140319_mn_16x9_992.jpg')
    assert_predicate image, :valid?
  end

  def test_title__should_be_present
    image = Image.new(title: '',
                      link: 'https://s.abcnews.com/images/Lifestyle/AP_micro_pigs_1_sr_140319_mn_16x9_992.jpg')
    assert_not_predicate image, :valid?
    assert_equal "can't be blank", image.errors.messages[:title].first
  end

  def test_link__should_be_present
    image = Image.new(title: 'piggy', link: '')
    assert_not_predicate image, :valid?
    assert_equal "can't be blank", image.errors.messages[:link].first
  end

  def test_name_should_not_be_too_long
    image = Image.new(title: 'a' * 200,
                      link: 'https://s.abcnews.com/images/Lifestyle/AP_micro_pigs_1_sr_140319_mn_16x9_992.jpg')
    assert_not_predicate image, :valid?
  end

  def test_name_should_not_be_too_short
    image = Image.new(title: 'a',
                      link: 'https://s.abcnews.com/images/Lifestyle/AP_micro_pigs_1_sr_140319_mn_16x9_992.jpg')
    assert_not_predicate image, :valid?
  end

  def test_image_url__shoul_be_valid
    image = Image.new(title: 'piggy', link: 'mn_16x9_992.ppp')
    assert_not_predicate image, :valid?
    assert_equal 'is invalid URL for image', image.errors.messages[:link].first
  end

  def test_image_seeds__should_load_twenty_images
    Image.delete_all
    Rails.application.load_seed
    assert_equal Image.count, 20
    assert_equal Image.first.tag_list.count, 1
  end

  def test_image__should_taggable
    image = Image.new(title: 'piggy',
                      link: 'https://s.abcnews.com/images/Lifestyle/AP_micro_pigs_1_sr_140319_mn_16x9_992.jpg',
                      tag_list: %w[cartoon pets])
    assert_equal image.tag_list, %w[cartoon pets]
    image.tag_list.remove('pets')
    assert_equal image.tag_list, ['cartoon']
  end
end
