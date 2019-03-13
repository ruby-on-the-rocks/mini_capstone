json.array! @orders.each do |order|
  json.id order.id
  json.user_id order.user_id
  json.product order.product
  json.quantity order.quantity
  json.subtotal order.subtotal
  json.tax order.tax
  json.total order.total
end
