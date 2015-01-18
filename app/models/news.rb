class News < ActiveRecord::Base
  mount_uploader :cover, NewsCoverUploader
  scope :sort_order, -> { order("-sort desc, published_at desc, id desc") }
end
