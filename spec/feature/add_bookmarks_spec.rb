feature 'Adding bookmarks' do
  scenario 'A user can add a bookmarks and see it displayed' do
    visit '/'
    click_link 'Add Bookmark'
    fill_in('bookmark', with: 'http://www.bbc.co.uk')
    click_button 'Submit'
    expect(page).to have_content "http://www.bbc.co.uk"
  end
end
