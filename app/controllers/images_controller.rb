class ImagesController < ApplicationController
  def index
    @images = Image.all.order(created_at: :desc)
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
    params.require(:image).permit(:title, :link)
  end

  def image_id_params
    params.permit(:id)[:id]
  end
end
