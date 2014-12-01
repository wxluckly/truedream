class Video < ActiveRecord::Base
  mount_uploader :cover, VideoCoverUploader
  scope :sort_order, -> { order("-sort desc, id desc") }
end
