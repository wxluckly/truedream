class Admin::VideosController < Admin::BaseController

  def index
    @videos = Video.paginate(page: params[:page]).order("id desc")
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    respond_to do |format|
      if @video.save
        format.html { redirect_to admin_videos_path }
        format.json { render :json => @json }
      else
        format.html { render action: :edit }
        format.json { render :json => @json }
      end
    end
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])
    flash[:notice] = 'success' if @video.update_attributes(video_params)
    respond_to do |format|
      if @video.save
        format.html { redirect_to admin_videos_path }
        format.js
      else
        format.html { render action: :edit }
      end
    end
  end

  def destroy
    @video = Video.find(params[:id])
    flash[:notice] = "删除成功" if @video.destroy
    respond_to do |format|
      format.html { redirect_to admin_videos_path }
      format.json { render json: {status: true}.to_json }
    end
  end 

  private
  def video_params
    params.require(:video).permit(:title, :content, :cover, :video)
  end

end