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
    @gallery = Gallery.new(gallery_params)

    if @gallery.save
      redirect_to gallery_path(@gallery)
    else
      render :new
    end
  end

  def show
    @gallery = load_gallery_from_url
  end

  def edit
    @gallery = load_gallery_from_url 
    # render :edit
  end

  def update
    @gallery = load_gallery_from_url

    if @gallery.update(gallery_params)
      redirect_to gallery_path(@gallery)
    else
      render :edit
    end
  end

  def destroy
    load_gallery_from_url.destroy

    redirect_to root_path
  end

  def gallery_params
    gallery_params = params.require(:gallery).permit(:name, :description)
  end

  def load_gallery_from_url
    Gallery.find(params[:id])
  end
end
