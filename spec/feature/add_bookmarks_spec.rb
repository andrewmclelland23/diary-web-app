feature 'Adding bookmarks' do
  scenario 'A user can add a bookmarks and see it displayed' do
    visit '/'
    click_link 'Add Bookmark'
    fill_in('url', with: 'http://www.bbc.co.uk')
    fill_in('title', with: 'BBC')
    click_button 'Submit'
    expect(page).to have_content "BBC"
  end
end
