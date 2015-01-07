class Photo < ActiveRecord::Base
  mount_uploader :cover, PhotoCoverUploader
  mount_uploader :photo, PhotoUploader
  scope :sort_order, -> { order("-sort desc, id desc") }
end
