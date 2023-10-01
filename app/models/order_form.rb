class OrderForm
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :prefecture_id, :city, :block, :building, :phone_number, :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_code,
               format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid" }
    validates :prefecture_id, 
               exclusion: { in: [1], message: "must be other than 1" }

    validates :city
    validates :block
    validates :phone_number,
               format: { with: /\A\d{10,11}\z/,message: "is invalid"}
    validates :token
  end
  def save(params,user_id)
    order = Order.create(item_id: params[:item_id].to_i, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order.id)
  end
end