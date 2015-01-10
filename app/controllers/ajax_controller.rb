class AjaxController < ApplicationController
  def add_star
    news = News.find(params[:article_id])
    news.star = (news.star || 0) + 1
    news.save
    render nothing: true  
  end
end