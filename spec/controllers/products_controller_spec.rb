require 'rails_helper'

RSpec.describe Shoppers::ProductsController, type: :controller do

	describe 'GET #index' do

		it do
			
			get :index
			expect(assigns(:products)).to eq(Product.all)
			expect(response).to render_template(:index)
		end

	end

end