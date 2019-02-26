require 'test_helper'

class ImagesFilterServiceTest < ActiveSupport::TestCase
  def test_filter_service__should_filter_image_by_tag
    images = [
      { title: 'train',
        link: 'http://www.sugartours.com/images/fall-foliage-event-anchor-470x320.png',
        tag_list: %w[tag1] },
      { title: 'fire_bird',
        link: 'https://www.skyany.com/data/files/shuaiwei/SW011/1.jpg',
        tag_list: %w[tag1 tag2] },
      { title: 'plants',
        link: 'https://i.pinimg.com/originals/28/35/99/28359930ef4ee70928fe417650bbb03d.jpg',
        tag_list: %w[tag2 tag3] }
    ]
    Image.create!(images)
    assert_equal ImagesFilterService.run(tag: 'tag1').length, 2
    assert_equal ImagesFilterService.run(tag: 'tag2').length, 2
    assert_equal ImagesFilterService.run(tag: 'tag3').length, 1
  end
end
