class VideosController < ApplicationController

  def index
    @videos = Video.sort_order
  end

end