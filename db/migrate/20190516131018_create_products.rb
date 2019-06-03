class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :brief
      t.integer :price
      t.text :description
      t.text :kit
      t.string :videos

      t.timestamps
    end
  end
end
