class Shoppers::BasketsController < ApplicationController

	def create
		@items_basket = ItemsBasket.new
		@items_basket.basket = current_user.basket
		@items_basket.save
	end

	def destroy

	end

end