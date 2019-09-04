module Api
	module V1
		class RoomsController < ApplicationController
			
      def index
				rooms = Rooms.order('created_at DESC');
				render json: {status: 'SUCCESS', message:'Rooms', data:rooms},status: :ok
			end

			def show
				rooms = Rooms.find(params[:id])
				render json: {status: 'SUCCESS', message:'Room', data:rooms},status: :ok
			end

			def create
				rooms = Rooms.new(rooms_params)
				if rooms.save
					render json: {status: 'SUCCESS', message:'Saved room', data:rooms},status: :ok
				else
					render json: {status: 'ERROR', message:'Room not saved', data:rooms.errors},status: :unprocessable_entity
				end
			end

			def destroy
				rooms = Rooms.find(params[:id])
				rooms.destroy
				render json: {status: 'SUCCESS', message:'Deleted room', data:rooms},status: :ok
			end

			def update
				rooms = Rooms.find(params[:id])
				if rooms.update_attributes(rooms_params)
					render json: {status: 'SUCCESS', message:'Updated room', data:rooms},status: :ok
				else
					render json: {status: 'ERROR', message:'Room not update', data:rooms.errors},status: :unprocessable_entity
				end
			end

			private
			def rooms_params
				params.permit(:channel_path, :users_id, :status)
			end
		end
	end
end