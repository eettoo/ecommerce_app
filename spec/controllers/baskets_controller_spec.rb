require 'rails_helper'

RSpec.describe Shoppers::BasketsController, type: :controller do

	describe 'GET #show' do

		it do

			user = User.create(email: 'someone@email.com', username: 'Someone', address: 'Somewhere')

			basket = Basket.create(user: user)
			
			params = {
				id: basket.id
			}
			
			get :show, params: params

			expect(assigns(:items_baskets)).to eq(ItemsBasket.all)
			expect(response).to render_template(:show)

		end

	end

end