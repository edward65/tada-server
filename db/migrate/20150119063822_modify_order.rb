class ModifyOrder < ActiveRecord::Migration
  def change

  	add_column :orders, :reject_title, :string
    add_column :orders, :receive_place, :string
	add_column :orders, :receive_address, :string
	add_column :orders, :receive_phone, :string
	add_column :orders, :receive_note, :string
  end
end
