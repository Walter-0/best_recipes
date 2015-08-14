# this code isn't routable... I think it should be deleted!
class CategoriesController < ApplicationController

  def create
    @photo = Photo.find(params[:photo_id])
    @tag = Tag.find(params[:id])
    @tag.categories.create(photo_id: params[:photo_id])
    redirect_to photo_path(@photo)
  end

  def delete
    @photo = Photo.find(params[:photo_id])
    @tag = Tag.find(params[:id])
    delete = @tag.categories.where(photo_id: params[:photo_id]).destroy_all
    redirect_to photo_path(@photo)
  end


end
