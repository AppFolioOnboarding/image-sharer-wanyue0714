class ImagesController < ApplicationController
  def home; end

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

  private

  def image_params
    params.require(:image).permit(:title, :link)
  end
end
