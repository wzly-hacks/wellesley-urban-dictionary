Rails.application.routes.draw do


  devise_for :users 

  devise_scope :user do
    get 'login' => 'devise/sessions#new'
    post 'login' => 'devise/sessions#create'
  end

  resources :entries
  resources :topics
  get 'about' => 'welcome#about'

  get 'index' => 'entries#index'
  
  root to: 'welcome#index'
end
