require 'rails_helper'

RSpec.describe '/traders', type: :request do
  let!(:admin) { create(:user, :admin) }
  let!(:trader) { create(:trader, :approved) }

  before :each do
    sign_in admin
    approved_user = create(:user, :trader, id: 3, email: 'approved@email.com')
    approved_user.trader.approved = true
    approved_user.save
  end

  describe 'GET /index' do
    it 'shows all the traders registered' do
      get traders_path

      expect(response).to have_http_status(:ok)
      expect(response.body).to include('List of Traders')
      expect(response.body).to include('juan@email.com')
      expect(response.body).to include('approved@email.com')
    end
  end

  describe 'GET /show' do
    it 'shows the traders details' do
      get trader_path(trader.id)

      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Account Overview')
      expect(response.body).to include('Personal Details')
      expect(response.body).to include('juan@email.com')
      expect(response.body).to include('Juan Cruz')
    end
  end

  describe 'GET / show_pending_approval' do
    it 'shows traders with pending approval' do
      get traders_pending_approval_path

      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Pending Approvals')
      expect(response.body).to include('juan@email.com')
      expect(response.body).not_to include('approved@email.com')
    end
  end
end
