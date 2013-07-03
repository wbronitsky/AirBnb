Air::Application.routes.draw do
  resources :users
  resource :session
  resources :places do
    resources :place_rental_requests do
      member do
        get "approve", "deny"
      end
    end
  end

  root to: "homes#show"

end