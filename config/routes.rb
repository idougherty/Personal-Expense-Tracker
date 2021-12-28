Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/", to: "home#index"
  get "/transactions", to: "transaction#index"
  get "/reports", to: "reports#index"
  get "/accounts", to: "account#index"
end
