require 'rails_helper'

# As a user
# I can't access admin features
# So that I can't alter the site
#
# Acceptance Criteria:
#   - I must not be able to view admin(Sabrina) index, show, new, or edit page

feature 'user can not view admin features' do
  scenario 'can not view admin index page' do
    visit sabrina_poems_path

    expect(page).to have_current_path root_path
    expect(page).to_not have_content "Add Poem"
  end

  scenario 'can not view admin new page' do
    visit new_sabrina_poem_path

    expect(page).to have_current_path root_path
    expect(page).to_not have_content "Submit"
  end
end
