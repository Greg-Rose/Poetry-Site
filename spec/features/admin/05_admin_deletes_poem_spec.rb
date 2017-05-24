require 'rails_helper'

# As an admin
# I want to delete a poem
# So that users can no longer read it
#
# Acceptance Criteria:
#   - I must be signed in
#   - I must go to the admin show page for the poem
#   - I can click Delete

feature 'admin deletes poem' do
  let!(:admin) do
    create(:admin)
  end

  let!(:poem) do
    create(:poem)
  end

  scenario 'successfully delete poem' do
    sign_in admin
    visit root_path
    click_link 'Admin'
    click_link poem.title
    click_link 'Delete'

    expect(page).to_not have_content poem.title

    visit poems_path
    expect(page).to_not have_content poem.title
  end
end
