class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :brand_id
      t.string :category_id          
      t.string :photo_file_name
      t.string :photo_content_type
      t.integer :photo_file_size
      t.timestamps
    end
  end
end
