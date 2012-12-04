Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :publications do
    resources :items, :path => '', :only => [:index]
  end

  # Admin routes
  namespace :publications, :path => '' do
    namespace :admin, :path => 'refinery' do
      scope :path => 'publications' do
        resources :items, :except => :show do
          collection do
            post :update_positions
          end
        end
        resources :authors, :except => :show do
          collection do
            post :update_positions
          end
        end
      end
    end
  end

end
