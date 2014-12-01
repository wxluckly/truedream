class Video < ActiveRecord::Base
  mount_uploader :cover, VideoCoverUploader
end
