class StoresSerializer
  include FastJsonapi::ObjectSerializer
  has_many :vendors
  has_many :users
  attributes :name, :vendors, :users
end
