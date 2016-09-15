require 'flow_test_helper'

class ImagesCrudTest < FlowTestCase
  test 'extremely simple test to show page objects setup works' do
    image_url = 'https://media3.giphy.com/media/EldfH1VJdbrwY/200.gif'
    Image.create!(url: image_url)

    images_index_page = PageObjects::Images::IndexPage.visit
    assert_predicate images_index_page.node.find("img[src=\"#{image_url}\"]"), :present?
  end
end
