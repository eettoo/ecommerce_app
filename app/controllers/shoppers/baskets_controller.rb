class Shoppers::BasketsController < ApplicationController

	def show
		@basket = current_user.baskets.first
		@items_baskets = ItemsBasket.all
	end

	def create
		@basket = Basket.new
		@basket.user = current_user
		@basket.save
	end

	def destroy
		@basket = Basket.find(params[:id])
		@basket.destroy
	end

end