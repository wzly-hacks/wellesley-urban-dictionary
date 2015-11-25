Rails.application.routes.draw do

  devise_for :users 
  resources :users, only: [:update]

  devise_scope :user do
    get 'login' => 'devise/sessions#new'
    post 'login' => 'devise/sessions#create'
  end

  resources :topics do 
    resources :entries 
    # except: [:index]
  end

  get 'about' => 'welcome#about'

  # get 'index' => 'entries#index'
  
  root to: 'welcome#index'
end
