class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|

    	t.string :name
    	t.text :description
    	t.decimal :price
    	t.string :gender
    	t.string :category
    	t.integer :quantity

    	t.timestamps


    end
  end
end
