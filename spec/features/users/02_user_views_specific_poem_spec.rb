require 'rails_helper'

# As a user
# I want to view a poem
# So that I can read the poem
#
# Acceptance Criteria:
#   - I can click on any of the poems at the index page to view that poem
#   - Each poems show page shows the poems title and body
#   - There is a Back button to take me back to the index page

feature 'user views poem' do
  let!(:poems) do
    create_list(:poem, 3)
  end

  scenario 'click on title of a poem and view that poem' do
    visit root_path
    click_link poems[1].title

    expect(page).to have_content poems[1].title
    expect(page).to have_content poems[1].body
    expect(page).to have_link(nil, href: "#{poems_path}")
  end
end
