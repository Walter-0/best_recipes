class Photo < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_many :categories
  has_many :tags, through: :categories, dependent: :destroy
end
