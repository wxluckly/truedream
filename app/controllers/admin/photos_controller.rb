class Admin::PhotosController < Admin::BaseController

  def index
    @photos = Photo.paginate(page: params[:page]).order("id desc")
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    respond_to do |format|
      if @photo.save
        format.html { redirect_to admin_photos_path }
        format.json { render :json => @json }
      else
        format.html { render action: :edit }
        format.json { render :json => @json }
      end
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    flash[:notice] = 'success' if @photo.update_attributes(photo_params)
    respond_to do |format|
      if @photo.save
        format.html { redirect_to admin_photos_path }
        format.js
      else
        format.html { render action: :edit }
      end
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    flash[:notice] = "删除成功" if @photo.destroy
    respond_to do |format|
      format.html { redirect_to admin_photos_path }
      format.json { render json: {status: true}.to_json }
    end
  end 

  private
  def photo_params
    params.require(:photo).permit(:title, :content, :cover, :photo)
  end

end