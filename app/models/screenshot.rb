class Screenshot < ApplicationRecord
  mount_uploader :image, ImageUploader
end
