class News < ActiveRecord::Base
  mount_uploader :cover, NewsCoverUploader
  scope :sort_order, -> { order("published_at desc, id desc") }
end
