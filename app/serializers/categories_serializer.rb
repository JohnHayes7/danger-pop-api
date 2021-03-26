class CategoriesSerializer
  include FastJsonapi::ObjectSerializer
  has_many :vendors
  has_many :products
  attributes :name, :vendors, :products
end
