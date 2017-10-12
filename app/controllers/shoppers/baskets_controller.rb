class Shoppers::BasketsController < ApplicationController

	before_action :create_current_user_basket

	def show
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

	def create_current_user_basket
		if user_signed_in?

			if current_user.baskets.exists?
				current_user.baskets.first				
			else
				@basket = Basket.new
				@basket.user = current_user
				@basket.save
			end
		
		else
			Basket.new(id: Basket.last.id + 1)
		end

	end

end