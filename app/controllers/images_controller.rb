class ImagesController < ApplicationController
  def index
    @images = if image_tag_params.nil?
                @tag_flag = false
                Image.all.order(created_at: :desc)
              else
                @tag_flag = true
                ImagesFilterService.run(tag: image_tag_params)
              end
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      redirect_to image_path(@image)
    else
      render 'new'
    end
  end

  def show
    @image = Image.find(image_id_params)
  rescue ActiveRecord::RecordNotFound
    flash[:notice] = 'Image to be displayed does not exist!'
  end

  def destroy
    @image = Image.find(image_id_params)
    @image.destroy
    redirect_to images_path
  rescue ActiveRecord::RecordNotFound
    flash[:notice] = 'Image to be deleted does not exist!'
    redirect_to images_path
  end

  private

  def image_params
    params.require(:image).permit(:title, :link, :tag_list)
  end

  def image_id_params
    params.permit(:id)[:id]
  end

  def image_tag_params
    params.permit(:tag)[:tag]
  end
end
