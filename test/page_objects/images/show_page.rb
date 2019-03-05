module PageObjects
  module Images
    class ShowPage < PageObjects::Document
      path :image

      def image_url
        node.find('img')[:src]
      end

      def tags
        node.all('p a').map(&:text).first.split
      end

      def delete
        # TODO
        yield node.driver.browser.switch_to.alert
      end

      def delete_and_confirm!
        # TODO
        window.change_to(IndexPage)
      end

      def go_back_to_index!
        node.click_on('Back to Homepage')
        window.change_to(IndexPage)
      end
    end
  end
end
