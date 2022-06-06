Rails.application.routes.draw do
  devise_for :users,
    skip: %i[registrations sessions],
    defaults: { format: :json }

  namespace :auth do
    devise_scope :user do
      resource :sessions, only: %i[create]
      resource :registrations, only: %i[create]
    end
  end

  namespace :rest do
    namespace :v1 do
      resources :events do
        resources :todo_lists
      end
    end
  end

  root "home#index"
end
