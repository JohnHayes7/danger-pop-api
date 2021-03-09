class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :email, :phone_number, :administrator, :tattoo_approved
end
