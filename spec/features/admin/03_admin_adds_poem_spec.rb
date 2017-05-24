require 'rails_helper'

# As an admin
# I want to add a poem
# So that users can read it
#
# Acceptance Criteria:
#   - I must be signed in
#   - I must include the title and body of the poem

feature 'admin adds poem' do
  let!(:admin) do
    create(:admin)
  end

  let!(:poem) do
    build(:poem)
  end

  scenario 'successfully add poem' do
    sign_in admin
    visit root_path
    click_link 'Admin'
    click_link 'Add Poem'
    fill_in 'Title', with: poem.title
    fill_in_trix_editor('poem_body_trix_input_poem', poem.body)
    click_button 'Submit'

    expect(page).to have_content poem.title
    expect(page).to have_content poem.body
    expect(page).to have_link 'Edit'
    expect(page).to have_link 'Delete'
  end

  scenario 'unsuccessfully add poem' do
    sign_in admin
    visit root_path
    click_link 'Admin'
    click_link 'Add Poem'
    click_button 'Submit'

    expect(page).to have_content "You must include the title and body of your poem"
    expect(page).to have_button 'Submit'
  end
end
