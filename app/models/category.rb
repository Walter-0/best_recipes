# I would call this model a Tagging, since it represents a tag applied to a
# photo. Category is a confusing name for this model.
class Category < ActiveRecord::Base
  belongs_to :tag
  belongs_to :photo
end
