class CreateBuyers < ActiveRecord::Migration[7.0]
  def change
    create_table :buyers do |t|
      t.integer :price  ,null: false
      t.timestamps
    end
  end
end
