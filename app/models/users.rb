class Users < ApplicationRecord
	validates :name, presence: true
	validates :favorite_anime, presence: true
end
