module Api
	module V1
    class AnimeListsController < ApplicationController

      def index
				anime_lists = AnimeLists.order('created_at DESC');
				render json: {status: 'SUCCESS', message:'AnimeLists', data:anime_lists},status: :ok
			end

			def show
				anime_lists = AnimeLists.find(params[:id])
				render json: {status: 'SUCCESS', message:'AnimeLists', data:anime_lists},status: :ok
			end

			def create
				anime_lists = AnimeLists.new(animelist_params)
				if anime_lists.save
					render json: {status: 'SUCCESS', message:'Saved anime_lists', data:anime_lists},status: :ok
				else
					render json: {status: 'ERROR', message:'AnimeLists not saved', data:anime_lists.errors},status: :unprocessable_entity
				end
			end

			def destroy
				anime_lists = AnimeLists.find(params[:id])
				anime_lists.destroy
				render json: {status: 'SUCCESS', message:'Deleted anime_lists', data:anime_lists},status: :ok
			end

			def update
				anime_lists = AnimeLists.find(params[:id])
				if anime_lists.update_attributes(animelist_params)
					render json: {status: 'SUCCESS', message:'Updated anime_lists', data:anime_lists},status: :ok
				else
					render json: {status: 'ERROR', message:'AnimeLists not update', data:anime_lists.errors},status: :unprocessable_entity
				end
			end

			private
			def animelist_params
				params.permit(:anime_id, :user_id , :status, :rating)
			end
    end
  end
end