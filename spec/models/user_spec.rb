require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {User.create!(email: "test@gmail.com", password: "password")}

  it "responds to role" do
    expect(user).to respond_to(:role)
  end
end
