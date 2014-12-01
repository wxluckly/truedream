class Photo < ActiveRecord::Base
  mount_uploader :cover, PhotoCoverUploader
end
