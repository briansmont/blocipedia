require 'rails_helper'
require 'stripe_mock'

RSpec.describe ChargesController, type: :controller do

  describe "charges" do
    let(:stripe_helper) {StripeMock.create_test_helper}
    before {StripeMock.start }
    after {StripeMock.stop }
    
    it "creates a stripe customer" do
      customer = Stripe::Customer.create({
        email: "test@bloc.com",
        card: stripe_helper.generate_card_token
      })
      expect(customer.email).to eq("test@bloc.com")
    end
    
    it "creates a stripe plan" do
      plan = stripe_helper.create_plan(:id => "standard_plan", :amount => 10)
      expect(plan.id).to eq("standard_plan")
      expect(plan.amount).to eq(10)
    end
    
    it "mocks a decline card error" do
      StripeMock.prepare_card_error(:card_declined)
      
      expect { Stripe::Charge.create(amount: 100, currency: 'usd')}.to raise_error {|e|
          expect(e).to be_a Stripe::CardError
          expect(e.http_status).to eq(402)
          expect(e.code).to eq('card_declined')
        }
      
    end
    
  end
  
  


end
