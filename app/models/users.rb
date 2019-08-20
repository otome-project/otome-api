class Users < ApplicationRecord
	has_secure_password
	validates :name, presence: true
	validates :favorite_anime, presence: true
end
