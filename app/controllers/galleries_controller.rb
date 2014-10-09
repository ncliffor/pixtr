class GalleriesController < ApplicationController

  def index
    @galleries = Gallery.all
    render :index
  end

  def new
    @gallery = current_user.galleries.new
    render :new
  end

  def create
    @gallery = current_user.galleries.new(gallery_params)

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
    gallery = load_personal_gallery_from_url
    gallery.destroy

    redirect_to root_path
  end

  def gallery_params
    gallery_params = params.require(:gallery).permit(:name, :description)
  end

  def load_gallery_from_url
    Gallery.find(params[:id])
  end

  def load_personal_gallery_from_url
    current_user.galleries.find(params[:id])
  end
end
