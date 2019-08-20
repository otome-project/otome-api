Rails.application.routes.draw do
  namespace 'api' do
  	namespace 'v1' do
  		resources :users
  		resources :anime
  	end
  end
end
