class OrderMailer < ApplicationMailer

	def order_confirmation(order)
		@orderconfirmation = order
		@totalamount = @orderconfirmation.items_paids.pluck(:price).sum.to_i

		mail to: @orderconfirmation.user.email, subject: "Sweet Success! Your Order ##{@orderconfirmation.id} is Successful!"

	end

end