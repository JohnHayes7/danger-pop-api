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
end
