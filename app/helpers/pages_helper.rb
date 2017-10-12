module PagesHelper

	def current_basket
		
		if user_signed_in?

			if current_user.baskets.exists?
				Basket.find_by(user: current_user)
			else
				@basket = Basket.new
				@basket.user = current_user
				@basket.save
				@basket
			end
		
		else

			Basket.new(id: 1)
			
		end
	end

end
