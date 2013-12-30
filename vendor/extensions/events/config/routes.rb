Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :events do
    resources :events, :path => '', :only => [:index, :show]
  end
  namespace :events, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      root :to => 'events#index'
    end
  end
  # Admin routes
  namespace :events, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do      
      resources :events, :except => :show do
        member do
          put 'update_position'
          put 'update_banner_position'
          get 'venue'
          post 'venue_info'
          get 'venue_image'
          put 'venue_image_info'
          get 'contact'
          post 'contact_info'
          get 'publish'
          get 'revoke'
          get 'schedule'
          put 'save_schedule'
          get 'terms'
          put 'save_terms'
          get 'parking_info'
          put 'save_parking_info'
        end
        resources :tickets do
          get 'update_ticket_status'
        end
        resources :outlets
        resources :faqs
        resources :artists
        resources :galleries
        resources :registration
        resources :restaurants
        collection do
          post :update_positions
        end
      end
    end
  end

end
