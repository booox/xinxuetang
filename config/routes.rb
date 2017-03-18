Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index"

  namespace :teacher do
    resources :courses do
      get 'syllabus' => "courses#syllabus"
    end

    resources :sections
  end

end
