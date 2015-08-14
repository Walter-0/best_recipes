class TagsController < ApplicationController


  #index
  def index
    @tags = Tag.all
  end

  # this action (as well as create / edit) actions aren't used and should be
  # deleted to keep your code clean!
  
  #new
  def new
    @photo = Photo.find(params[:photo_id])
    @tag = Tag.new
  end

  #create
  def create
    @photo = Photo.find(params[:photo_id])
    @tag = Tag.create(tag_params)
    redirect_to photo_path(@photo)
  end

  #edit
  def edit
    @tag = Tag.find(params[:id])
    @photo = Photo.find(params[:photo_id])
  end

  #show
  def show
    @tag = Tag.find(params[:id])
    @photo = @tag.photos
  end

  #update

  #destroy
  def destroy
    @tag = Tag.find(params[:id])
    @tag.categories.destroy
    @tag.destroy
    #@photo = Photo.find(params[:photo_id])
    redirect_to tags_path
  end


  private
  def tag_params
    params.require(:tag).permit(:tag_name)
  end
end
