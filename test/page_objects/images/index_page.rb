require 'page_objects/images/image_card'

module PageObjects
  module Images
    class IndexPage < PageObjects::Document
      path :images

      collection :images, locator: '#images-list', item_locator: '.js-image-card', contains: ImageCard do
        def view!
          link = node.find('.js-image-link')
          link.click
          window.change_to(NewPage)
        end
      end

      def add_new_image!
        node.click_on('Go to upload new image')
        window.change_to(NewPage)
      end

      def showing_image?(url:, tags: nil)
        images.any? do |image|
          image.url == url && ((tags.present? && image.tags == tags) || tags.nil?)
        end
      end

      def clear_tag_filter!
        # TODO
      end
    end
  end
end
