Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index"

  # for admin

  # for teacher
  namespace :teacher do
    resources :courses do
      get 'syllabus' => "courses#syllabus"
    end

    resources :sections
    resources :posts
    resources :tasks
  end

  # for user
  resources :courses do
    get 'dashboard' => "courses#dashboard"
  end





end
