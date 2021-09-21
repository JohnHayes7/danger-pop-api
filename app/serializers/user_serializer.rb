class UserSerializer
  include FastJsonapi::ObjectSerializer
  has_one :cart
  has_many :products, through: :cart
  has_many :tattoo_requests
  has_many :projects, through: :tattoo_requests
  has_many :appointments, through: :projects
  belongs_to :store
  attributes :id, :name, :email, :phone_number, :administrator, :tattoo_approved, :inital_login, :id_img_path, :allergies, :cart, :products, :tattoo_requests, :projects, :appointments, :account_creation_method, :inital_login
end
