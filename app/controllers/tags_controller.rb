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


  private

  def tag_params
    params.require(:tag).
      permit(:name)
  end
end
