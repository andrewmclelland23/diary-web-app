require 'bookmarks'

feature 'Clicking on bookmarks titles that link to bookmarks' do
  scenario "When I click on a bookmark title, i'm taken to the url" do

    # Add the test data
    Bookmarks.add_bookmark('http://www.makersacademy.com', 'Makers')

    visit('/bookmarks')
    expect(page).to have_link 'Makers', href: 'http://www.makersacademy.com'
  end
end
