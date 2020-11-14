class Public::PageImagesController < ApplicationController
  def create
    @page_image = PageImage.new(page_image_params)
    @page_image.save

    respond_to do |format|
      format.json { render json: { url: @page_image.image.url, page_image_id: @page_image.id } }
    end
  end

  def destroy
    @page_iamge = PageImage.find(params[:id])
    @remember_id = @page_iamge.id
    @page_iamge.destroy
    FileUtils.remove_dir("#{Rails.root}/public/uploads/upload/image/#{@remember_id}")
    respond_to do |format|
      format.json { render json: { status: :ok } }
    end
  end

  private

  def page_iamge_params
    params.require(:page_iamge).permit(:image)
  end
end
