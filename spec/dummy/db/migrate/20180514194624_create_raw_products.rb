class CreateRawProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :raw_products do |t|
      t.json :image
      t.string :name
      t.text :desc
      t.decimal :cost, precision: 5, scale: 2

      t.timestamps
    end
  end
end
