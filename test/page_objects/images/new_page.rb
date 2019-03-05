module PageObjects
  module Images
    class NewPage < PageObjects::Document
      path :new_image
      path :images

      form_for :image do
        element :title, locator: '#image_title'
        element :link, locator: '#image_link'
        element :tag_list, locator: '#image_tag_list'
      end

      element :error_message, locator: '#error_explanation ul li'

      def create_image!(name: nil, url: nil, tags: nil)
        title.set(name) if name.present?
        link.set(url) if url.present?
        tag_list.set(tags) if tags.present?
        node.click_button('Create Image')
        window.change_to(ShowPage, NewPage)
      end
    end
  end
end
