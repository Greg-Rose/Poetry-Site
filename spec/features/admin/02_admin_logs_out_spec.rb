require 'rails_helper'

# As an authenticated admin
# I want to sign out
# So that no one else can use my admin privileges
#
# Acceptance Criteria:
#   - I must be signed in
#   - I must be able to click sign out on any page

feature 'admin signs out' do
  let!(:admin) do
    create(:admin)
  end

  scenario 'successfully sign out' do
    sign_in admin
    visit root_path
    click_link 'Sign Out'

    expect(page).to_not have_link 'Sign Out'
    expect(page).to_not have_link 'Admin'
    expect(page).to_not have_link 'Account'
  end
end
