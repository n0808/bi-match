class Image < ApplicationRecord
  validates :src, presence: true
  
  mount_uploader :src, ImageUploader
  belongs_to :hairdresser
end
