require 'rails_helper'

RSpec.describe 'entities/new', type: :view do
  before(:each) do
    assign(:entity, Entity.new(
                      name: 'MyString',
                      amount: '9.99'
                    ))
  end

  it 'renders new entity form' do
    render

    assert_select 'form[action=?][method=?]', entities_path, 'post' do
      assert_select 'input[name=?]', 'entity[name]'

      assert_select 'input[name=?]', 'entity[amount]'
    end
  end
end
