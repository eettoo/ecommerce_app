module PagesHelper

	def current_basket

		if user_signed_in?
			
			if current_user.baskets.exists?
				current_user.baskets.first
			else
				@basket = Basket.new
				@basket.user = current_user
				@basket.save
				@basket
			end

		else
			Basket.new(id: Basket.last.id + 1)
		end

	end

end
