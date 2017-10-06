class CreateItemsBaskets < ActiveRecord::Migration[5.1]
  def change
    create_table :items_baskets do |t|

    	t.references :basket, foreign_key: true
    	t.references :product, foreign_key: true
    	t.integer :quantity

    	t.timestamps

    end
  end
end
