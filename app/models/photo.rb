class Photo < ActiveRecord::Base
  mount_uploader :cover, PhotoCoverUploader
  scope :sort_order, -> { order("-sort desc, id desc") }
end
