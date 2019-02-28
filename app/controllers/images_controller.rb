class ImagesController < ApplicationController
  def index
    @images = if image_tag_params.nil?
                Image.all.order(created_at: :desc)
              else
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
