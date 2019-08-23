module Api
	module V1
		class ChatsController < ApplicationController
			
      def index
				chats = Chats.order('created_at DESC');
				render json: {status: 'SUCCESS', message:'Chats', data:chats},status: :ok
			end

			def show
				chats = Chats.find(params[:id])
				render json: {status: 'SUCCESS', message:'Chat', data:chats},status: :ok
			end

			def create
				chats = Chats.new(chat_params)
				if chats.save
					render json: {status: 'SUCCESS', message:'Saved chat', data:chats},status: :ok
				else
					render json: {status: 'ERROR', message:'Chat not saved', data:chats.errors},status: :unprocessable_entity
				end
			end

			def destroy
				chats = Chats.find(params[:id])
				chats.destroy
				render json: {status: 'SUCCESS', message:'Deleted chat', data:chats},status: :ok
      end
      
      def get_room_chat
        chats = Chats.where(room_id: params[:id])
				render json: {status: 'SUCCESS', message:'Chat room', data:chats},status: :ok
      end

			private
			def chat_params
				params.permit(:message, :received_id, :sent_id, :room_id)
			end
		end
	end
end