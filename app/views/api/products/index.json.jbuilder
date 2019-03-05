json.array! @products.each do |product|
  json.id product.id
  json.name product.name
  json.price product.price
  json.image_url product.image_url
  json.description product.description

  json.is_discounted product.is_discounted?
  json.tax product.tax
  json.total product.total
end
