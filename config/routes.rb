Contest4good::Application.routes.draw do
  resources :events

  resources :subjects

  devise_for :students
  devise_for :teachers
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root :to => "home#index"

end
