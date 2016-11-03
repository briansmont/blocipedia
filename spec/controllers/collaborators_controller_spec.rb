require 'rails_helper'

RSpec.describe CollaboratorsController, type: :controller do
  
  let(:my_wiki) {Wiki.create!(title: "Wiki Title", body: "Wiki Body", private: true)}
  let(:my_user) {User.create!(name: "Brian Mont", email: "briansmont@gmail.com", password: "password", password_confirmation: "password")}
  let(:collaborator) {Collaborator.create!(wiki_id: my_wiki.id, user_id: my_user.id)}
  
  before(:each) do
    sign_in my_user
  end
  
  describe "POST create" do
    it "increases the Collaborator.count by 1" do
      expect{ post :create, collaborator: {wiki_id: my_wiki.id, user_id: my_user.id}}.to change(Collaborator, :count).by(1)
    end
    it "assigns the new collaborator to @collaborators" do
      post :create, collaborator: {wiki_id: my_wiki.id, user_id: my_user.id}
      expect(assigns(:collaborator)).to eq Collaborator.last
    end
  end
  
  describe "DELETE destroy" do
    it "deletes the collab entry" do
      delete :destroy, wiki_id: my_wiki.id, id: collaborator.id
      count = Collaborator.where({id: collaborator.id}).size
      expect(count).to eq(0)
    end
    it "redirects to the @wiki view" do
      delete :destroy, wiki_id: my_wiki.id, id: collaborator.id
      expect(response).to redirect_to my_wiki
    end
  end
  
end
