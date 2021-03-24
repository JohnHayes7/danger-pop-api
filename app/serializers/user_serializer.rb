class UserSerializer
  include FastJsonapi::ObjectSerializer
  has_one :cart
  has_many :products, through: :cart
  has_many :tattoo_requests
  has_many :projects, through: :tattoo_requests
  has_many :appointments, through: :projects
  belongs_to :store
  attributes :id, :name, :email, :phone_number, :administrator, :tattoo_approved, :id_img_path, :allergies
end
