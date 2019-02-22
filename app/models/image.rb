class Image < ApplicationRecord
  URL_REGEX = %r{(https?:\/\/.*\.(?:png|jpg|gif|tif))}i
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :link, presence: true, format: { with: URL_REGEX, message: 'is invalid URL for image' }
end
