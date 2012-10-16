Clorg::Application.routes.draw do

  get "password_resets/create"

  get "password_resets/edit"

  get "password_resets/update"

  resources :events
  resources :tags

  match '/calendar(/:year(/:month))' => 'calendar#index', :as => :calendar, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}
  match '/calendar/week/(:year(/:weeknumber))' => 'calendar#show', :as => :week_calendar, :constraints => {:year => /\d{4}/, :weeknumber => /\d{1,2}/}

  
  resources :messages do
    resources :comments
  end

  match '/messages', :to => 'messages#index'
  match '/messages/tag/:tag', :to => 'messages#index', :as => :messages_tagged_by

  resources :users do
    member do
      get :activate
    end
  end

  resources :password_resets
  resources :sessions, :only => [:new, :create, :destroy]


  match '/signup', :to => 'users#new'
  match '/login', :to => 'sessions#new'
  match '/logout', :to => 'sessions#destroy'

  match '/about', :to => 'pages#about'
  match '/contact', :to => 'pages#contact'

  # for bootstrap icons
  match '/img/:name', :to => redirect('/assets/%{name}.png')

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

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

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'pages#home'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
