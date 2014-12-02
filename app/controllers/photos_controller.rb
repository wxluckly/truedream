class PhotosController < ApplicationController

  def index
    @photos = Photo.sort_order.paginate(page: params[:page], per_page: 9)
  end

end