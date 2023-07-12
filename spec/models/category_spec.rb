require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.create(name: 'Lucas Erkana', email: 'invalid_email', password: 'password') }
  subject do
    Category.new(name: 'Food', icon: 'food.jpng', author: user)
  end

  it 'should not be valid with name value set to nil' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should not be valid with icon value set to  nil' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end

  it 'should be valid ' do
    expect(subject).to be_valid
  end
end
