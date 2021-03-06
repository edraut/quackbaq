Quackbaq::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action
  match 'pages/:id' => 'pages#show', :as => 'page'
  match 'sign_in' => 'user_sessions#new'
  match 'sign_out' => 'user_sessions#destroy'
  resource :user_session
  resources :users do
    member do
      get 'activate'
      post 'request_password_reset'
      get 'forgot_password'
      get 'sign_up_1'
      get 'sign_up_2'
      get 'sign_up_3'
      get 'sign_up_4'
      get 'payment_options'
      get 'credit_card'
      get 'paypal'
      get 'account_settings'
      get 'my_status'
    end
  end
  resources :bids
  resources :auctions do
    collection do
      get 'my'
    end
  end
  resources :user_auctions
  match 'category/:id' => 'categories#show', :as => 'category'
  match 'sign_up' => 'users#new'
  match 'my_account' => 'users#show'
  match 'hookbox/:action', :controller => 'hookbox'
  match 'bid/place', :controller => 'bids', :action => 'update', :as => 'place_bid'
  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
namespace :admin_area do
  resources :auctions
  resources :items
  resources :classic_auctions, :controller => 'auctions'
  resources :content_elements
  match 'dashboard' => 'auctions#index', :as => :dashboard
end
  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"
  root :to => "auctions#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
