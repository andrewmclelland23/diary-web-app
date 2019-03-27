require 'bookmarks'

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do

    # Add the test data
    Bookmarks.add_bookmark('http://www.makersacademy.com', 'Makers')
    Bookmarks.add_bookmark('http://www.destroyallsoftware.com', 'Destroy Software')
    Bookmarks.add_bookmark('http://www.google.com', 'Google')

    visit('/bookmarks')

    expect(page).to have_content "Makers"
    expect(page).to have_content "Destroy Software"
    expect(page).to have_content "Google"
  end
end
