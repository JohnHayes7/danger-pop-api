class VendorsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :contact_name, :contact_phone, :contact_address, :store
end
