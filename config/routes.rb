Rails.application.routes.draw do

  resources :monster_teams
  resources :user_teams
  resources :monsters
  resources :teams

  resources :web_services do
    collection do
      post :sign_in
      get :get_all_monsters
      get :get_all_teams
      get :get_monster_by_team
      get :get_team_by_monster
      post :save_monster
      post :save_team
      post :save_monster_teams
    end
  end

  #devise_for :users

  resources :dashboard do
    collection do
      get :home
    end
  end

  root :to => 'dashboard#home'

  devise_for :users, :controllers => {
      :sessions => "users/sessions",
      :confirmation => "users/confirmations",
      :passwords => "users/passwords",
      :registrations => "users/registrations",
      :unlocks => "users/unlocks",
      :omniauth_callbacks => "users/omniauth_callbacks"
  }

  devise_scope :user do
    get "sign_in" => "users/sessions#new"
    get "sign_up" => "users/registrations#new"
    get "sign_out" => "users/sessions#destroy"
    get "change_password" => "users/registrations#change_password"
    post "update_password" => "users/registrations#update_password"
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
