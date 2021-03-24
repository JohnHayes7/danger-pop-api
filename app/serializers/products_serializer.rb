class ProductsSerializer
  include FastJsonapi::ObjectSerializer
  has_many :categories
  has_many :carts
  has_many :users, through: :carts
  has_many :sizes
  has_many :dimensions
  attributes :name, :price, :quantity, :shipping_height, :shipping_weight, :image_folder
end
