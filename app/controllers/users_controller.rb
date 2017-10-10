class UsersController < ApplicationController

	before_action :authenticate_user!
	before_action :set_users


	def show
	end

	def edit
	end

	def update
		if @user.update(user_params)
			redirect_to @user
		else
			flash.now[:alert] = "Breathe in & out"
			render :edit
		end
	end

	private

	def set_users
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:name, :avatar, :status, :background)
	end

end