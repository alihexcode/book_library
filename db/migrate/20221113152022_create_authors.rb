class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.text :bio
      t.integer :gender
      t.integer :total_books
      t.text :summary
      t.date :born
      t.date :died

      t.timestamps
    end
  end
end
