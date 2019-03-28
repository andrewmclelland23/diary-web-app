feature 'deleting bookmarks' do
  scenario 'A user can delete a bookmarks and see that its gone' do
    add_2_bookmarks
    visit '/bookmarks'
    first('.bookmark').click_button 'Delete'

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('BBC', href: 'http://www.bbc.co.uk')
  end
end
