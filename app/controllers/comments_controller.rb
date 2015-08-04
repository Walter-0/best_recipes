class CommentsController < ApplicationController

  #index
  def index
    @comments = Comment.all
  end

  #new
  def new
    @photo = Photo.find(params[:post_id])
    @comment = Comment.new
  end

  #create
  def create
    @comment = Comment.create!(comment_params)
    redirect_to photos_path
  end

  #edit
  def edit
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.find(params[:photo_id])
  end

  #show
  #update
  #destroy

  private
      def comment_params
        params.require(:comment).permit(:content, :post_id)
      end
end
