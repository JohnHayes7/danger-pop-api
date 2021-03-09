class UserSerializer
  include FastJsonapi::ObjectSerializer
  has_one :cart
  attributes :id, :name, :email, :phone_number, :administrator, :tattoo_approved
end
