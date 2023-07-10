require 'rails_helper'

RSpec.describe 'entities/show', type: :view do
  before(:each) do
    assign(:entity, Entity.create!(
                      name: 'Name',
                      amount: '9.99'
                    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/9.99/)
  end
end
