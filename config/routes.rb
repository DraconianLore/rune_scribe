Rails.application.routes.draw do

  mount ActionCable.server => '/cable'
  get 'app', to: 'familiar#index'
  get 'app/*path', to: 'familiar#index'
  root 'landing#index'
  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create', as: 'log_in'
  get 'logout', to: 'sessions#destroy'
  get 'password', to: 'passwords#edit', as: 'edit_password'
  patch 'password', to: 'passwords#update'
  get 'password/reset', to: 'password_resets#new'
  post 'password/reset', to: 'password_resets#create'
  get 'password/reset/edit', to: 'password_resets#edit'
  patch 'password/reset/edit', to: 'password_resets#update'

  post '/admin/send_notification', to: 'admin#send_notification'

  # Frontend calls
  get 'getUserData', to: 'api#get_user_data'
  get 'getStructures', to: 'api#get_structures'
  get 'getBonusActions', to: 'api#bonus_actions'
  get 'admin', to: 'admin#index'
  
  put 'update_settings', to: 'api#update_settings'

  put 'update_tag/:id', to: 'api#update_tag'
  post 'create_tag', to: 'api#new_tag'
  put 'delete_tag/:id', to: 'api#delete_tag'
  put 'update/rune/:id', to: 'api#update_rune'
  put 'update/structure/:id', to: 'api#update_structure'
  put 'fav/s/:id', to: 'api#fav_structure'
  put 'fav/r/:id', to: 'api#fav_rune'
  
  # DM calls
  put 'unlock/:id', to: 'api#unlock_structure'
  put 'level_party', to: 'api#level_party'
  put 'level/:id', to: 'api#level_char'
  
end
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
