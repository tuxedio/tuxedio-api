Rails.application.routes.draw do
  root to: 'welcome#index'

  devise_for :users, skip: [:sessions, :passwords],
    path_prefix: 'v1'

  scope module: :api, defaults: { format: :json } do
    namespace :v1 do
      resources :experiences
      devise_scope :user do
        post 'login' => 'sessions#create', as: :login
        delete 'logout' => 'sessions#destroy', as: :logout
      end
    end
  end
end
