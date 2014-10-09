class ImagesController < ApplicationController
  def show
    @gallery = load_gallery_from_url
    @image = @gallery.images.find(params[:id])
    @comment = Comment.new
    @comments = @image.comments.recent
    @available_tags = Tag.all
  end

  def load_gallery_from_url
    Gallery.find(params[:gallery_id])
    #current_user.galleries.find(params[:gallery_id])
  end

  def new
    @gallery = load_gallery_from_url
    @image = @gallery.images.new

  end

  def create
    @gallery = load_gallery_from_url
    @image =  @gallery.images.new(image_params)
    @group = Group.find(params[:id])

    if @image.save
      redirect_to (@gallery)
    else
      render :new
    end
  end

  def edit
    @gallery = load_gallery_from_url
    @image = @gallery.images.find(params[:id])
  end

  def update
    @gallery = load_gallery_from_url
    @image = @gallery.images.find(params[:id])

    if @image.update(image_params)
    redirect_to gallery_image_path(@gallery, @image)
    else
      render :edit
    end
  end

  private

  def image_params
    params.
    require(:image).
      permit(:name, :url, group_ids: [], tag_ids: [])
  end

  def load_personal_gallery_from_url
      current_user.galleries.find(params[:id])
  end
end
