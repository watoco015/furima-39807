class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_one_attached :image

  belongs_to :category, class_name: 'Category'
  belongs_to :condition, class_name: 'Condition'
  belongs_to :delivery_fee, class_name: 'DeliveryFee'
  belongs_to :prefecture, class_name: 'Prefecture'
  belongs_to :shipping_day, class_name: 'ShippingDay'

  validates :item_name, presence: true
  validates :category_id, presence: true,
             exclusion: { in: [1], message: "must be other than 1" }
  validates :note, presence: true
  validates :condition_id, presence: true,
             exclusion: { in: [1], message: "must be other than 1" }
  validates :delivery_fee_id, presence: true,
             exclusion: { in: [1], message: "must be other than 1" }
  validates :prefecture_id, presence: true,
             exclusion: { in: [1], message: "must be other than 1" }
  validates :shipping_day_id, presence: true,
             exclusion: { in: [1], message: "must be other than 1" }
  validates :price, presence: true,
  numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }


end
