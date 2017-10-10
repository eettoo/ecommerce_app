class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|

    	t.string :payment_status
    	t.decimal :amount
    	t.date :ship_date
    	t.string :ship_status
    	t.date :payment_date
    	t.references :user
    end
  end
end
