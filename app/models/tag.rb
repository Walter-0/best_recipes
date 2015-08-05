class Tag < ActiveRecord::Base
  has_many :categories
  has_many :photos, through: :categories, dependent: :destroy
end
