require 'rails_helper'

RSpec.describe "entities/edit", type: :view do
  let(:entity) {
    Entity.create!(
      name: "MyString",
      amount: "9.99"
    )
  }

  before(:each) do
    assign(:entity, entity)
  end

  it "renders the edit entity form" do
    render

    assert_select "form[action=?][method=?]", entity_path(entity), "post" do

      assert_select "input[name=?]", "entity[name]"

      assert_select "input[name=?]", "entity[amount]"
    end
  end
end
