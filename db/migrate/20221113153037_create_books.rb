class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :content_name
      t.string :isbn
      t.string :original_title
      t.string :year
      t.string :language_code
      t.string :category
      t.text :plot
      t.string :copyright
      t.string :title
      t.float :average_rating
      t.integer :rating_count
      t.text :description
      t.string :loc_class
      t.string :language
      t.integer :pages
      t.string :isbn13
      t.date :release_date
      t.string :cover
      t.text :summary
      t.integer :total_authors
      t.boolean :content_cleaned
      t.boolean :content_available

      t.timestamps
    end
  end
end
