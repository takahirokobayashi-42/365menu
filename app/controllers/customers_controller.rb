class CustomersController < ApplicationController

  def show
    @master_dishes=MasterDish.where(customer_id: current_customer.id)
    @master_menus=MasterMenu.where(customer_id: current_customer.id)
  end

  def edit
  end

  def update
    if current_customer.update(customer_params)
      redirect_to customers_customer_path
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
