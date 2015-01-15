class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :location
      t.string :tele
      t.string :verify_code
      t.string :fb_token
      t.string :notification_token
      t.string :invite_code
      t.string :email
      t.integer :status, :limit => 1

      t.timestamps null: false
    end
  end
end
