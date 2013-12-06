Goevent::Application.routes.draw do

  # This line mounts Refinery's routes at the root of your application.
  # This means, any requests to the root URL of your application will go to Refinery::PagesController#home.
  # If you would like to change where this extension is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Refinery relies on it being the default of "refinery"

  devise_for :users
  

  get '/refinery', :to => 'refinery/events/admin/events#index'
  get 'event', :to=>'event#index'
  #get 'event/:id/show', :to => 'event#show'
  get '/refinery/events/transaction_history', :to => 'refinery/events/admin/events#transaction_history'
  get '/refinery/bank_details', :to => 'refinery/events/admin/events#bank_detail'
  post '/refinery/update_bank_details', :to => 'refinery/events/admin/events#update_bank_detail'
  
  get 'event/booking_history', :to => 'event#booking_history'
  get 'event/:id/view_registration', :to => 'event#view_registration'
  get 'event/support', :to => 'event#support'
  post 'event/support_feedback', :to => 'event#support_feedback'
  
  get 'event/:url', :to => 'event#show'
  post 'event/:id/registration_step1', :to => 'event#registration_step1'
  get 'event/:id/registration_step2', :to => 'event#registration_step2'
  post 'event/:id/attendee_details', :to => 'event#attendee_details'


  root :to => 'static#home'
  namespace :refinery do
    namespace :admin do
      resources :bank_details do
        member do
          get 'details'
        end
      end
      resources :users do
        collection do
          get 'upload_new_users'
          post 'upload_users'
          get 'imported_users'
          post 'import_user'
          get 'active_users'
          get 'inactive_users'
          get 'destroy_imported_user'
          get 'partners'
          get 'new_partner'
          post 'create_partner'
          get 'edit_partner'
          put 'update_partner'
        end
        member do                        
          get 'activate_user'
          get 'inactivate_user'
        end
      end
    end
  end  

  mount Refinery::Core::Engine, :at => '/'

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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
