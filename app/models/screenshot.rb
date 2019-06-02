class Screenshot < ApplicationRecord
  # mount_uploader :url, DraftImageUploader
  mount_uploader :draft_photo, DraftPhotoUploader
end
