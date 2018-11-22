require 'rails_helper'
RSpec.describe Message, type: :controller do
  describe "GET #index" do

    it 'assigns @message' do
      expect(assigns(:message)).to be_a_new(Message)

    it 'assigns @group' do
      expect(assigns(:group)).to eq group

    it "populates an array of message ordered by created at DESC" do
      messages = create_list(:message,10)
      get :index
      expect(assigns(:messages)).to match(messages)
    end

    it "render the index template" do
      get :index
      expect(response).to render_template :index
    end

    it 'redirects to new_user_session_path' do
  end
end
