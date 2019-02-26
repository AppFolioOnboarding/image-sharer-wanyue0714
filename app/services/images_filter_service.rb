class ImagesFilterService
  def self.run(tag:)
    Image.tagged_with(tag).order(created_at: :desc)
  end
end
