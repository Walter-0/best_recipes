class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.string :photo_url
      t.string :score
      t.references :user, index: true, foreign_key: true
    end
  end
end
