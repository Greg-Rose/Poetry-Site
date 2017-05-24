require 'rails_helper'

# As an unauthenticated Admin
# I want to sign in
# So that I can use my admin privileges
#
# Acceptance Criteria:
#   - I must visit a special url "/sabrina"
#   - I must provide my email
#   - I must provide my password
#   - If I do not provide the above that matches an Admin account,
#     I get an error message
#   - If I provide valid information, I am authenticated

feature 'admin signs in' do
  let!(:admin) do
    create(:admin)
  end

  scenario 'valid username and password provided' do
    visit new_admin_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'

    expect(page).to have_content 'Admin'
    expect(page).to have_content 'Account'
    expect(page).to have_content 'Sign Out'
  end

  scenario 'invalid info provided' do
    visit new_admin_session_path
    click_button 'Log in'

    expect(page).to have_content 'Invalid Email or password'
    expect(page).to_not have_content 'Sign Out'
  end
end
