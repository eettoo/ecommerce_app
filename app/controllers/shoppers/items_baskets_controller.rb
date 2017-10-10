class Shoppers::ItemsBasketsController < ApplicationController

	def create
		@basket = current_user.baskets.first
		@items_basket = @basket.items_baskets.build(items_basket_params)
		@items_basket.save
		redirect_to shoppers_product_path(id: @items_basket.product.id)
	end

	def destroy
		@items_basket = ItemsBasket.find(params[:items_basket_id])
		@items_basket.destroy
		redirect_to shoppers_basket_path(id: current_user.baskets.first)
	end

	def update
		@items_basket = ItemsBasket.find(params[:items_basket_id])
		@items_basket.update(items_basket_params)
		redirect_to shoppers_basket_path(id: current_user.baskets.first)
	end


	private

	def items_basket_params
		params.require(:items_basket).permit(:quantity, :product_id)
	end

end

