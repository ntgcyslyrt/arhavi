Atakum::Application.routes.draw do

  get "probationlocations/index"

  get "instituterequests/index"

  get "students/index"

  get "institutes/index"

  get "roles/index"

  get "admins/index"

  get "admin/index"

  get "institute/index"

  root :to => 'home#index'

  #match "/auth/:provider/callback" => "admin#google_create"

  match "home" => "home#index"
  match "about" => "home#about"
  match "contact" => "home#contact"

  get  'home/register'
  post 'home/register_save'

  get   'home/pro_adv'
  get   'home/pro_doc'
  get  'home/institute_register'
  post 'home/institute_register_save'
  get  "dynamic_districts/:id" => "home#dynamic_districts"


  get 'login' => "home#login"
  post 'login' => "home#login"
  get  "logout" => "home#logout"


  match "/admin" => "admin#index"

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

    resources :institutes do
      get :destroy
      get :confirm
    end

    resources :instituterequests do
      get :destroy
      get :confirm
    end
    post "instituterequests/update"

    resources :probationlocations do
      get :destroy
      get :confirm
    end
    post "probationlocations/update"

    resources :admins do
      get :destroy
    end
    post "admins/update"

    resources :students do
      get :destroy
    end
    post "students/update"

  end

  match "user" => "user#index"
  namespace :user do
    get   'personal'
    post  'personal_save'
    get   'password'
    post  'password_save'
    get   'support'
    get   'institutes'
    get   'files'
    post  'files'
    get   'location'
    post  'location_save'
  end

  match "institute" => "institute#index"
  match "institute/student/:id" => "institute#student"
  namespace :institute do
    get   'personal'
    post  'personal_save'
    get   'password'
    post  'password_save'
    get   'query'
    post  'update'
    get   'request'
    post  'request_save'
    get   'support'
    get   'querypdf'
  end

end

