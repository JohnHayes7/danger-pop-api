class ProductsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :price, :quantity, :shipping_height, :shipping_weight, :image_folder
end
