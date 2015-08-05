class PhotosController < ApplicationController

  #index
  def index
    @photos = Photo.all
  end

  #myIndex shows only user's photos
  #def myIndex
  #end

  #new
  def new
    @photo = Photo.new
  end

  #create
  def create
    @photo = Photo.create!(photo_params)
    @photo.score = 0
    @photo.save
    redirect_to (photo_path(@photo))
  end

  #edit
  def edit
    @photo = Photo.find(params[:id])
  end

  #show/new comment
  def show
    @photo = Photo.find(params[:id])
    @comments = @photo.comments
    @comment = Comment.new
    @tag = Tag.new
    @tags = @photo.tags
    @categories = @photo.categories
    @score = @photo.score
  end

  #update
  def update
    @photo = Photo.find(params[:id])
    @photo.update(photo_params)
  end

  #destroy
  def destroy
    @photo = Photo.find(params[:id])
    @photo.categories.destroy_all
    @photo.destroy
    redirect_to root_path
  end

  def add_tag
    @tag = Tag.find_by(tag_name: params[:tag_name])
    if !@tag
      @tag = Tag.create!(tag_name: params[:tag_name])
    end
    @tag.categories.create!(photo_id: params[:photo_id])
    redirect_to :back
  end

  def delete_tag
    @tag = Tag.find_by(tag_name: params[:tag_name])
    @tag.categories.destroy_all
    redirect_to :back
  end

  def upvote
    @photo = Photo.find(params[:photo_id])
    @photo.score += 1
    @photo.save

    redirect_to photo_path(@photo)
  end

  def downvote
    @photo = Photo.find(params[:photo_id])
    @photo.score -= 1
    @photo.save
    redirect_to photo_path(@photo)
  end

  private
  def photo_params
    params.require(:photo).permit(:title, :photo_url, :user_id)
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end

end
