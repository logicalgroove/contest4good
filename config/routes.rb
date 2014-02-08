Contest4good::Application.routes.draw do
  resources :events

  resources :subjects

  devise_for :students, :controllers => {:registrations => "registrations", :invitations => "invitations"}, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}

  #devise_for :teachers, :controllers => {:registrations => "registrations", :invitations => "invitations"}, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
  devise_scope :teacher do
    get "admin/login", :to => "teachers/sessions#login"
    get "admin/logout", :to => "teachers/sessions#logout"
  end
  get "admin/", :to => "teachers/sessions#login"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root :to => "home#index"

end
