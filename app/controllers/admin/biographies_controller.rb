class Admin::BiographiesController < Admin::BaseController
  def edit
    @biography = Biography.first
  end

  def update
    @biography = Biography.first
    flash[:notice] = 'success' if @biography.update_attributes(biography_params)
    respond_to do |format|
      if @biography.save
        format.html { render action: :edit }
        format.js
      else
        format.html { render action: :edit }
        format.js
      end
    end
  end

  private
  def biography_params
    params.require(:biography).permit(:content)
  end
end