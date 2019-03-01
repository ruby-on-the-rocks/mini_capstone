Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  # namespace :api do
  #   get "/photos" => "photos#index"
  # end
  namespace :api do
    get "/all_products_url" => "products#all_products_method"
    get "/one_product_query_url" => "products#one_product_method"
    get "/one_product_segment_url/:id" => "products#one_product_method"
    post "/one_product_body_url" => "products#one_product_method"
  end
end
