class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :store_id
      t.string :store_name
      t.integer :user_id
      t.integer :status
      t.string :reject_reason
      t.string :content
      t.datetime :accepted_at
      t.datetime :finished_at
      t.integer :order_fee
      t.integer :delivery_fee
      t.integer :items_fee
      t.integer :tip

      t.timestamps null: false
    end
  end
end
