require 'rails_helper'

# As a user
# I want to view a list of poems
# So that I can pick a poem to read
#
# Acceptance Criteria:
#   - At the index page I can see a list of poems
#   - The list has the title of each poem and a thumbnail of the poem
#   - Each title is a link to that poems show page

feature 'user views list of poems' do
  let!(:poems) do
    create_list(:poem, 3)
  end

  scenario 'views poems' do
    visit root_path

    poems.each do |poem|
      expect(page).to have_link poem.title
    end
  end
end
