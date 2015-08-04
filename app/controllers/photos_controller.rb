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
    # @tags = @photo.tags
  end

  #update
  def update
    @photo = Photo.find(params[:id])
    @photo.update(photo_params)
  end

  #destroy
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to root_path
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
