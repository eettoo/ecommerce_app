module PagesHelper

	def current_basket

		if user_signed_in?
			current_user.baskets.first
		else
			Basket.new(id: Basket.last.id + 1)
		end

	end

end
