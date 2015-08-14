class PhotosController < ApplicationController

  #index, all photos
  def index
    @photos = Photo.all.order(score: :desc)
  end

  #my_photos
  def my_index
    # nice!
    @photos = User.find(session[:user]["id"]).photos.order(score: :desc)
  end

  # I'd delete this... why keep it around?
  #myIndex shows only user's photos
  #def myIndex
  #end

  #new
  def new
    @photo = Photo.new
  end

  #create
  def create
    @user = User.find(session[:user]["id"])
    @photo = @user.photos.create!(photo_params)
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
    @user = @photo.user
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
    # you should look into `find_or_create_by`, it would shorten the next 4 lines
    # down to one!
    @tag = Tag.find_by(tag_name: params[:tag_name])
    if !@tag
      @tag = Tag.create!(tag_name: params[:tag_name])
    end
    @tag.categories.create!(photo_id: params[:photo_id])
    redirect_to :back
  end

  # This is deleting all taggings of a tag to a photo, rather than just on the
  # one photo, if you filtered the categories by photo_id as well, you could
  # just untag one photo without all the others as well.
  # If you really mean for this to delete a whole tag, it shold be in the tags
  # controller
  # actually, I'm not sure I can find anywhere in your app that routes to this
  # action
  def delete_tag
    @tag = Tag.find_by(tag_name: params[:tag_name])
    @tag.categories.destroy_all
    redirect_to :back
  end

  def upvote
    # this is a nice MVP version, but the next step would be to create a Vote
    # model which has a post_id and vote_id (and a +1 / -1 value) so you can
    # prevent multiple upvotes / downvotes
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
    # You don't need this method here, since you're not creating any comments
    # in this controller
    def comment_params
      params.require(:comment).permit(:content)
    end

end
