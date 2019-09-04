class Chats < ApplicationRecord
	validates :message, presence: true
	validates :received_id, presence: true
	validates :sent_id, presence: true
	validates :room_id, presence: true
end
