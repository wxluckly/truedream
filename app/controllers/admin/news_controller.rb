class Admin::NewsController < Admin::BaseController

  def index
    @news = News.sort_order.paginate(page: params[:page])
  end

  def new
    @news = News.new
  end

  def create
    @news = News.new(news_params)
    respond_to do |format|
      if @news.save
        format.html { redirect_to admin_news_index_path }
        format.json { render :json => @json }
      else
        format.html { render action: :edit }
        format.json { render :json => @json }
      end
    end
  end

  def edit
    @news = News.find(params[:id])
  end

  def update
    @news = News.find(params[:id])
    flash[:notice] = 'success' if @news.update_attributes(news_params)
    respond_to do |format|
      if @news.save
        format.html { redirect_to admin_news_index_path }
        format.js
      else
        format.html { render action: :edit }
      end
    end
  end

  def destroy
    @news = News.find(params[:id])
    flash[:notice] = "删除成功" if @news.destroy
    respond_to do |format|
      format.html { redirect_to admin_news_index_path }
      format.json { render json: {status: true}.to_json }
    end
  end 

  private
  def news_params
    params.require(:news).permit(:title, :content, :cover, :published_at, :source, :video, :summary)
  end

end