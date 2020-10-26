Rails.application.routes.draw do
  root 'records#index'
  resources :records, only: [:index, :new, :create]

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end 
end
