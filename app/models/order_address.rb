class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :block, :building, :phone_number, :item_id, :user_id, :token, :order_id

  with_options presence: true do
    validates :token
    validates :item_id
    validates :user_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'はハイフンを使用してください' }
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'の桁が短いか長いです' }
    
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :phone_number, format: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block, building: building,
                   phone_number: phone_number, order_id: order.id)
  end
end
