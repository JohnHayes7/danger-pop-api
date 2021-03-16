class UserSerializer
  include FastJsonapi::ObjectSerializer
  has_one :cart
  attributes :id, :name, :email, :phone_number, :administrator, :tattoo_approved, :id_img_path, :allergies
end
