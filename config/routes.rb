Rails.application.routes.draw do
	devise_scope :user do
    # Redirects signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end
  devise_for :users
  root 'employees#index'
	resources :employees
end
