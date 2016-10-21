class ChargesController < ApplicationController
  
  def create
    @user = current_user
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )
    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: 10_00,
      description: "Premium Member - #{current_user.email}",
      currency: 'usd'
    )
    
    @user.update_attributes(role: "premium_member")
    flash[:notice] = "Congratulations #{current_user.email}! You are now a Premium Member with new abilities!"
    redirect_to root_path
    
    rescue Stripe::CardError => email
      flash[:alert] = e.message
      redirect_to new_charge_path
    
  end
  
  def new
    @stripe_btn_data = {
      key: "#{Rails.configuration.stripe[:publishable_key]}",
      description: "Premium User - #{current_user.email}",
      amount: 10_00
    }
  end
  
  
  
end
