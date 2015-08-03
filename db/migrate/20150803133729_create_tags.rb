class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :tag_name
      t.references :photo, index: true, foreign_key: true
    end
  end
end
