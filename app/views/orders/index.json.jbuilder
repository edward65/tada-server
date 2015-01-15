json.array!(@orders) do |order|
  json.extract! order, :id, :store_id, :store_name, :user_id, :status, :reject_reason, :content, :accepted_at, :finished_at, :order_fee, :delivery_fee, :items_fee, :tip
  json.url order_url(order, format: :json)
end
