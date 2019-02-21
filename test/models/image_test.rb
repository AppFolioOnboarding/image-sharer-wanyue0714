require 'test_helper'
class ImageTest < ActiveSupport::TestCase
  def test_image_valid
    image = Image.new(title: 'piggy',
                      link: 'https://s.abcnews.com/images/Lifestyle/AP_micro_pigs_1_sr_140319_mn_16x9_992.jpg')
    assert_predicate image, :valid?
  end

  def test_title_should_be_present
    image = Image.new(title: nil,
                      link: 'https://s.abcnews.com/images/Lifestyle/AP_micro_pigs_1_sr_140319_mn_16x9_992.jpg')
    assert_not_predicate image, :valid?
  end

  def test_link_should_be_present
    image = Image.new(title: 'piggy', link: nil)
    assert_not_predicate image, :valid?
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

  def test_image_url_shoul_be_valid
    image = Image.new(title: 'piggy', link: 'mn_16x9_992.ppp')
    assert_not_predicate image, :valid?
  end
end