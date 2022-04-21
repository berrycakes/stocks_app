require 'rails_helper'

RSpec.describe '/users', type: :request do
  let!(:trader) { create(:trader, :approved) }

  describe 'GET /sign_in' do
    it 'shows the login page' do
      get new_user_session_path

      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Log in')
      expect(response.body).to include('Email')
      expect(response.body).to include('Password')
    end
  end

  describe 'POST /sign_in' do
    it 'logs user in with valid credential' do
      post user_session_path, params: { user: { email: 'juan@email.com', password: 'password' } }

      expect(response).to redirect_to(root_path)
      follow_redirect!

      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Signed in successfully')
      expect(response.body).to include('My Portfolio')
      expect(response.body).to include('Wallet')
      expect(response.body).to include('Account')
    end

    it 'does not log user in with invalid credential' do
      post user_session_path, params: { user: { email: 'wrong@email.com', password: 'password' } }

      expect(response).to have_http_status(:ok)

      expect(response.body).to include('Invalid Email or password')
    end
  end

  describe 'DELETE /sign_out' do
    it 'logs user out' do
      sign_in trader.user
      delete destroy_user_session_path

      expect(response).to redirect_to(root_path)
      follow_redirect!

      expect(response).to redirect_to(new_user_session_path)
      follow_redirect!

      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Log in')
      expect(response.body).to include('Email')
      expect(response.body).to include('Password')
      expect(response.body).not_to include('Wallet')
      expect(response.body).not_to include('Account')
    end
  end
end
