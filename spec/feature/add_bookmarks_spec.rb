feature 'Adding bookmarks' do
  scenario 'A user can add a bookmarks and see it displayed' do
    add_bbc_bookmark
    expect(page).to have_content "BBC"
  end
end
