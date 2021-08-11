class Angler < ApplicationRecord
    has_many :fish
    has_many :locations, through: :fish 
    # has_many :categories, :through => :locations
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true
    has_secure_password 

    def self.from_omniauth(auth)
        Angler.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u| 
            u.email = auth['info']['email']
            u.username = auth['info']['name']
            u.password = SecureRandom.hex(15)
          end
    end
end
