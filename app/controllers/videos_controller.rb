class VideosController < ApplicationController

  def index
    @videos = Video.sort_order
  end

  def show
    @video = Video.find(params[:id])
  end

end