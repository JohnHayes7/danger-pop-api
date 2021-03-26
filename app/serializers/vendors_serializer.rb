class VendorsSerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :store
  has_many :categories
  attributes :name, :contact_name, :contact_phone, :contact_address, :store, :categories
end
