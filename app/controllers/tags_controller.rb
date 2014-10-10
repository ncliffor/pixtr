class TagsController < ApplicationController
  def index
    @tags = Tag.all
    @tag= Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to tags_path
    else
      @tags = Tag.all
      render :index
    end
  end

  def show
    @tag = Tag.find(params[:id])
    @images = @tag.images
  end

  def destroy
    tag = Tag.find(params[:id])
    tag.destroy
    redirect_to tags_path
  end

  private

  def tag_params
    params.require(:tag).
      permit(:name)
  end
end
