Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    root 'users/sessions#new'

    get 'signin' => 'users/sessions#new'
    get 'signup' => 'users/registrations#new'
    get 'forgot_password' => 'users/passwords#new'
    get 'reset_password' => 'users/passwords#edit'
  end
end
