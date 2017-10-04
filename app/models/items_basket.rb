class ItemsBasket < ApplicationRecord

	belongs_to :basket
	has_many :products
	validates(:quantity, presence: true)
	

end