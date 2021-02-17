class CustomersController < ApplicationController

  def show
    @customer=Customer.find(params[:id])
    @master_dishes=MasterDish.where(customer_id: @customer)
    @master_dishes=MasterDish.page(params[:page]).reverse_order.per(5)
    @master_menus=MasterMenu.where(customer_id: @customer)
    @master_menus=MasterMenu.page(params[:page]).reverse_order.per(5)
  end

  def update
    if current_customer.update(customer_params)
      redirect_to customer_path
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def hide
    current_customer.update(is_unsubscribed: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :encrypted_password)
  end
end
