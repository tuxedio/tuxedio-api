Rails.application.routes.draw do
  root to: 'welcome#index'

  devise_for :users, skip: [:sessions, :registrations, :passwords],
    path_prefix: 'v1'

  scope module: :api, defaults: { format: :json } do
    namespace :v1 do
      devise_scope :user do
        post 'login' => 'sessions#create', as: :login
        delete 'logout' => 'sessions#destroy', as: :logout
        post 'register' => 'registrations#create', as: :register
        delete 'delete_account' => 'registrations#destroy', as: :delete_account
      end
    end
  end
end
