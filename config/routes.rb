Rails.application.routes.draw do
  devise_for :users,
             defaults: { format: :json },
             controllers: {
               sessions: 'api/v1/sessions',
               registrations: 'api/v1/registrations'
             }

  namespace :api do
    namespace :v1 do
      devise_scope :user do
        post 'register', to: 'registrations#create'
        post 'login', to: 'sessions#create'
        delete 'logout', to: 'sessions#destroy'
        post 'refresh_token', to: 'sessions#refresh_token'
      end

      get 'current_user', to: 'users#current'
      resources :gardens, only: [:index, :show]
      resources :visits, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
