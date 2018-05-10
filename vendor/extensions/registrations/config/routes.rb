Refinery::Core::Engine.routes.draw do
  # Frontend routes
  namespace :registrations do

    resources :registrations, :path => '', :only => [:index, :new, :create] do
      collection do
        get :thank_you
      end
    end
  end

  # Admin routes
  namespace :registrations, :path => '' do
    namespace :admin, :path => "#{Refinery::Core.backend_route}" do
      resources :registrations do 
  end

      scope :path => 'registrations' do
        resources :settings, :only => [:edit, :update]
      end
    end
  end
end

