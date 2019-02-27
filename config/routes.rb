Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  # namespace :api do
  #   get "/photos" => "photos#index"
  # end
  namespace :api do
    get "/all_products_url" => "products#all_products_method"
    get "/first_product_url" => "products#first_product_method"
    get "/second_product_url" => "products#second_product_method"
  end
end
