Rails.application.routes.draw do

  devise_for :users
  resources :entries
  get 'about' => 'welcome#about'

  get 'index' => 'entries#index'
  
  root to: 'welcome#index'
end
