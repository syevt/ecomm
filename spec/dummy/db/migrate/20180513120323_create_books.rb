class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.json :main_image
      t.string :title
      t.text :description
      t.decimal :price, precision: 5, scale: 2

      t.timestamps
    end
  end
end
