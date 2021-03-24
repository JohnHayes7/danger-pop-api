class CategoriesSerializer
  include FastJsonapi::ObjectSerializer
  has_many :vendors
  has_many :products
  attributes :name, :vendor_id
end
