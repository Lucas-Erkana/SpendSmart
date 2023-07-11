require 'rails_helper'

RSpec.describe '/entity', type: :system do
  include Devise::Test::IntegrationHelpers

  describe 'GET /new' do
    before do
      @user = User.create(name: 'Lucas', email: 'lucas@gmail.com', password: '143143', password_confirmation: '143143')
      sign_in @user
      @category = Category.create!(name: 'category', icon: 'img', author_id: @user.id)
      get new_user_entity_path(@user, category_id: @category.id)
    end

    it 'response to html' do
      expect(response.content_type).to include 'text/html'
    end
  end
end
