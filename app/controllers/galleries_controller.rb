class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all
    render :index
  end

  def new
    @gallery = Gallery.new
    render :new
  end

  def create
    gallery = Gallery.create(gallery_params)

    redirect_to gallery_path(gallery)
  end

  def show
    @gallery = load_gallery_from_url
  end

  def edit
    @gallery = load_gallery_from_url 
    # render :edit
  end

  def update
    load_gallery_from_url.update(gallery_params)

    redirect_to gallery_path(load_gallery_from_url)
  end

  def destroy
    load_gallery_from_url.destroy

    redirect_to "/"
  end

  def gallery_params
    gallery_params = params.require(:gallery).permit(:name, :description)
  end

  def load_gallery_from_url
    Gallery.find(params[:id])
  end

end
