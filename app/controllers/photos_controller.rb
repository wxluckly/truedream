class PhotosController < ApplicationController

  def index
    @photos = Photo.sort_order
  end

end