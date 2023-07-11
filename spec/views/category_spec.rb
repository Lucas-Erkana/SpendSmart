require 'rails_helper'

RSpec.describe 'Categoy', type: :system do
  it 'allows a user to successfully sign up' do
    visit unauthenticated_root_path
    click_link 'SIGN UP'

    fill_in 'Name', with: 'John Doe'
    fill_in 'Email', with: 'john.doe@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button 'Next'

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_current_path(authenticated_root_path)
  end

  it 'redirects the user to the New Category page after clicking on New category link' do
    visit unauthenticated_root_path
    click_link 'SIGN UP'

    fill_in 'Name', with: 'John Doe'
    fill_in 'Email', with: 'john.doe@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button 'Next'

    expect(page).to have_link('New category')

    click_link 'New category'
    expect(page).to have_content('NEW CATEGORY')
    expect(page).to have_button('Create Category')
  end

  it 'A user can create a new category' do
    visit unauthenticated_root_path
    click_link 'SIGN UP'

    fill_in 'Name', with: 'John Doe'
    fill_in 'Email', with: 'john.doe@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button 'Next'

    expect(page).to have_link('New category')

    click_link 'New category'
    fill_in 'Name', with: 'Food'
    fill_in 'Icon', with: 'https://tinyurl.com/jshcp3ce'
    click_button 'Create Category'
    expect(page).to have_content('Category was successfully created.')
  end
end
