class AnimeLists < ApplicationRecord
	validates :anime_id, presence: true
	validates :user_id, presence: true
	validates :status, presence: true
	validates :rating, presence: true
end
