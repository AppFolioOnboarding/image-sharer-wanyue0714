module PageObjects
  module Images
    class ImageCard < AePageObjects::Element
      def url
        node.find('img')[:src]
      end

      def tags
        #TODO
      end

      def click_tag!(tag_name)
        #TODO
      end
    end
  end
end
