class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions


  validates :item_name, presence: true
  validates :category_id, presence: true
  validates :note, presence: true
  validates :condition_id, presence: true
  validates :delivery_fee_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_day_id, presence: true
  validates :price, presence: true

  has_one_attached :image

  belongs_to :category, class_name: 'Category'
  belongs_to :condition, class_name: 'Condition'
  belongs_to :delivery_fee, class_name: 'DeliveryFee'
  belongs_to :prefecture, class_name: 'Prefecture'
  belongs_to :shipping_day, class_name: 'ShippingDay'
end
