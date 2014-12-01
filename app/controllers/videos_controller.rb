class VideosController < ApplicationController

  def index
    @videos = Video.sort_order.paginate(page: params[:page], per_page: 12)
  end

  def show
    @video = Video.find(params[:id])
  end

end