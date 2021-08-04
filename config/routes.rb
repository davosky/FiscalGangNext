Rails.application.routes.draw do
  resources :requests
  root to: 'dash#index'

  get 'dash/index'
  get 'dash/credits'
  get 'dash/howto'

  devise_for :operators, skip: [:registrations]
  as :operator do
    get 'operators/edit' => 'devise/registrations#edit', :as => 'edit_operator_registration'
    put 'operators' => 'devise/registrations#update', :as => 'operator_registration'
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
