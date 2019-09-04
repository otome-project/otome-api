module Api
	module V1
    class AnimeController < ApplicationController

      def index
				anime = Anime.order('created_at DESC');
				render json: {status: 'SUCCESS', message:'Anime', data:anime},status: :ok
			end

			def show
				anime = Anime.find(params[:id])
				render json: {status: 'SUCCESS', message:'Anime', data:anime},status: :ok
			end

			def create
				anime = Anime.new(anime_params)
				if anime.save
					render json: {status: 'SUCCESS', message:'Saved anime', data:anime},status: :ok
				else
					render json: {status: 'ERROR', message:'Anime not saved', data:anime.errors},status: :unprocessable_entity
				end
			end

			def destroy
				anime = Anime.find(params[:id])
				anime.destroy
				render json: {status: 'SUCCESS', message:'Deleted anime', data:anime},status: :ok
			end

			def update
				anime = Anime.find(params[:id])
				if anime.update_attributes(anime_params)
					render json: {status: 'SUCCESS', message:'Updated anime', data:anime},status: :ok
				else
					render json: {status: 'ERROR', message:'Anime not update', data:anime.errors},status: :unprocessable_entity
				end
			end

			private
			def anime_params
				params.permit(:name)
			end
    end
  end
end