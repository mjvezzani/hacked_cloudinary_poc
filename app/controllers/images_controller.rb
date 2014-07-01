class ImagesController < ApplicationController

  def index
    @images = Image.all
  end

  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new
    @image_information = Cloudinary::Uploader.upload(params["image"]["picture"])
    @image.name = params["image"]["name"]
    @image.url = @image_information["secure_url"]

    if @image.save
      redirect_to images_path
    else
      render :new
    end
  end

end
