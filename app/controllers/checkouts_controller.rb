class CheckoutsController < ApplicationController
  TRANSACTION_SUCCESS_STATUSES = [
    Braintree::Transaction::Status::Authorizing,
    Braintree::Transaction::Status::Authorized,
    Braintree::Transaction::Status::Settled,
    Braintree::Transaction::Status::SettlementConfirmed,
    Braintree::Transaction::Status::SettlementPending,
    Braintree::Transaction::Status::Settling,
    Braintree::Transaction::Status::SubmittedForSettlement,
  ]

  def new
    @client_token = Braintree::ClientToken.generate
    @items_baskets = ItemsBasket.all
  end

  def show
    @transaction = Braintree::Transaction.find(params[:id])
    @result = _create_result_hash(@transaction)
  end

  def create
    amount = params["amount"] # In production you should not take amounts directly from clients
    nonce = params["payment_method_nonce"]

    result = Braintree::Transaction.sale(
      amount: amount,
      payment_method_nonce: nonce,
      :options => {
        :submit_for_settlement => true
      }
    )

    if result.success? || result.transaction
      @ordernew = Order.new
      @ordernew.user_id = current_user.id
      # @itemspaidid = ItemsPaid.where(order_id: @ordernew.id).pluck(:id)
      # not sure if the above will work.
      # @ordernew.items_paid_ids = @itemspaidid
      @ordernew.payment_status = "paid"
      @basket = Basket.find_by(user_id: current_user.id)
      @ordernew.payment_date = @basket.updated_at
      @ordernew.ship_date = @basket.updated_at + 10.days
      # @ordernew.amount = @itemspaidid.pluck(:price).sum
      @ship_status = []
      @ordernew.ship_status = @ship_status

      @basketid = Basket.find_by(user_id: current_user.id)
      @itemsbasket = ItemsBasket.where(basket_id: @basketid)
    
      if @ordernew.save
        flash[:success] = "Your Order is Successful! And we are preparing your package"
        @itemsbasket.each do |f|

          @itemspaidnew = ItemsPaid.new
          @itemspaidnew.product_id = f.product_id
          @itemspaidnew.order = @ordernew
          @itemspaidnew.price = Product.find_by(id: @itemspaidnew.product_id).price
          @itemspaidnew.quantity = f.quantity

          updated_product_amt = f.product.quantity - f.quantity
          f.product.update(quantity: updated_product_amt)

          @itemspaidnew.save
        end
        @ordernew[:amount] = @ordernew.items_paids.pluck(:price).sum
        @ordernew.save

        ItemsBasket.destroy_all
        Basket.destroy_all

        redirect_to shoppers_orders_path
      else
        flash[:danger] = "Your Order is not successfully created, please check if payment has been successfully made"
        redirect_to shoppers_baskets_path
      end

    else
      error_messages = result.errors.map { |error| "Error: #{error.code}: #{error.message}" }
      flash[:error] = error_messages
      redirect_to new_checkout_path
    end
  end

  def _create_result_hash(transaction)
    status = transaction.status

    if TRANSACTION_SUCCESS_STATUSES.include? status
      result_hash = {
        :header => "Sweet Success!",
        :icon => "success",
        :message => "Your test transaction has been successfully processed. See the Braintree API response and try again."
      }
    else
      result_hash = {
        :header => "Transaction Failed",
        :icon => "fail",
        :message => "Your test transaction has a status of #{status}. See the Braintree API response and try again."
      }
    end
  end
end
