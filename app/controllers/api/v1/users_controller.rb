module Api
	module V1
		class UsersController < ApplicationController
			
      def index
				users = Users.order('created_at DESC');
				render json: {status: 'SUCCESS', message:'Users', data:users},status: :ok
			end

			def show
				users = Users.find(params[:id])
				render json: {status: 'SUCCESS', message:'User', data:users},status: :ok
			end

			def create
				users = Users.new(users_params)
				if users.save
					render json: {status: 'SUCCESS', message:'Saved user', data:users},status: :ok
				else
					render json: {status: 'ERROR', message:'User not saved', data:users.erros},status: :unprocessable_entity
				end
			end

			def destroy
				users = Users.find(params[:id])
				users.destroy
				render json: {status: 'SUCCESS', message:'Deleted user', data:users},status: :ok
			end

			def update
				users = Users.find(params[:id])
				if users.update_attributes(users_params)
					render json: {status: 'SUCCESS', message:'Updated user', data:users},status: :ok
				else
					render json: {status: 'ERROR', message:'User not update', data:users.erros},status: :unprocessable_entity
				end
			end

			private
			def users_params
				params.permit(:name, :favorite_anime, :bio, :login, :password, :gender, :interest)
			end
		end
	end
end