Air::Application.routes.draw do
  resources :users
  resource :session
  resources :places

  root to: "homes#show"

end