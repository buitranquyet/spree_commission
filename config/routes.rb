Spree::Core::Engine.add_routes do
  namespace :admin do
    resource :commission_settings, only: [:edit, :update]
  end
end