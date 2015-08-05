class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.references :photo, index: true, foreign_key: true
    end
  end
end
