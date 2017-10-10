class Shoppers::BasketsController < ApplicationController

	before_action :create_current_basket

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

	private

	def create_current_basket
		if current_user.baskets.exists?
		else
			@basket = Basket.new
			@basket.user = current_user
			@basket.save
		end
	end

end