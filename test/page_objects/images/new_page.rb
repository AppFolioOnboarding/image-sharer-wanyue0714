module PageObjects
  module Images
    class NewPage < PageObjects::Document
      path #TODO

      form_for :image #TODO

      def create_image!(url: nil, tags: nil)
        #TODO
      end
    end
  end
end
