class Rooms < ApplicationRecord
	validates :channel_path, presence: true
end
