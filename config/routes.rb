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
      delete 'events/delete_many', to: 'events#destroy_many'
      get 'events/by_month', to: 'events#by_month'
      resources :events do
        resources :todo_lists
        resources :notifications
        delete 'todo_lists/delete_many', to: 'todo_lists#destroy_many'
        delete 'notifications/delete_many', to: 'notifications#destroy_many'
      end
    end
  end

  root "home#index"
end
