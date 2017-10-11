class Basket < ApplicationRecord

	belongs_to :user
	has_many :items_baskets	

	def total_unpaid_price(total_items)
		
		total = []
		total_items.each do |item|
			subtotal = item.quantity * item.product.price
			total << subtotal
		end

		total.inject{ |first_num, consec_num| first_num + consec_num }

	end

	# def current_basket

	# 	if user_signed_in?
	# 		current_user.baskets.first
	# 	else
	# 		new_basket = Basket.new
	# 		new_basket(id: Basket.last.id + 1)
	# 	end

	# end

end