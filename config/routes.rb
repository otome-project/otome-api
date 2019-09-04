Rails.application.routes.draw do
  namespace 'api' do
  	namespace 'v1' do
			resources :users, :anime, :anime_lists, :rooms, :chats
			get '/chats/room/:id', to: 'chats#get_room_chat'
  	end
  end
end
