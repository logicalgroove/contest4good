Contest4good::Application.routes.draw do

  namespace :teachers do
    resources :events
    resources :students
    resources :subjects
    resources :teachers
    get "/", to: "teachers#home", as: :home, via: :get
  end

  namespace :students do
    resources :events
    resources :students
    resources :subjects
    get "/", to: "students#home", as: :home, via: :get
  end


  resources :events


  #devise_for :students, :controllers => {:registrations => "registrations", :invitations => "invitations"}, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
  #devise_for :teachers, :controllers => {:registrations => "admin/registrations", :invitations => "admin/invitations"}, :path => '', :path_names => {:sign_in => 'admin/login', :sign_out => 'admin/logout'}

  devise_for :teachers#, :controllers => {:registrations => "registrations", :invitations => "admin/invitations"}, :path => '', :path_names => {:sign_in => 'admin/login', :sign_out => 'admin/logout'}
  devise_for :students#, :controllers => {:registrations => "registrations", :invitations => "invitations"}, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}


  #devise_scope :teacher do
  #  get "admin/login", :to => "teachers/sessions#login"
  #  get "admin/logout", :to => "teachers/sessions#logout"
  #end
  #get "admin/", :to => "teachers/sessions#login"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root :to => "home#index"

end
