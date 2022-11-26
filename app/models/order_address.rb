class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture, :city, :address, :building_name, :phone_number, :token, :price

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format:{with:/\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture, numericality: {other_than: 1}
    validates :city
    validates :address
    validates :phone_number, format:{with:/\A[0-9]{10,11}\z/}
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    DeliveryAddress.create(post_code: post_code, prefecture: prefecture, city: city, address: address,building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end