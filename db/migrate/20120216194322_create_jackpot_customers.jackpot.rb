# This migration comes from jackpot (originally 20120103211153)
class CreateJackpotCustomers < ActiveRecord::Migration
  def change
    create_table :jackpot_customers do |t|
      t.string :email
      t.text :description
      t.integer :subscription_id

      t.timestamps
    end
  end
end
