Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/", to: "home#index"
  post "/", to: "home#createTransaction"
  get "/transactions", to: "transaction#index"
  delete "/transactions", to: "transaction#destroy"
  patch "/transactions", to: "transaction#update"
  get "/reports", to: "reports#index"
  get "/accounts", to: "account#index"
  post "/accounts", to: "account#create"
  delete "/accounts", to: "account#destroy"
  patch "/accounts", to: "account#update"
end
