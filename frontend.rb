require "http"
require "tty-table"

response = HTTP.get("http://localhost:3000/api/all_products_url")
products = response.parse
pp products

headers = ['name','price']
rows = []
products.each do |product|
  rows << [product["name"], product["price"]]
end
table = TTY::Table.new headers, rows
puts table.render(:ascii)
