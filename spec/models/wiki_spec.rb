require 'rails_helper'

RSpec.describe Wiki, type: :model do
  let(:wiki) {Wiki.create!(title: "New wiki", body: "New body") }
  
  describe "attributes" do
    it "has title & body attributes" do
      expect(wiki).to have_attributes(title: "New wiki", body: "New body")
    end
  end
end
