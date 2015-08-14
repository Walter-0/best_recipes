class CommentsController < ApplicationController

  #index
  def index
    @comments = Comment.all
  end

  #new
  def new
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.new
  end

  #create
  def create
    @user = User.find(session[:user]["id"])
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.where(user: @user).create!(comment_params.merge)
    redirect_to photo_path(@photo)
  end

  #edit
  def edit
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.find(params[:id])
  end

  #show
  def show
    @comment = Comment.find(params[:id])
  end

  #update
  def update
    # would be a good idea to ensure the current user matches the comment user
    # to prevent editing other people's comments!
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to photo_path(@photo)
  end

  #destroy
  def destroy
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to photo_path(@photo)
  end

  private
      def comment_params
        params.require(:comment).permit(:content, :photo_id)
      end
end
