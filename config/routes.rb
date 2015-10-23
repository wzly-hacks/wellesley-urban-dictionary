Rails.application.routes.draw do

  resources :entries
  get 'about' => 'welcome#about'

  get 'index' => 'entries#index'
  
  root to: 'welcome#index'
end
