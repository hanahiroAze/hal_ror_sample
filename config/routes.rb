Rails.application.routes.draw do
  get  "/products" => "products#index", as: :products
  post "/products" => "products#create"

  get    "/products/:id" => "products#show", as: :product
  put    "/products/:id" => "products#update"
  patch  "/products/:id" => "products#update"
  delete "/products/:id" => "products#destroy"

  get   "/orders" => "orders#index", as: :orders
  post  "/orders" => "orders#create"
  match "/orders", to: "orders#option", via: [:options]

  get  "/orders/:id" => "orders#show", as: :order
end
