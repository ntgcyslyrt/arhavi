Atakum::Application.routes.draw do

  get "admins/index"

  get "admin/index"

  get "institute/index"

  root :to => 'home#index'

  match "/auth/:provider/callback" => "admin#google_create"

  match "home" => "home#index"
  match "about" => "home#about"
  match "contact" => "home#contact"

  get  'home/register'
  post 'home/register_save'
  get  'home/donations'
    
  get  'home/institute_register'
  post 'home/institute_register_save'
  get  "dynamic_districts/:id" => "home#dynamic_districts"

  match "/admin" => "admin#index"
  get  'admin/login'
  get  'admin/logout'
  post 'admin/sign_in'

  namespace :admin do
    get  'support'
    get  'personal'
    post 'personal_save'
    get  'statistic'

    resources :roles do
      get :destroy
      get :confirm
    end
    post "roles/update"

    resources :donors do
      get :destroy
      get :confirm
    end

    resources :institutes do
      get :destroy
      get :confirm
    end

    resources :donorrequests do
      get :destroy
      get :confirm
    end

    resources :bloodmakings do
      get :destroy
      get :confirm
    end

    resources :admins do
      get :destroy
    end
    post "admins/update"

  end


  match "user" => "user#index"
  namespace :user do
    get   "logout"
    get   "login"
    post  "sign_in"
    get   'personal'
    post  'personal_save'
    get   'password'
    post  'password_save'
    get   'support'
    get   'institutes'
  end

  match "institute" => "institute#index"
  match "institute/student/:id" => "institute#student"
  namespace :institute do
    get   "logout"
    get   "login"
    post  "sign_in"
    get   'personal'
    post  'personal_save'
    get   'password'
    post  'password_save'
    get   'query'
    post  'update'
    post  'bloodmaking'
    get   'support'
    get   'querypdf'
  end

end

