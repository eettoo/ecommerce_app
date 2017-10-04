class CreateItemsPaids < ActiveRecord::Migration[5.1]
  def change
    create_table :items_paids do |t|

    	t.decimal :price
    	t.integer :quantity
    	t.references :product, foreign_key: true
    	t.references :order, foreign_key: true
    end
  end
end
