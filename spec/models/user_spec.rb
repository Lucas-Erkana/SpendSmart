require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'validates presence of name' do
      user = User.new(email: 'test@example.com', password: 'password')
      expect(user).not_to be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'validates presence of email' do
      user = User.new(name: 'John Doe', password: 'password')
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'validates format of name' do
      user = User.new(name: '', email: 'test@example.com', password: 'password')
      expect(user).not_to be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'validates format of email' do
      user = User.new(name: 'John Doe', email: 'invalid_email', password: 'password')
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include('is invalid')
    end
  end
end
