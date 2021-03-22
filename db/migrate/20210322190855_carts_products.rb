class CartsProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts_products, :id => false do |t|
      t.integer :cart_id
      t.integer :product_id
    end
  end
end
