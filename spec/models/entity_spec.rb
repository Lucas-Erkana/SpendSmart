require 'rails_helper'

RSpec.describe Entity, type: :model do
  let(:user) { User.create(name: 'John Doe') }
  subject do
    Entity.new(name: 'Food', amount: 10, author: user)
  end

  it 'should not be valid with name value is nil' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should not be valid if amount is less than 0' do
    subject.amount = -5
    expect(subject).to_not be_valid
  end

  it 'Should be valid' do
    expect(subject).to be_valid
  end
end
