class CategoriesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :vendor_id
end
