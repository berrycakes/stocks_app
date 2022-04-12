require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    let!(:user) { User.new(
      email: 'test@email.com',
      password: 'asdfjkl;'
    ) }

    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end

    context 'email' do
      it 'is not valid with wrong format' do
        user.email = 'test'
  
        expect(user).to_not be_valid
        expect(user.errors).to be_present
        expect(user.errors.to_hash.keys).to include(:email)
        expect(user.errors[:email]).to include('is invalid')
      end

      it 'is not valid if not unique' do
        User.create(email: 'test@email.com', password: 'testtest')
  
        expect(user).to_not be_valid
        expect(user.errors).to be_present
        expect(user.errors.to_hash.keys).to include(:email)
        expect(user.errors[:email]).to include('has already been taken')
      end
    end

    context 'password' do
      it 'is invalid when it is too short' do
        user.password = 'asd'
  
        expect(user).to_not be_valid
        expect(user.errors).to be_present
        expect(user.errors.to_hash.keys).to include(:password)
        expect(user.errors[:password]).to include('is too short (minimum is 6 characters)')
      end

      it 'is invalid if blank' do
        user.password = ''
  
        expect(user).to_not be_valid
        expect(user.errors).to be_present
        expect(user.errors.to_hash.keys).to include(:password)
        expect(user.errors[:password]).to include("can't be blank")
      end
    end
  end
  context 'creation of user' do
    it 'builds an associated trader if role is trader' do
      user = User.create(email: 'trader@email.com', password: 'testtest', role: 'trader')

      expect(user.trader).to_not be_nil
      expect(user.trader.wallet).to_not be_nil
    end
    it 'builds an associated admin if role is admin' do
      user = User.create(email: 'admin@email.com', password: 'testadmin', role: 'admin')

      expect(user.admin).to_not be_nil
    end
  end
end
