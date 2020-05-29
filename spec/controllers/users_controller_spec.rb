require 'rails_helper'

describe ::UsersController, type: :controller do
  let(:end_user) {create :end_user}

  describe 'GET new' do

    before(:each) { end_user }

    it 'renders the new page' do
      get :new
      expect(response).to have_http_status(:success)
    end

  end

  describe 'POST create' do

    before(:each) { end_user }

    it 'render the Sign In Page' do
      post :create, :params => { :user => { username: end_user.username, email: end_user.email, password: end_user.password } }
      expect(response).to have_http_status(:success)
    end

  end

end
