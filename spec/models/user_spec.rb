require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    let!(:user) { User.new }

    it 'is  not a valid email' do
      user.email = 's'

      expect(user).to_not be_valid
      expect(user.errors).to be_present
      expect(user.errors.to_hash.keys).to include(:email)
      expect(user.errors[:email]).to include('is invalid')
    end
  end
end
