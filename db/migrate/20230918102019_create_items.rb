class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :user,         null: false, foreign_key: true
      t.string :item_name,        null: false
      t.integer :category_id,     null: false,numericality: { other_than: 1 , message: "can't be blank"} 
      t.text :note,               null: false
      t.integer :condition_id,    null: false,numericality: { other_than: 1 , message: "can't be blank"} 
      t.integer :delivery_fee_id, null: false,numericality: { other_than: 1 , message: "can't be blank"} 
      t.integer :prefecture_id,   null: false,numericality: { other_than: 1 , message: "can't be blank"} 
      t.integer :shipping_day_id, null: false,numericality: { other_than: 1 , message: "can't be blank"} 
      t.integer :price,           null: false

      t.timestamps
    end
  end
end
