class AddNewPriceToProducts < ActiveRecord::Migration[5.2]
  def change
  	add_column :products, :new_price, :integer
  end
end
