Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'dashboard' => 'courses#index'
  root "courses#index"

  resources :courses do
    member do
      get 'syllabus'
    end
    resources :sections, only: [:new, :create, :edit, :update, :destroy] do
      resources :posts, only: [:show, :new, :create, :edit, :update, :destroy]
    end
    # resources :sections, shallow: true
  end

  resources :assignments


  resources :posts
end
