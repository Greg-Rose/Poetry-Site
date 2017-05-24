require 'rails_helper'

# As an admin
# I want to edit a poem
# So that users can read the edited version
#
# Acceptance Criteria:
#   - I must be signed in
#   - I must go to the admin show page for the poem
#   - I can click Edit
#   - I must include the title and body of the poem

feature 'admin adds poem' do
  let!(:admin) do
    create(:admin)
  end

  let!(:poem) do
    create(:poem)
  end

  scenario 'successfully edit poem' do
    sign_in admin
    visit root_path
    click_link 'Admin'
    click_link poem.title
    click_link 'Edit'
    fill_in 'Title', with: "New Title"
    fill_in_trix_editor("poem_body_trix_input_poem_#{poem.id}", "New Body")
    click_button 'Submit'

    expect(page).to have_content "New Title"
    expect(page).to have_content "New Body"
    expect(page).to have_link 'Edit'
    expect(page).to have_link 'Delete'
  end

  scenario 'unsuccessfully edit poem' do
    sign_in admin
    visit root_path
    click_link 'Admin'
    click_link poem.title
    click_link 'Edit'
    fill_in 'Title', with: "New Title"
    fill_in_trix_editor("poem_body_trix_input_poem_#{poem.id}", nil)
    click_button 'Submit'

    expect(page).to have_content "You must include the body of your poem"
    expect(page).to have_button 'Submit'
  end
end
