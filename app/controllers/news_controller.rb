class NewsController < ApplicationController
  def index
    @news = News.sort_order.paginate(page: params[:page], per_page: 5)
  end
end
