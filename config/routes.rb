Rails.application.routes.draw do
  get 'omniauth/sessions'
  get 'users/profile'
  get 'welcome/index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  get 'users/:id' => 'users#profile'

  resources :posts do
    member do
      put "like", to: "posts#upvote"
      put "unlike", to: "posts#downvote"
    end
  end

  get 'users/:user_id/posts/new' => 'posts#new'

  root to: "welcome#index"

  #root to: "users#new"
  get "/auth/github" => "users#new"
  #get :create, provider: "github"
  get "/auth/:provider/callback" => "sessions#create"
  get "/signout" => "sessions#destroy", :as => :signout

  # devise_scope :user do
  #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
