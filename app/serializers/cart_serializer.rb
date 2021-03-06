class CartSerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :user
  has_many :products
  attributes :user, :products
end
