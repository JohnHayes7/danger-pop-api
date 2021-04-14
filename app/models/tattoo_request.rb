class TattooRequest < ApplicationRecord
    belongs_to :user
    has_one :project
    has_many :notes



    has_attached_file :image, styles:{
        thumb: '100x100>',
        square: '200x200#',
        medium: '500x500#>'
      }

    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
    validates :guest_full_name, presence: true
    validates :guest_phone, presence: true
    validates :guest_email, presence: true
    validates :description, presence: true 
    validates :allergies, presence: true
    validates :body_location_image_path, presence:true
end
